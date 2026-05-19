# c0ba4f5baf8d43469cff4a2521db9dc2ce4e8f1f

Result: good

Metrics:

- done: True
- decoded_text_chars: 189
- non_ascii_ratio: 0.0106
- has_greeting: True
- has_bad_marker: False

Versions:

```text
vllm==0.19.1rc1.dev329+gc0ba4f5ba.precompiled
torch==2.11.0+cu130
transformers==5.5.0
huggingface-hub==1.15.0
runai-model-streamer==0.15.8
runai-model-streamer-s3==0.15.8
runai-model-streamer-gcs==0.15.8
runai-model-streamer-azure==0.15.8
pandas==3.0.3

```

Meta:

```text
commit=c0ba4f5baf8d43469cff4a2521db9dc2ce4e8f1f
precompiled_wheel_commit=18013df6ae27c3fb941307c46c975227126d641f
subject=Clone buffered FP8 indexer tensors
commit_date=2026-05-19T02:36:13+00:00
started_at=2026-05-19T02:36:19+00:00
ready_after_seconds=76
repro_status=0

```

Decoded Stream Excerpt:

```text
The user just said "hi". I'll respond with a friendly greeting.Hi there! 👋 How can I help you today? Whether it's coding, debugging, file management, or anything else — I'm ready to assist!
```

Raw Stream Excerpt:

```text
data: {"id":"chatcmpl-84fd71592962667f","object":"chat.completion.chunk","created":1779158289,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"role":"assistant","content":""},"logprobs":null,"finish_reason":null}],"prompt_token_ids":null}

data: {"id":"chatcmpl-84fd71592962667f","object":"chat.completion.chunk","created":1779158289,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":"The"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-84fd71592962667f","object":"chat.completion.chunk","created":1779158289,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" user"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-84fd71592962667f","object":"chat.completion.chunk","created":1779158289,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" just"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-84fd71592962667f","object":"chat.completion.chunk","created":1779158289,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" said"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-84fd71592962667f","object":"chat.completion.chunk","created":1779158289,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" \""},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-84fd71592962667f","object":"chat.completion.chunk","created":1779158289,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":"hi"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-84fd71592962667f","object":"chat.completion.chunk","created":1779158289,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":"\"."},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-84fd71592962667f","object":"chat.completion.chunk","created":1779158289,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" I"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-84fd71592962667f","object":"chat.completion.chunk","created":1779158289,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":"'ll"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-84fd71592962667f","object":"chat.completion.chunk","created":1779158289,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" respond"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-84fd71592962667f","object":"chat.completion.chunk","created":1779158289,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" with"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-84fd71592962667f","object":"chat.completion.chunk","created":1779158289,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" a"},"logprobs":
```

Server Log Tail:

