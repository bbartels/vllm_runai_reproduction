# 39acbf39c371c474d505590e42efc144e6dcd955

Result: good

Metrics:

- done: True
- decoded_text_chars: 189
- non_ascii_ratio: 0.0106
- has_greeting: True
- has_bad_marker: False

Versions:

```text
vllm==0.20.1.dev1+g39acbf39c.precompiled
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
commit=39acbf39c371c474d505590e42efc144e6dcd955
precompiled_wheel_commit=88d34c6409e9fb3c7b8ca0c04756f061d2099eb1
subject=Clone buffered FP8 indexer tensors
commit_date=2026-05-19T02:38:37+00:00
started_at=2026-05-19T02:38:41+00:00
ready_after_seconds=76
repro_status=0

```

Decoded Stream Excerpt:

```text
The user just said "hi". I'll respond with a friendly greeting.Hi there! 👋 How can I help you today? Whether it's coding, debugging, file management, or anything else — I'm ready to assist!
```

Raw Stream Excerpt:

```text
data: {"id":"chatcmpl-9df203cf2d121317","object":"chat.completion.chunk","created":1779158433,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"role":"assistant","content":""},"logprobs":null,"finish_reason":null}],"prompt_token_ids":null}

data: {"id":"chatcmpl-9df203cf2d121317","object":"chat.completion.chunk","created":1779158433,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":"The"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-9df203cf2d121317","object":"chat.completion.chunk","created":1779158433,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" user"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-9df203cf2d121317","object":"chat.completion.chunk","created":1779158433,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" just"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-9df203cf2d121317","object":"chat.completion.chunk","created":1779158433,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" said"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-9df203cf2d121317","object":"chat.completion.chunk","created":1779158433,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" \""},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-9df203cf2d121317","object":"chat.completion.chunk","created":1779158433,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":"hi"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-9df203cf2d121317","object":"chat.completion.chunk","created":1779158433,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":"\"."},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-9df203cf2d121317","object":"chat.completion.chunk","created":1779158433,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" I"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-9df203cf2d121317","object":"chat.completion.chunk","created":1779158433,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":"'ll"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-9df203cf2d121317","object":"chat.completion.chunk","created":1779158433,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" respond"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-9df203cf2d121317","object":"chat.completion.chunk","created":1779158433,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" with"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-9df203cf2d121317","object":"chat.completion.chunk","created":1779158433,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" a"},"logprobs":
```

Server Log Tail:

