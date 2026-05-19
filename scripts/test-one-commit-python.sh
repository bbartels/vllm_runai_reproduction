#!/usr/bin/env bash
set -euo pipefail

# Test one vLLM commit using a host Python install, not Docker.
# Intended to run on latpoc32 as user benjaminba.

if [[ $# -lt 1 ]]; then
  echo "usage: $0 <commit> [output-dir]" >&2
  exit 2
fi

COMMIT="$1"
OUT_ROOT="${2:-/home/benjaminba/vllm-bisect-results}"
SRC="${SRC:-/home/benjaminba/vllm-bisect-src}"
VENV="${VENV:-/home/benjaminba/vllm-bisect-venv}"
PYTHON="$VENV/bin/python"
UV="$VENV/bin/uv"
PORT="${PORT:-8011}"
MAX_TIME="${MAX_TIME:-60}"
READY_TIMEOUT="${READY_TIMEOUT:-900}"
HF_HOME_DIR="${HF_HOME_DIR:-/home/benjaminba/.cache/huggingface}"
REPRO_SCRIPT="${REPRO_SCRIPT:-/home/benjaminba/opencode-repro/repro-hi-tools-1-5.sh}"
CUDA_HOME_DIR="${CUDA_HOME_DIR:-/usr/local/cuda-13.0}"
PID_FILE="/tmp/vllm-bisect-server.pid"

export CUDA_HOME="$CUDA_HOME_DIR"
export PATH="$CUDA_HOME/bin:$PATH"

mkdir -p "$OUT_ROOT"
FULL_COMMIT="$(git -C "$SRC" rev-parse "$COMMIT")"
SHORT_COMMIT="$(git -C "$SRC" rev-parse --short=9 "$FULL_COMMIT")"
PRECOMPILED_WHEEL_COMMIT="${PRECOMPILED_WHEEL_COMMIT:-$FULL_COMMIT}"
OUT_DIR="$OUT_ROOT/$SHORT_COMMIT"
mkdir -p "$OUT_DIR"

INSTALL_LOG="$OUT_DIR/install.log"
SERVER_LOG="$OUT_DIR/server.log"
REPRO_LOG="$OUT_DIR/repro.raw.txt"
RESULT="$OUT_DIR/result.txt"
VERSIONS="$OUT_DIR/versions.txt"

stop_server() {
  if [[ -f "$PID_FILE" ]]; then
    local old_pid
    old_pid="$(<"$PID_FILE")"
    if [[ -n "$old_pid" ]] && kill -0 "$old_pid" >/dev/null 2>&1; then
      kill -- "-$old_pid" >/dev/null 2>&1 || kill "$old_pid" >/dev/null 2>&1 || true
      sleep 5
      kill -9 -- "-$old_pid" >/dev/null 2>&1 || kill -9 "$old_pid" >/dev/null 2>&1 || true
    fi
    rm -f "$PID_FILE"
  fi
}

cleanup() {
  stop_server
}
trap cleanup EXIT

stop_server

{
  echo "commit=$FULL_COMMIT"
  echo "precompiled_wheel_commit=$PRECOMPILED_WHEEL_COMMIT"
  git -C "$SRC" show -s --format='subject=%s%ncommit_date=%cI' "$FULL_COMMIT"
  echo "started_at=$(date -Iseconds)"
} >"$OUT_DIR/meta.txt"

git -C "$SRC" checkout --detach "$FULL_COMMIT" >>"$INSTALL_LOG" 2>&1

(
  cd "$SRC"
  export VLLM_USE_PRECOMPILED=1
  export VLLM_PRECOMPILED_WHEEL_COMMIT="$PRECOMPILED_WHEEL_COMMIT"
  if ! "$UV" pip install --python "$PYTHON" --torch-backend=auto -e .; then
    echo "commit-specific precompiled install failed; retrying with VLLM_PRECOMPILED_WHEEL_COMMIT=nightly" >&2
    export VLLM_PRECOMPILED_WHEEL_COMMIT=nightly
    "$UV" pip install --python "$PYTHON" --torch-backend=auto -e .
  fi
  "$UV" pip install --python "$PYTHON" \
    'pandas' \
    'transformers==5.5.0' \
    'runai-model-streamer==0.15.8' \
    'runai-model-streamer-s3==0.15.8' \
    'runai-model-streamer-gcs==0.15.8' \
    'runai-model-streamer-azure==0.15.8'
) >>"$INSTALL_LOG" 2>&1

"$PYTHON" - <<'PY' >"$VERSIONS" 2>&1
import importlib.metadata as metadata
for pkg in [
    "vllm",
    "torch",
    "transformers",
    "huggingface-hub",
    "runai-model-streamer",
    "runai-model-streamer-s3",
    "runai-model-streamer-gcs",
    "runai-model-streamer-azure",
    "pandas",
]:
    try:
        print(f"{pkg}=={metadata.version(pkg)}")
    except metadata.PackageNotFoundError:
        print(f"{pkg}=MISSING")
PY

setsid env \
  HF_HOME="$HF_HOME_DIR" \
  CUDA_HOME="$CUDA_HOME" \
  PATH="$PATH" \
  VLLM_DEEP_GEMM_WARMUP=skip \
  VLLM_LOGGING_LEVEL=INFO \
  "$VENV/bin/vllm" serve zai-org/GLM-5.1-FP8 \
    --host 0.0.0.0 \
    --port "$PORT" \
    --trust-remote-code \
    --chat-template-content-format=string \
    --tensor-parallel-size 8 \
    --tool-call-parser glm47 \
    --enable-auto-tool-choice \
    --reasoning-parser glm45 \
    --load-format=runai_streamer \
    --model-loader-extra-config='{"concurrency": 140, "distributed": true}' \
    --enforce-eager >"$SERVER_LOG" 2>&1 &
SERVER_PID=$!
echo "$SERVER_PID" >"$PID_FILE"

READY=0
for i in $(seq 1 "$READY_TIMEOUT"); do
  if curl -fsS "http://127.0.0.1:${PORT}/v1/models" >/dev/null 2>&1; then
    READY=1
    echo "ready_after_seconds=$i" >>"$OUT_DIR/meta.txt"
    break
  fi
  if ! kill -0 "$SERVER_PID" >/dev/null 2>&1; then
    echo "server_exited_before_ready=1" >>"$OUT_DIR/meta.txt"
    break
  fi
  sleep 1
done

if [[ "$READY" != "1" ]]; then
  echo "infra-fail" >"$RESULT"
  "$PYTHON" - "$OUT_DIR" "$FULL_COMMIT" <<'PY'
import pathlib
import sys

out = pathlib.Path(sys.argv[1])
commit = sys.argv[2]
server = out / "server.log"
lines = server.read_text(errors="replace").splitlines() if server.exists() else []
summary = out / "summary.md"
summary.write_text(
    f"# {commit}\n\n"
    "Result: infra-fail\n\n"
    "Server did not become ready. Last server log lines:\n\n"
    "```text\n" + "\n".join(lines[-160:]) + "\n```\n"
)
PY
  exit 0
fi

set +e
VLLM_URL="http://127.0.0.1:${PORT}/v1/chat/completions" \
MAX_TIME="$MAX_TIME" \
  "$REPRO_SCRIPT" >"$REPRO_LOG" 2>&1
REPRO_STATUS=$?
set -e
echo "repro_status=$REPRO_STATUS" >>"$OUT_DIR/meta.txt"

"$PYTHON" - "$OUT_DIR" "$FULL_COMMIT" <<'PY'
import json
import pathlib
import re
import sys

out = pathlib.Path(sys.argv[1])
commit = sys.argv[2]
raw_path = out / "repro.raw.txt"
server_path = out / "server.log"
versions_path = out / "versions.txt"
meta_path = out / "meta.txt"
result_path = out / "result.txt"
summary_path = out / "summary.md"

raw = raw_path.read_text(errors="replace") if raw_path.exists() else ""
done = "data: [DONE]" in raw
chunks = []

def collect_strings(value):
    if isinstance(value, str):
        chunks.append(value)
    elif isinstance(value, list):
        for item in value:
            collect_strings(item)
    elif isinstance(value, dict):
        for key, item in value.items():
            if key in {"role"}:
                continue
            collect_strings(item)

for line in raw.splitlines():
    line = line.strip()
    if not line.startswith("data: "):
        continue
    payload = line[len("data: "):].strip()
    if payload == "[DONE]":
        continue
    try:
        obj = json.loads(payload)
    except json.JSONDecodeError:
        continue
    for choice in obj.get("choices", []):
        delta = choice.get("delta") or choice.get("message") or {}
        collect_strings(delta)

text = "".join(chunks)
lower = text.lower()
non_ascii = sum(1 for ch in text if ord(ch) > 127)
non_ascii_ratio = non_ascii / max(len(text), 1)
bad_markers = [
    "probability",
    "editable",
    "filepath",
    "thread blocking",
    "multi-thread",
    "ченко",
    "itäts",
    "<span",
    "</span>",
    "recursive gpu",
]
has_bad_marker = any(marker in lower for marker in bad_markers)
has_greeting = bool(re.search(r"\b(hi|hello|help|assist|greeting|there)\b", lower))

if has_bad_marker or (len(text) > 500 and non_ascii_ratio > 0.08) or (not done and len(text) > 1200):
    classification = "bad"
elif done and has_greeting and len(text) < 2500:
    classification = "good"
else:
    classification = "unknown"

result_path.write_text(classification + "\n")

def read_tail(path, n):
    if not path.exists():
        return ""
    return "\n".join(path.read_text(errors="replace").splitlines()[-n:])

excerpt = text[:3000]
raw_excerpt = raw[:3000]
summary = f"""# {commit}

Result: {classification}

Metrics:

- done: {done}
- decoded_text_chars: {len(text)}
- non_ascii_ratio: {non_ascii_ratio:.4f}
- has_greeting: {has_greeting}
- has_bad_marker: {has_bad_marker}

Versions:

```text
{versions_path.read_text(errors='replace') if versions_path.exists() else ''}
```

Meta:

```text
{meta_path.read_text(errors='replace') if meta_path.exists() else ''}
```

Decoded Stream Excerpt:

```text
{excerpt}
```

Raw Stream Excerpt:

```text
{raw_excerpt}
```

Server Log Tail:

```text
{read_tail(server_path, 120)}
```
"""
summary_path.write_text(summary)
PY

cat "$RESULT"
