# Host Python Bisect Summary

The host-Python bisect reproduced the Docker nightly boundary and narrowed the first bad commit to:

```text
ac3dac545 [Bugfix][Perf] Indexer upcast WK to BF16 for fusion (#38928)
```

Immediate boundary:

| Commit | Result |
| --- | --- |
| `39ac64049` `[Bug] Fix batch invariant test issue, bs=1 with max_seq_num = 1 (#39320)` | good |
| `ac3dac545` `[Bugfix][Perf] Indexer upcast WK to BF16 for fusion (#38928)` | bad |

Bisect order:

| Step | Commit | Result |
| --- | --- | --- |
| sanity good | `55e1a8e10` | good |
| sanity bad | `18013df6a` | bad |
| 1 | `27c0ca50a` | bad |
| 2 | `39ac64049` | good |
| 3 | `c77e596e2` | bad |
| 4 | `ac3dac545` | bad |

The tested host-Python setup uses:

- source checkout at `/home/benjaminba/vllm-bisect-src`
- venv at `/home/benjaminba/vllm-bisect-venv`
- `VLLM_USE_PRECOMPILED=1`
- `transformers==5.5.0`
- `runai-model-streamer==0.15.8`
- `CUDA_HOME=/usr/local/cuda-13.0`
- `ninja-build` for FlashInfer JIT

The same minimal request is used throughout: user message `hi`, tools `bash`, `edit`, `glob`, `grep`, `question`, `tool_choice:auto`, streaming enabled.
