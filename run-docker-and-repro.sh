#!/usr/bin/env bash
set -euo pipefail

# End-to-end minimal repro for GLM-5.1-FP8 garbage output with vLLM + RunAI streamer.
# Requirements: docker with NVIDIA runtime, bash, curl.
#
# This script:
#   1. Starts vLLM v0.20.0 with RunAI streamer + loader config.
#   2. Waits for the OpenAI-compatible server.
#   3. Sends a minimal request: user says "hi" + 5 OpenCode tool schemas.
#   4. Streams the response for MAX_TIME seconds; garbage should appear quickly.
#
# Tunables:
#   IMAGE=vllm/vllm-openai:v0.20.0-x86_64-cu130-ubuntu2404
#   CONTAINER_NAME=vllm-glm-runai-repro
#   PORT=8000
#   MAX_TIME=60
#   READY_TIMEOUT=400
#   KEEP_CONTAINER=1     # do not remove container at exit

IMAGE="${IMAGE:-vllm/vllm-openai:v0.20.0-x86_64-cu130-ubuntu2404}"
CONTAINER_NAME="${CONTAINER_NAME:-vllm-glm-runai-repro}"
PORT="${PORT:-8000}"
MAX_TIME="${MAX_TIME:-60}"
READY_TIMEOUT="${READY_TIMEOUT:-400}"
KEEP_CONTAINER="${KEEP_CONTAINER:-0}"
HF_CACHE="${HF_CACHE:-$HOME/.cache/huggingface}"
VLLM_URL="http://127.0.0.1:${PORT}/v1/chat/completions"
MODELS_URL="http://127.0.0.1:${PORT}/v1/models"

cleanup() {
  if [[ "$KEEP_CONTAINER" != "1" ]]; then
    sudo docker rm -f "$CONTAINER_NAME" >/dev/null 2>&1 || true
  fi
}
trap cleanup EXIT

mkdir -p "$HF_CACHE"

for existing in "$CONTAINER_NAME" vllm-glm-5-1 vllm-glm-internal-like; do
  sudo docker rm -f "$existing" >/dev/null 2>&1 || true
done

sudo docker run -d \
  --name "$CONTAINER_NAME" \
  --gpus all \
  --ipc=host \
  --ulimit memlock=-1 \
  --ulimit stack=67108864 \
  -p "${PORT}:8000" \
  -v "$HF_CACHE:/root/.cache/huggingface" \
  -e HF_HOME=/root/.cache/huggingface \
  -e VLLM_DEEP_GEMM_WARMUP=skip \
  "$IMAGE" \
  zai-org/GLM-5.1-FP8 \
  --host 0.0.0.0 \
  --port 8000 \
  --trust-remote-code \
  --chat-template-content-format=string \
  --tensor-parallel-size 8 \
  --tool-call-parser glm47 \
  --enable-auto-tool-choice \
  --reasoning-parser glm45 \
  --load-format=runai_streamer \
  --model-loader-extra-config='{"concurrency": 140, "distributed": true}' \
  --enforce-eager >/dev/null

echo "Started $CONTAINER_NAME from $IMAGE on port $PORT" >&2

echo "Waiting for vLLM readiness at $MODELS_URL ..." >&2
for i in $(seq 1 "$READY_TIMEOUT"); do
  if curl -fsS "$MODELS_URL" >/dev/null 2>&1; then
    echo "vLLM is ready after $i seconds" >&2
    break
  fi
  if ! sudo docker ps --format '{{.Names}}' | grep -qx "$CONTAINER_NAME"; then
    echo "Container exited before readiness. Logs:" >&2
    sudo docker logs --tail 200 "$CONTAINER_NAME" >&2 || true
    exit 1
  fi
  if [[ "$i" == "$READY_TIMEOUT" ]]; then
    echo "Timed out waiting for vLLM readiness. Logs:" >&2
    sudo docker logs --tail 200 "$CONTAINER_NAME" >&2 || true
    exit 1
  fi
  sleep 1
done