```text
(Worker_TP7 pid=3714509) Ignored error while writing commit hash to /home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/refs/main: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/refs/main'.
(Worker_TP7 pid=3714509) Warning: You are sending unauthenticated requests to the HF Hub. Please set a HF_TOKEN to enable higher rate limits and faster downloads.
(Worker_TP2 pid=3714504) Ignored error while writing commit hash to /home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/refs/main: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/refs/main'.
(Worker_TP3 pid=3714505) Ignored error while writing commit hash to /home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/refs/main: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/refs/main'.
(Worker_TP5 pid=3714507) Ignored error while writing commit hash to /home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/refs/main: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/refs/main'.
(Worker_TP4 pid=3714506) Ignored error while writing commit hash to /home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/refs/main: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/refs/main'.
(Worker_TP6 pid=3714508) Ignored error while writing commit hash to /home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/refs/main: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/refs/main'.
(Worker_TP0 pid=3714502) Ignored error while writing commit hash to /home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/refs/main: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/refs/main'.
(Worker_TP0 pid=3714502) Warning: You are sending unauthenticated requests to the HF Hub. Please set a HF_TOKEN to enable higher rate limits and faster downloads.
(Worker_TP0 pid=3714502)
Loading safetensors using Runai Model Streamer:   0% Completed | 0/119028 [00:00<?, ?it/s]
(Worker_TP0 pid=3714502)
Loading safetensors using Runai Model Streamer:   0% Completed | 1/119028 [00:05<166:25:22,  5.03s/it]
(Worker_TP0 pid=3714502)
Loading safetensors using Runai Model Streamer:  11% Completed | 12972/119028 [00:07<00:45, 2316.15it/s]
(Worker_TP0 pid=3714502)
Loading safetensors using Runai Model Streamer:  22% Completed | 26761/119028 [00:09<00:24, 3817.59it/s]
(Worker_TP0 pid=3714502)
Loading safetensors using Runai Model Streamer:  34% Completed | 40645/119028 [00:11<00:16, 4776.66it/s]
(Worker_TP0 pid=3714502)
Loading safetensors using Runai Model Streamer:  46% Completed | 54659/119028 [00:13<00:11, 5421.03it/s]
(Worker_TP0 pid=3714502)
Loading safetensors using Runai Model Streamer:  57% Completed | 68389/119028 [00:15<00:08, 5798.33it/s]
(Worker_TP0 pid=3714502)
Loading safetensors using Runai Model Streamer:  69% Completed | 82191/119028 [00:17<00:06, 6004.84it/s]
(Worker_TP0 pid=3714502)
Loading safetensors using Runai Model Streamer:  80% Completed | 95525/119028 [00:19<00:03, 6048.77it/s]
(Worker_TP0 pid=3714502)
Loading safetensors using Runai Model Streamer:  91% Completed | 108159/119028 [00:21<00:01, 6124.33it/s]
(Worker_TP0 pid=3714502)
Loading safetensors using Runai Model Streamer: 100% Completed | 119028/119028 [00:23<00:00, 5020.73it/s]
(Worker_TP0 pid=3714502)
(Worker_TP0 pid=3714502) /home/benjaminba/vllm-bisect-venv/lib/python3.12/site-packages/torch/distributed/c10d_logger.py:83: UserWarning: barrier(): using the device under current context. You can specify `device_id` in `init_process_group` to mute this warning.
(Worker_TP0 pid=3714502)   return func(*args, **kwargs)
(Worker_TP0 pid=3714502) INFO 05-19 02:40:22 [fp8.py:578] Using MoEPrepareAndFinalizeNoDPEPModular
(Worker_TP0 pid=3714502) INFO 05-19 02:40:23 [gpu_model_runner.py:4879] Model loading took 89.39 GiB memory and 30.461230 seconds
(Worker_TP0 pid=3714502) INFO 05-19 02:40:23 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP4 pid=3714506) INFO 05-19 02:40:23 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP6 pid=3714508) INFO 05-19 02:40:23 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP7 pid=3714509) INFO 05-19 02:40:23 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP3 pid=3714505) INFO 05-19 02:40:23 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP5 pid=3714507) INFO 05-19 02:40:23 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP2 pid=3714504) INFO 05-19 02:40:23 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP1 pid=3714503) INFO 05-19 02:40:23 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP0 pid=3714502) INFO 05-19 02:40:24 [fused_moe.py:1078] Using configuration from /home/benjaminba/vllm-bisect-src/vllm/model_executor/layers/fused_moe/configs/E=256,N=256,device_name=NVIDIA_H200,dtype=fp8_w8a8,block_shape=[128,128].json for MoE layer.
(Worker_TP0 pid=3714502) INFO 05-19 02:40:27 [gpu_worker.py:440] Available KV cache memory: 34.86 GiB
(EngineCore pid=3714287) INFO 05-19 02:40:27 [kv_cache_utils.py:1711] GPU KV cache size: 373,696 tokens
(EngineCore pid=3714287) INFO 05-19 02:40:27 [kv_cache_utils.py:1716] Maximum concurrency for 202,752 tokens per request: 1.84x
(Worker_TP2 pid=3714504) 2026-05-19 02:40:27,870 - INFO - autotuner.py:457 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP1 pid=3714503) 2026-05-19 02:40:27,870 - INFO - autotuner.py:457 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP7 pid=3714509) 2026-05-19 02:40:27,870 - INFO - autotuner.py:457 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP0 pid=3714502) 2026-05-19 02:40:27,870 - INFO - autotuner.py:457 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP5 pid=3714507) 2026-05-19 02:40:27,870 - INFO - autotuner.py:457 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP4 pid=3714506) 2026-05-19 02:40:27,870 - INFO - autotuner.py:457 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP6 pid=3714508) 2026-05-19 02:40:27,870 - INFO - autotuner.py:457 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP3 pid=3714505) 2026-05-19 02:40:27,870 - INFO - autotuner.py:457 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP4 pid=3714506) 2026-05-19 02:40:28,160 - INFO - autotuner.py:466 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP7 pid=3714509) 2026-05-19 02:40:28,160 - INFO - autotuner.py:466 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP2 pid=3714504) 2026-05-19 02:40:28,160 - INFO - autotuner.py:466 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP1 pid=3714503) 2026-05-19 02:40:28,160 - INFO - autotuner.py:466 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP0 pid=3714502) 2026-05-19 02:40:28,160 - INFO - autotuner.py:466 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP5 pid=3714507) 2026-05-19 02:40:28,160 - INFO - autotuner.py:466 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP6 pid=3714508) 2026-05-19 02:40:28,160 - INFO - autotuner.py:466 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP3 pid=3714505) 2026-05-19 02:40:28,160 - INFO - autotuner.py:466 - flashinfer.jit: [Autotuner]: Autotuning process ends
(EngineCore pid=3714287) INFO 05-19 02:40:28 [core.py:306] init engine (profile, create kv cache, warmup model) took 4.90 s
(EngineCore pid=3714287) Warning: You are sending unauthenticated requests to the HF Hub. Please set a HF_TOKEN to enable higher rate limits and faster downloads.
(EngineCore pid=3714287) INFO 05-19 02:40:30 [vllm.py:840] Asynchronous scheduling is enabled.
(EngineCore pid=3714287) WARNING 05-19 02:40:30 [vllm.py:896] Enforce eager set, disabling torch.compile and CUDAGraphs. This is equivalent to setting -cc.mode=none -cc.cudagraph_mode=none
(EngineCore pid=3714287) WARNING 05-19 02:40:30 [vllm.py:914] Inductor compilation was disabled by user settings, optimizations settings that are only active during inductor compilation will be ignored.
(EngineCore pid=3714287) INFO 05-19 02:40:30 [kernel.py:205] Final IR op priority after setting platform defaults: IrOpPriorityConfig(rms_norm=['vllm_c', 'native'])
(EngineCore pid=3714287) INFO 05-19 02:40:30 [vllm.py:1089] Cudagraph is disabled under eager mode
(EngineCore pid=3714287) INFO 05-19 02:40:30 [compilation.py:303] Enabled custom fusions: norm_quant, act_quant, allreduce_rms
(APIServer pid=3713619) INFO 05-19 02:40:30 [api_server.py:598] Supported tasks: ['generate']
(APIServer pid=3713619) INFO 05-19 02:40:30 [parser_manager.py:202] "auto" tool choice has been enabled.
(APIServer pid=3713619) WARNING 05-19 02:40:30 [model.py:1437] Default vLLM sampling parameters have been overridden by the model's `generation_config.json`: `{'temperature': 1.0, 'top_p': 0.95}`. If this is not intended, please relaunch vLLM instance with `--generation-config vllm`.
(APIServer pid=3713619) Could not cache non-existence of file. Will ignore error and continue. Error: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/.no_exist/f396cf805182f4ca10fa675e1a99815b3ca384db/processor_config.json'
(APIServer pid=3713619) Could not cache non-existence of file. Will ignore error and continue. Error: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/.no_exist/f396cf805182f4ca10fa675e1a99815b3ca384db/preprocessor_config.json'
(APIServer pid=3713619) Could not cache non-existence of file. Will ignore error and continue. Error: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/.no_exist/f396cf805182f4ca10fa675e1a99815b3ca384db/processor_config.json'
(APIServer pid=3713619) Could not cache non-existence of file. Will ignore error and continue. Error: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/.no_exist/f396cf805182f4ca10fa675e1a99815b3ca384db/preprocessor_config.json'
(APIServer pid=3713619) Could not cache non-existence of file. Will ignore error and continue. Error: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/.no_exist/f396cf805182f4ca10fa675e1a99815b3ca384db/video_preprocessor_config.json'
(APIServer pid=3713619) Could not cache non-existence of file. Will ignore error and continue. Error: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/.no_exist/f396cf805182f4ca10fa675e1a99815b3ca384db/preprocessor_config.json'
(APIServer pid=3713619) INFO 05-19 02:40:32 [api_server.py:602] Starting vLLM server on http://0.0.0.0:8011
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:37] Available routes are:
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /openapi.json, Methods: HEAD, GET
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /docs, Methods: HEAD, GET
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /docs/oauth2-redirect, Methods: HEAD, GET
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /redoc, Methods: HEAD, GET
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /tokenize, Methods: POST
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /detokenize, Methods: POST
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /load, Methods: GET
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /version, Methods: GET
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /health, Methods: GET
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /metrics, Methods: GET
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /v1/models, Methods: GET
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /ping, Methods: GET
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /ping, Methods: POST
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /invocations, Methods: POST
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /v1/chat/completions, Methods: POST
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /v1/chat/completions/batch, Methods: POST
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /v1/responses, Methods: POST
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /v1/responses/{response_id}, Methods: GET
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /v1/responses/{response_id}/cancel, Methods: POST
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /v1/completions, Methods: POST
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /v1/messages, Methods: POST
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /v1/messages/count_tokens, Methods: POST
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /inference/v1/generate, Methods: POST
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /scale_elastic_ep, Methods: POST
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /is_scaling_elastic_ep, Methods: POST
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /generative_scoring, Methods: POST
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /v1/chat/completions/render, Methods: POST
(APIServer pid=3713619) INFO 05-19 02:40:32 [launcher.py:46] Route: /v1/completions/render, Methods: POST
(APIServer pid=3713619) INFO:     Started server process [3713619]
(APIServer pid=3713619) INFO:     Waiting for application startup.
(APIServer pid=3713619) INFO:     Application startup complete.
(APIServer pid=3713619) INFO:     127.0.0.1:36118 - "GET /v1/models HTTP/1.1" 200 OK
(APIServer pid=3713619) INFO:     127.0.0.1:36134 - "POST /v1/chat/completions HTTP/1.1" 200 OK
(Worker_TP0 pid=3714502) WARNING 05-19 02:40:33 [flashmla_sparse.py:998] Padding num_heads from 8 to 64 for BF16 sparse prefill kernel
(APIServer pid=3713619) INFO 05-19 02:40:42 [loggers.py:271] Engine 000: Avg prompt throughput: 235.3 tokens/s, Avg generation throughput: 0.1 tokens/s, Running: 1 reqs, Waiting: 0 reqs, GPU KV cache usage: 0.8%, Prefix cache hit rate: 0.0%
(APIServer pid=3713619) INFO 05-19 02:40:52 [loggers.py:271] Engine 000: Avg prompt throughput: 0.0 tokens/s, Avg generation throughput: 0.0 tokens/s, Running: 1 reqs, Waiting: 0 reqs, GPU KV cache usage: 0.8%, Prefix cache hit rate: 0.0%
(APIServer pid=3713619) INFO 05-19 02:41:22 [loggers.py:271] Engine 000: Avg prompt throughput: 0.0 tokens/s, Avg generation throughput: 4.7 tokens/s, Running: 1 reqs, Waiting: 0 reqs, GPU KV cache usage: 0.8%, Prefix cache hit rate: 0.0%
```
