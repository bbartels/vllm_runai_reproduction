# vLLM RunAI Streamer GLM-5.1-FP8 Reproduction

This repository contains a minimal reproduction for abnormal/gibberish output from `zai-org/GLM-5.1-FP8` when served with vLLM and RunAI Model Streamer.

## Reproduction

Run on an 8x H200 host with Docker/NVIDIA runtime available:

```bash
./run-docker-and-repro.sh
```

The script:

- starts `vllm/vllm-openai:v0.20.0-x86_64-cu130-ubuntu2404`
- serves `zai-org/GLM-5.1-FP8`
- enables `runai_streamer`
- passes `--model-loader-extra-config='{"concurrency": 140, "distributed": true}'`
- passes `--enforce-eager`
- sends a minimal OpenAI-compatible request: user message `hi` plus 5 tool schemas
- streams output for 60 seconds by default

Useful overrides:

```bash
MAX_TIME=30 ./run-docker-and-repro.sh
READY_TIMEOUT=600 ./run-docker-and-repro.sh
KEEP_CONTAINER=1 ./run-docker-and-repro.sh
PORT=8001 ./run-docker-and-repro.sh
IMAGE=vllm/vllm-openai:v0.20.0-x86_64-cu130-ubuntu2404 ./run-docker-and-repro.sh
```

`curl` exit status `28` is expected when the streaming timeout is hit.

## Minimal Request

The embedded request has no system prompt and only this user message:

```json
[{"role":"user","content":"hi"}]
```

It includes these 5 tool schemas:

- `bash`
- `edit`
- `glob`
- `grep`
- `question`

Observed boundary during reduction:

- no tools: good
- `bash` only: good
- `bash`, `edit`, `glob`: good
- `grep`, `question`, `read`: good
- `bash`, `edit`, `glob`, `grep`: good
- `bash`, `edit`, `glob`, `grep`, `question`: bad

So the minimal failing payload is `hi` plus the first 5 OpenCode tool schemas.

## Observed Matrix

The same minimal payload was tested across images/configurations:

| Image/configuration | Result |
| --- | --- |
| `vllm/vllm-openai:v0.20.0-x86_64-cu130-ubuntu2404` + `runai_streamer` + loader config + `--enforce-eager` | bad/abnormal output |
| `vllm/vllm-openai:v0.20.0-x86_64-cu130-ubuntu2404` + `runai_streamer` + loader config + `-O0` | good in tested run |
| derived `v0.19.0` image with `transformers==5.5.0` | good |

The v0.19 derived image was built only because stock v0.19 did not recognize `glm_moe_dsa` for the current checkpoint.

## Nightly Bisect Summary

Release tag dates:

- `v0.19.0`: 2026-04-02T23:45:38Z
- `v0.20.0`: 2026-04-27T19:04:32Z

Published nightly tags tested:

| Tag | Date | Result |
| --- | --- | --- |
| `cu130-nightly-b075604da10a9e8ff23d23f63d5113d43f0e4208` | 2026-04-14 | good, after adding `pandas` + `transformers==5.5.0` to image |
| `cu130-nightly-55e1a8e1035bddb0b5b63f9ddecc8b4e16fc3ef6` | 2026-04-15 | good, after adding `pandas` + `transformers==5.5.0` to image |
| `cu130-nightly-18013df6ae27c3fb941307c46c975227126d641f` | 2026-04-16 | bad/abnormal output, after adding `pandas` to image |

The first failing published nightly observed was:

```text
cu130-nightly-18013df6ae27c3fb941307c46c975227126d641f
```

Regression window:

```text
55e1a8e1035bddb0b5b63f9ddecc8b4e16fc3ef6..18013df6ae27c3fb941307c46c975227126d641f
```

Commits in that window:

```text
18013df6a [Bugfix] Reject empty tools array with HTTP 400 (#39780)
c0722f22d [Mistral Grammar] Fix tool and reasoning parsing (#39217)
951dca801 [compile] Invoke split FX graph by codegen. (#38657)
5f7fab881 [ROCm][FEAT] Integrate aiter gemm w8a8 ptpc (#33773)
343f65234 [Model Runner V2][BugFix] fix num_sampled dtype for probabilistic rej… (#39951)
19fa90ed0 [Quantization] - Layerwise reloading of Attention/KV quantized models (#38995)
03f8d3a54 Update to transformers v5 (#30566)
6dc949140 [Model] Fix Gemma 4 token repetition by dynamic BOS injection for PT models (#39842)
27c0ca50a Update registry for Nemotron-v3 VL Nano/Super (#39747)
7c636432c [CI Bug] fix flaky test (#39938)
c77e596e [FlashAttention] Don't overwrite `flash_attn_interface.py` when installing precompiled (#39932)
ac3dac54 [Bugfix][Perf] Indexer upcast WK to BF16 for fusion (#38928)
39ac6404 [Bug] Fix batch invariant test issue, bs=1 with `max_seq_num = 1` (#39320)
0b790a25 [Speculative Decoding] Add DFlash speculators config parsing (#38300)
41488f2a [Bugfix][NIXL] Fix `_logical_to_kernel_block_ids` conversion for non-mamba models (#39724)
102d51c9 [CI] Only build release Docker images when NIGHTLY=1 (#39882)
```

Potentially relevant commits from that window:

- `c0722f22d` tool/reasoning parsing changes
- `19fa90ed0` quantized weight loading changes
- `03f8d3a54` transformers v5 migration
- `ac3dac54` indexer upcast for fusion

## Exact Culprit And Fix

A host-Python source bisect with `VLLM_USE_PRECOMPILED=1` narrowed the exact first bad commit to:

```text
ac3dac545 [Bugfix][Perf] Indexer upcast WK to BF16 for fusion (#38928)
```

Immediate boundary:

| Commit | Result |
| --- | --- |
| `39ac64049` `[Bug] Fix batch invariant test issue, bs=1 with max_seq_num = 1 (#39320)` | good |
| `ac3dac545` `[Bugfix][Perf] Indexer upcast WK to BF16 for fusion (#38928)` | bad |

The likely root cause is that `ac3dac545` buffers RunAI-streamed FP8 indexer `wk` weight/scale tensors for delayed BF16 dequantization without cloning them. RunAI Model Streamer can reuse backing buffers while iterating weights, so the delayed dequantization can consume overwritten tensor contents.

Minimal validated fix:

```diff
-entry["weight" if is_weight else "scale"] = tensor
+entry["weight" if is_weight else "scale"] = tensor.clone()
```

Validation results:

| Case | Result |
| --- | --- |
| `18013df6a` unpatched | bad |
| `18013df6a` with full revert of `ac3dac545` | good |
| `18013df6a` with one-line clone fix | good |
| `v0.20.0` unpatched | bad |
| `v0.20.0` with one-line clone fix | good |

Detailed artifacts are in `bisect-results/` and `fix-results/`.

## Notes

The `runai-model-streamer` package version did not change between the v0.19 and v0.20 Docker images inspected:

```text
v0.19.0 image: runai-model-streamer==0.15.8
v0.20.0 image: runai-model-streamer==0.15.8
v0.21.0 image: runai-model-streamer==0.15.9
```

That points toward an interaction in vLLM rather than a RunAI package version bump between v0.19 and v0.20.