echo "Sending minimal repro request to $VLLM_URL for $MAX_TIME seconds ..." >&2
set +e
curl -sS -N --max-time "$MAX_TIME" \
  -X POST \
  -H 'Content-Type: application/json' \
  --data-binary @- \
  "$VLLM_URL" <<'JSON'
{"model":"zai-org/GLM-5.1-FP8","max_tokens":32000,"messages":[{"role":"user","content":"hi"}],"tools":[{"type":"function","function":{"name":"bash","description":"Executes a given bash command in a persistent shell session with optional timeout, ensuring proper handling and security measures.\n\nBe aware: OS: linux, Shell: bash\n\nAll commands run in the current working directory by default. Use the `workdir` parameter if you need to run a command in a different directory. AVOID using `cd <directory> && <command>` patterns - use `workdir` instead.\n\nUse `/tmp/opencode` for temporary work outside the workspace. This directory has already been created, already exists, and is pre-approved for external directory access.\n\nIMPORTANT: This tool is for terminal operations like git, npm, docker, etc. DO NOT use it for file operations (reading, writing, editing, searching, finding files) - use the specialized tools for this instead.\n\nBefore executing the command, please follow these steps:\n\n1. Directory Verification:\n   - If the command will create new directories or files, first use `ls` to verify the parent directory exists and is the correct location\n   - For example, before running \"mkdir foo/bar\", first use `ls foo` to check that \"foo\" exists and is the intended parent directory\n\n2. Command Execution:\n   - Always quote file paths that contain spaces with double quotes (e.g., rm \"path with spaces/file.txt\")\n   - Examples of proper quoting:\n     - mkdir \"/Users/name/My Documents\" (correct)\n     - mkdir /Users/name/My Documents (incorrect - will fail)\n     - python \"/path/with spaces/script.py\" (correct)\n     - python /path/with spaces/script.py (incorrect - will fail)\n   - After ensuring proper quoting, execute the command.\n   - Capture the output of the command.\n\nUsage notes:\n  - The command argument is required.\n  - You can specify an optional timeout in milliseconds. If not specified, commands will time out after 120000ms (2 minutes).\n  - It is very helpful if you write a clear, concise description of what this command does in 5-10 words.\n  - If the output exceeds 2000 lines or 51200 bytes, it will be truncated and the full output will be written to a file. You can use Read with offset/limit to read specific sections or Grep to search the full content. Do NOT use `head`, `tail`, or other truncation commands to limit output; the full output will already be captured to a file for more precise searching.\n\n  - Avoid using Bash with the `find`, `grep`, `cat`, `head`, `tail`, `sed`, `awk`, or `echo` commands, unless explicitly instructed or when these commands are truly necessary for the task. Instead, always prefer using the dedicated tools for these commands:\n    - File search: Use Glob (NOT find or ls)\n    - Content search: Use Grep (NOT grep or rg)\n    - Read files: Use Read (NOT cat/head/tail)\n    - Edit files: Use Edit (NOT sed/awk)\n    - Write files: Use Write (NOT echo >/cat <<EOF)\n    - Communication: Output text directly (NOT echo/printf)\n  - When issuing multiple commands:\n    - If the commands are independent and can run in parallel, make multiple bash tool calls in a single message. For example, if you need to run \"git status\" and \"git diff\", send a single message with two bash tool calls in parallel.\n    - If the commands depend on each other and must run sequentially, use a single Bash call with '&&' to chain them together (e.g., `git add . && git commit -m \"message\" && git push`). For instance, if one operation must complete before another starts (like mkdir before cp, Write before Bash for git operations, or git add before git commit), run these operations sequentially instead.\n    - Use ';' only when you need to run commands sequentially but don't care if earlier commands fail\n    - DO NOT use newlines to separate commands (newlines are ok in quoted strings)\n  - AVOID using `cd <directory> && <command>`. Use the `workdir` parameter to change directories instead.\n    <good-example>\n    Use workdir=\"/foo/bar\" with command: pytest tests\n    </good-example>\n    <bad-example>\n    cd /foo/bar && pytest tests\n    </bad-example>\n\n# Git and GitHub\n- Only commit, amend, push, or create PRs when explicitly requested.\n- Before committing, inspect `git status`, `git diff`, and `git log --oneline -10`; stage only intended files and never commit secrets.\n- Write a concise commit message that matches the repo style.\n- Do not update git config, skip hooks, use interactive `-i`, force-push, or create empty commits unless explicitly requested.\n- If a commit fails or hooks reject it, fix the issue and create a new commit; do not amend the failed commit.\n- Before creating a PR, inspect status, diff, remote tracking, recent commits, and the diff from the base branch.\n- Review all commits included in the PR, not just the latest commit.\n- Use `gh` for GitHub tasks, including PRs, issues, checks, and releases; return the PR URL when done.\n","parameters":{"$schema":"https://json-schema.org/draft/2020-12/schema","type":"object","properties":{"command":{"type":"string","description":"The command to execute"},"timeout":{"minimum":-9007199254740991,"exclusiveMinimum":0,"type":"integer","maximum":9007199254740991,"description":"Optional timeout in milliseconds"},"workdir":{"type":"string","description":"The working directory to run the command in. Defaults to the current directory. Use this instead of 'cd' commands."},"description":{"type":"string","description":"Clear, concise description of what this command does in 5-10 words. Examples:\nInput: ls\nOutput: Lists files in current directory\n\nInput: git status\nOutput: Shows working tree status\n\nInput: npm install\nOutput: Installs package dependencies\n\nInput: mkdir foo\nOutput: Creates directory 'foo'"}},"required":["command","description"]}}},{"type":"function","function":{"name":"edit","description":"Performs exact string replacements in files. \n\nUsage:\n- You must use your `Read` tool at least once in the conversation before editing. This tool will error if you attempt an edit without reading the file. \n- When editing text from Read tool output, ensure you preserve the exact indentation (tabs/spaces) as it appears AFTER the line number prefix. The line number prefix format is: line number + colon + space (e.g., `1: `). Everything after that space is the actual file content to match. Never include any part of the line number prefix in the oldString or newString.\n- ALWAYS prefer editing existing files in the codebase. NEVER write new files unless explicitly required.\n- Only use emojis if the user explicitly requests it. Avoid adding emojis to files unless asked.\n- The edit will FAIL if `oldString` is not found in the file with an error \"oldString not found in content\".\n- The edit will FAIL if `oldString` is found multiple times in the file with an error \"Found multiple matches for oldString. Provide more surrounding lines in oldString to identify the correct match.\" Either provide a larger string with more surrounding context to make it unique or use `replaceAll` to change every instance of `oldString`. \n- Use `replaceAll` for replacing and renaming strings across the file. This parameter is useful if you want to rename a variable for instance.\n","parameters":{"$schema":"https://json-schema.org/draft/2020-12/schema","type":"object","properties":{"filePath":{"type":"string","description":"The absolute path to the file to modify"},"oldString":{"type":"string","description":"The text to replace"},"newString":{"type":"string","description":"The text to replace it with (must be different from oldString)"},"replaceAll":{"type":"boolean","description":"Replace all occurrences of oldString (default false)"}},"required":["filePath","oldString","newString"]}}},{"type":"function","function":{"name":"glob","description":"- Fast file pattern matching tool that works with any codebase size\n- Supports glob patterns like \"**/*.js\" or \"src/**/*.ts\"\n- Returns matching file paths sorted by modification time\n- Use this tool when you need to find files by name patterns\n- When you are doing an open-ended search that may require multiple rounds of globbing and grepping, use the Task tool instead\n- You have the capability to call multiple tools in a single response. It is always better to speculatively perform multiple searches as a batch that are potentially useful.\n","parameters":{"$schema":"https://json-schema.org/draft/2020-12/schema","type":"object","properties":{"pattern":{"type":"string","description":"The glob pattern to match files against"},"path":{"type":"string","description":"The directory to search in. If not specified, the current working directory will be used. IMPORTANT: Omit this field to use the default directory. DO NOT enter \"undefined\" or \"null\" - simply omit it for the default behavior. Must be a valid directory path if provided."}},"required":["pattern"]}}},{"type":"function","function":{"name":"grep","description":"- Fast content search tool that works with any codebase size\n- Searches file contents using regular expressions\n- Supports full regex syntax (eg. \"log.*Error\", \"function\\s+\\w+\", etc.)\n- Filter files by pattern with the include parameter (eg. \"*.js\", \"*.{ts,tsx}\")\n- Returns file paths and line numbers with at least one match sorted by modification time\n- Use this tool when you need to find files containing specific patterns\n- If you need to identify/count the number of matches within files, use the Bash tool with `rg` (ripgrep) directly. Do NOT use `grep`.\n- When you are doing an open-ended search that may require multiple rounds of globbing and grepping, use the Task tool instead\n","parameters":{"$schema":"https://json-schema.org/draft/2020-12/schema","type":"object","properties":{"pattern":{"type":"string","description":"The regex pattern to search for in file contents"},"path":{"type":"string","description":"The directory to search in. Defaults to the current working directory."},"include":{"type":"string","description":"File pattern to include in the search (e.g. \"*.js\", \"*.{ts,tsx}\")"}},"required":["pattern"]}}},{"type":"function","function":{"name":"question","description":"Use this tool when you need to ask the user questions during execution. This allows you to:\n1. Gather user preferences or requirements\n2. Clarify ambiguous instructions\n3. Get decisions on implementation choices as you work\n4. Offer choices to the user about what direction to take.\n\nUsage notes:\n- When `custom` is enabled (default), a \"Type your own answer\" option is added automatically; don't include \"Other\" or catch-all options\n- Answers are returned as arrays of labels; set `multiple: true` to allow selecting more than one\n- If you recommend a specific option, make that the first option in the list and add \"(Recommended)\" at the end of the label\n","parameters":{"$schema":"https://json-schema.org/draft/2020-12/schema","type":"object","properties":{"questions":{"type":"array","items":{"type":"object","properties":{"question":{"type":"string","description":"Complete question"},"header":{"type":"string","description":"Very short label (max 30 chars)"},"options":{"type":"array","items":{"type":"object","properties":{"label":{"type":"string","description":"Display text (1-5 words, concise)"},"description":{"type":"string","description":"Explanation of choice"}},"required":["label","description"]},"description":"Available choices"},"multiple":{"type":"boolean","description":"Allow selecting multiple choices"}},"required":["question","header","options"]},"description":"Questions to ask"}},"required":["questions"]}}}],"tool_choice":"auto","stream":true,"stream_options":{"include_usage":true}}
JSON
status=$?
set -e

# curl exits 28 on --max-time timeout. That is expected for a streaming repro.
if [[ "$status" != "0" && "$status" != "28" ]]; then
  echo "curl failed with status $status" >&2
  exit "$status"
fi

echo >&2
echo "Replay complete. curl status=$status (28 means the MAX_TIME streaming cap was reached)." >&2