```text
(Worker_TP2 pid=3709994) Ignored error while writing commit hash to /home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/refs/main: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/refs/main'.
(Worker_TP0 pid=3709992)
Loading safetensors using Runai Model Streamer:   0% Completed | 0/119028 [00:00<?, ?it/s]
(Worker_TP0 pid=3709992)
Loading safetensors using Runai Model Streamer:   0% Completed | 1/119028 [00:05<168:12:16,  5.09s/it]
(Worker_TP0 pid=3709992)
Loading safetensors using Runai Model Streamer:   9% Completed | 11298/119028 [00:07<00:53, 2031.52it/s]
(Worker_TP0 pid=3709992)
Loading safetensors using Runai Model Streamer:  20% Completed | 23362/119028 [00:09<00:28, 3389.24it/s]
(Worker_TP0 pid=3709992)
Loading safetensors using Runai Model Streamer:  30% Completed | 36271/119028 [00:11<00:19, 4305.87it/s]
(Worker_TP0 pid=3709992)
Loading safetensors using Runai Model Streamer:  41% Completed | 49353/119028 [00:13<00:13, 5007.47it/s]
(Worker_TP0 pid=3709992)
Loading safetensors using Runai Model Streamer:  52% Completed | 62071/119028 [00:15<00:10, 5425.85it/s]
(Worker_TP0 pid=3709992)
Loading safetensors using Runai Model Streamer:  62% Completed | 73967/119028 [00:17<00:08, 5585.94it/s]
(Worker_TP0 pid=3709992)
Loading safetensors using Runai Model Streamer:  72% Completed | 85796/119028 [00:19<00:05, 5666.48it/s]
(Worker_TP0 pid=3709992)
Loading safetensors using Runai Model Streamer:  82% Completed | 97583/119028 [00:21<00:03, 5528.32it/s]
(Worker_TP0 pid=3709992)
Loading safetensors using Runai Model Streamer:  92% Completed | 109105/119028 [00:23<00:01, 5596.74it/s]
(Worker_TP0 pid=3709992)
Loading safetensors using Runai Model Streamer: 100% Completed | 119028/119028 [00:25<00:00, 4687.75it/s]
(Worker_TP0 pid=3709992)
(Worker_TP0 pid=3709992) /home/benjaminba/vllm-bisect-venv/lib/python3.12/site-packages/torch/distributed/c10d_logger.py:83: UserWarning: barrier(): using the device under current context. You can specify `device_id` in `init_process_group` to mute this warning.
(Worker_TP0 pid=3709992)   return func(*args, **kwargs)
(Worker_TP0 pid=3709992) INFO 05-19 02:37:59 [fp8.py:577] Using MoEPrepareAndFinalizeNoDPEPModular
(Worker_TP7 pid=3709999) INFO 05-19 02:38:00 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP6 pid=3709998) INFO 05-19 02:38:00 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP5 pid=3709997) INFO 05-19 02:38:00 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP4 pid=3709996) INFO 05-19 02:38:00 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP3 pid=3709995) INFO 05-19 02:38:00 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP1 pid=3709993) INFO 05-19 02:38:00 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP2 pid=3709994) INFO 05-19 02:38:00 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP0 pid=3709992) INFO 05-19 02:38:01 [gpu_model_runner.py:4823] Model loading took 89.39 GiB memory and 32.668146 seconds
(Worker_TP0 pid=3709992) INFO 05-19 02:38:01 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP0 pid=3709992) INFO 05-19 02:38:02 [fused_moe.py:1077] Using configuration from /home/benjaminba/vllm-bisect-src/vllm/model_executor/layers/fused_moe/configs/E=256,N=256,device_name=NVIDIA_H200,dtype=fp8_w8a8,block_shape=[128,128].json for MoE layer.
(Worker_TP0 pid=3709992) INFO 05-19 02:38:04 [gpu_worker.py:436] Available KV cache memory: 32.06 GiB
(EngineCore pid=3709775) INFO 05-19 02:38:04 [kv_cache_utils.py:1319] GPU KV cache size: 343,744 tokens
(EngineCore pid=3709775) INFO 05-19 02:38:04 [kv_cache_utils.py:1324] Maximum concurrency for 202,752 tokens per request: 1.70x
(Worker_TP0 pid=3709992) INFO 05-19 02:38:04 [ssu_dispatch.py:207] Using triton Mamba SSU backend.
(Worker_TP3 pid=3709995) INFO 05-19 02:38:04 [ssu_dispatch.py:207] Using triton Mamba SSU backend.
(Worker_TP6 pid=3709998) INFO 05-19 02:38:04 [ssu_dispatch.py:207] Using triton Mamba SSU backend.
(Worker_TP2 pid=3709994) INFO 05-19 02:38:04 [ssu_dispatch.py:207] Using triton Mamba SSU backend.
(Worker_TP7 pid=3709999) INFO 05-19 02:38:04 [ssu_dispatch.py:207] Using triton Mamba SSU backend.
(Worker_TP4 pid=3709996) INFO 05-19 02:38:04 [ssu_dispatch.py:207] Using triton Mamba SSU backend.
(Worker_TP5 pid=3709997) INFO 05-19 02:38:04 [ssu_dispatch.py:207] Using triton Mamba SSU backend.
(Worker_TP1 pid=3709993) INFO 05-19 02:38:04 [ssu_dispatch.py:207] Using triton Mamba SSU backend.
(Worker_TP7 pid=3709999) 2026-05-19 02:38:04,896 - INFO - autotuner.py:446 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP4 pid=3709996) 2026-05-19 02:38:04,896 - INFO - autotuner.py:446 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP5 pid=3709997) 2026-05-19 02:38:04,896 - INFO - autotuner.py:446 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP2 pid=3709994) 2026-05-19 02:38:04,896 - INFO - autotuner.py:446 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP1 pid=3709993) 2026-05-19 02:38:04,896 - INFO - autotuner.py:446 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP6 pid=3709998) 2026-05-19 02:38:04,896 - INFO - autotuner.py:446 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP3 pid=3709995) 2026-05-19 02:38:04,896 - INFO - autotuner.py:446 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP0 pid=3709992) 2026-05-19 02:38:04,897 - INFO - autotuner.py:446 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP6 pid=3709998) 2026-05-19 02:38:05,177 - INFO - autotuner.py:455 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP4 pid=3709996) 2026-05-19 02:38:05,177 - INFO - autotuner.py:455 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP5 pid=3709997) 2026-05-19 02:38:05,177 - INFO - autotuner.py:455 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP7 pid=3709999) 2026-05-19 02:38:05,177 - INFO - autotuner.py:455 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP3 pid=3709995) 2026-05-19 02:38:05,177 - INFO - autotuner.py:455 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP2 pid=3709994) 2026-05-19 02:38:05,177 - INFO - autotuner.py:455 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP1 pid=3709993) 2026-05-19 02:38:05,177 - INFO - autotuner.py:455 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP0 pid=3709992) 2026-05-19 02:38:05,177 - INFO - autotuner.py:455 - flashinfer.jit: [Autotuner]: Autotuning process ends
(EngineCore pid=3709775) INFO 05-19 02:38:05 [core.py:307] init engine (profile, create kv cache, warmup model) took 4.35 s
(EngineCore pid=3709775) Warning: You are sending unauthenticated requests to the HF Hub. Please set a HF_TOKEN to enable higher rate limits and faster downloads.
(EngineCore pid=3709775) INFO 05-19 02:38:06 [vllm.py:834] Asynchronous scheduling is enabled.
(EngineCore pid=3709775) WARNING 05-19 02:38:06 [vllm.py:892] Enforce eager set, disabling torch.compile and CUDAGraphs. This is equivalent to setting -cc.mode=none -cc.cudagraph_mode=none
(EngineCore pid=3709775) WARNING 05-19 02:38:06 [vllm.py:903] Inductor compilation was disabled by user settings, optimizations settings that are only active during inductor compilation will be ignored.
(EngineCore pid=3709775) INFO 05-19 02:38:06 [kernel.py:199] Final IR op priority after setting platform defaults: IrOpPriorityConfig(rms_norm=['vllm_c', 'native'])
(EngineCore pid=3709775) INFO 05-19 02:38:06 [vllm.py:1081] Cudagraph is disabled under eager mode
(EngineCore pid=3709775) WARNING 05-19 02:38:07 [vllm.py:1249] Auto-initialization of reasoning token IDs failed. Please check whether your reasoning parser has implemented the `reasoning_start_str` and `reasoning_end_str`.
(EngineCore pid=3709775) INFO 05-19 02:38:07 [compilation.py:294] Enabled custom fusions: norm_quant, act_quant, allreduce_rms
(APIServer pid=3709303) INFO 05-19 02:38:07 [api_server.py:600] Supported tasks: ['generate']
(APIServer pid=3709303) INFO 05-19 02:38:07 [parser_manager.py:202] "auto" tool choice has been enabled.
(APIServer pid=3709303) WARNING 05-19 02:38:07 [model.py:1442] Default vLLM sampling parameters have been overridden by the model's `generation_config.json`: `{'temperature': 1.0, 'top_p': 0.95}`. If this is not intended, please relaunch vLLM instance with `--generation-config vllm`.
(APIServer pid=3709303) Could not cache non-existence of file. Will ignore error and continue. Error: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/.no_exist/f396cf805182f4ca10fa675e1a99815b3ca384db/processor_config.json'
(APIServer pid=3709303) Could not cache non-existence of file. Will ignore error and continue. Error: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/.no_exist/f396cf805182f4ca10fa675e1a99815b3ca384db/preprocessor_config.json'
(APIServer pid=3709303) Could not cache non-existence of file. Will ignore error and continue. Error: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/.no_exist/f396cf805182f4ca10fa675e1a99815b3ca384db/processor_config.json'
(APIServer pid=3709303) Could not cache non-existence of file. Will ignore error and continue. Error: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/.no_exist/f396cf805182f4ca10fa675e1a99815b3ca384db/preprocessor_config.json'
(APIServer pid=3709303) Could not cache non-existence of file. Will ignore error and continue. Error: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/.no_exist/f396cf805182f4ca10fa675e1a99815b3ca384db/video_preprocessor_config.json'
(APIServer pid=3709303) Could not cache non-existence of file. Will ignore error and continue. Error: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/.no_exist/f396cf805182f4ca10fa675e1a99815b3ca384db/preprocessor_config.json'
(APIServer pid=3709303) INFO 05-19 02:38:08 [api_server.py:604] Starting vLLM server on http://0.0.0.0:8011
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:37] Available routes are:
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /openapi.json, Methods: GET, HEAD
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /docs, Methods: GET, HEAD
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /docs/oauth2-redirect, Methods: GET, HEAD
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /redoc, Methods: GET, HEAD
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /tokenize, Methods: POST
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /detokenize, Methods: POST
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /load, Methods: GET
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /version, Methods: GET
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /health, Methods: GET
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /metrics, Methods: GET
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /v1/models, Methods: GET
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /ping, Methods: GET
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /ping, Methods: POST
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /invocations, Methods: POST
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /v1/chat/completions, Methods: POST
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /v1/chat/completions/batch, Methods: POST
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /v1/responses, Methods: POST
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /v1/responses/{response_id}, Methods: GET
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /v1/responses/{response_id}/cancel, Methods: POST
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /v1/completions, Methods: POST
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /v1/messages, Methods: POST
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /v1/messages/count_tokens, Methods: POST
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /inference/v1/generate, Methods: POST
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /scale_elastic_ep, Methods: POST
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /is_scaling_elastic_ep, Methods: POST
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /v1/chat/completions/render, Methods: POST
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /v1/completions/render, Methods: POST
(APIServer pid=3709303) INFO 05-19 02:38:08 [launcher.py:46] Route: /generative_scoring, Methods: POST
(APIServer pid=3709303) INFO:     Started server process [3709303]
(APIServer pid=3709303) INFO:     Waiting for application startup.
(APIServer pid=3709303) INFO:     Application startup complete.
(APIServer pid=3709303) INFO:     127.0.0.1:36950 - "GET /v1/models HTTP/1.1" 200 OK
(APIServer pid=3709303) INFO:     127.0.0.1:36956 - "POST /v1/chat/completions HTTP/1.1" 200 OK
(Worker_TP0 pid=3709992) WARNING 05-19 02:38:09 [flashmla_sparse.py:811] Padding num_heads from 8 to 64 for BF16 sparse prefill kernel
```
