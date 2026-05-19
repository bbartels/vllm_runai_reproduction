# 39ac640490ee2e8f951d343ae1707dd9bdacaf70

Result: good

Metrics:

- done: True
- decoded_text_chars: 189
- non_ascii_ratio: 0.0106
- has_greeting: True
- has_bad_marker: False

Versions:

```text
vllm==0.19.1rc1.dev316+g39ac64049.precompiled
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
commit=39ac640490ee2e8f951d343ae1707dd9bdacaf70
subject=[Bug] Fix batch invariant test issue, bs=1 with `max_seq_num = 1` (#39320)
commit_date=2026-04-15T16:28:43-04:00
started_at=2026-05-19T02:09:59+00:00
ready_after_seconds=77
repro_status=0

```

Decoded Stream Excerpt:

```text
The user just said "hi". I'll respond with a friendly greeting.Hi there! 👋 How can I help you today? Whether it's coding, debugging, file management, or anything else — I'm ready to assist!
```

Raw Stream Excerpt:

```text
data: {"id":"chatcmpl-a0dad85b9a8a5650","object":"chat.completion.chunk","created":1779156713,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"role":"assistant","content":""},"logprobs":null,"finish_reason":null}],"prompt_token_ids":null}

data: {"id":"chatcmpl-a0dad85b9a8a5650","object":"chat.completion.chunk","created":1779156713,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":"The"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-a0dad85b9a8a5650","object":"chat.completion.chunk","created":1779156713,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" user"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-a0dad85b9a8a5650","object":"chat.completion.chunk","created":1779156713,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" just"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-a0dad85b9a8a5650","object":"chat.completion.chunk","created":1779156713,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" said"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-a0dad85b9a8a5650","object":"chat.completion.chunk","created":1779156713,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" \""},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-a0dad85b9a8a5650","object":"chat.completion.chunk","created":1779156713,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":"hi"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-a0dad85b9a8a5650","object":"chat.completion.chunk","created":1779156713,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":"\"."},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-a0dad85b9a8a5650","object":"chat.completion.chunk","created":1779156713,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" I"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-a0dad85b9a8a5650","object":"chat.completion.chunk","created":1779156713,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":"'ll"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-a0dad85b9a8a5650","object":"chat.completion.chunk","created":1779156713,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" respond"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-a0dad85b9a8a5650","object":"chat.completion.chunk","created":1779156713,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" with"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-a0dad85b9a8a5650","object":"chat.completion.chunk","created":1779156713,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" a"},"logprobs":
```

Server Log Tail:

```text
(Worker_TP0 pid=3667549) Warning: You are sending unauthenticated requests to the HF Hub. Please set a HF_TOKEN to enable higher rate limits and faster downloads.
(Worker_TP0 pid=3667549) 
Loading safetensors using Runai Model Streamer:   0% Completed | 0/119028 [00:00<?, ?it/s]
(Worker_TP0 pid=3667549) 
Loading safetensors using Runai Model Streamer:   2% Completed | 2048/119028 [00:02<01:57, 992.62it/s]
(Worker_TP0 pid=3667549) 
Loading safetensors using Runai Model Streamer:  11% Completed | 13089/119028 [00:04<00:29, 3589.64it/s]
(Worker_TP0 pid=3667549) 
Loading safetensors using Runai Model Streamer:  21% Completed | 24533/119028 [00:06<00:21, 4464.37it/s]
(Worker_TP0 pid=3667549) 
Loading safetensors using Runai Model Streamer:  32% Completed | 37652/119028 [00:08<00:15, 5275.52it/s]
(Worker_TP0 pid=3667549) 
Loading safetensors using Runai Model Streamer:  42% Completed | 50465/119028 [00:10<00:12, 5552.91it/s]
(Worker_TP0 pid=3667549) 
Loading safetensors using Runai Model Streamer:  53% Completed | 63138/119028 [00:12<00:09, 5813.23it/s]
(Worker_TP0 pid=3667549) 
Loading safetensors using Runai Model Streamer:  63% Completed | 74780/119028 [00:14<00:07, 5760.16it/s]
(Worker_TP0 pid=3667549) 
Loading safetensors using Runai Model Streamer:  73% Completed | 86312/119028 [00:16<00:05, 5708.07it/s]
(Worker_TP0 pid=3667549) 
Loading safetensors using Runai Model Streamer:  82% Completed | 97736/119028 [00:18<00:03, 5659.37it/s]
(Worker_TP0 pid=3667549) 
Loading safetensors using Runai Model Streamer:  92% Completed | 109061/119028 [00:20<00:01, 5591.51it/s]
(Worker_TP0 pid=3667549) 
Loading safetensors using Runai Model Streamer: 100% Completed | 119028/119028 [00:22<00:00, 5288.07it/s]
(Worker_TP0 pid=3667549) 
(Worker_TP0 pid=3667549) /home/benjaminba/vllm-bisect-venv/lib/python3.12/site-packages/torch/distributed/c10d_logger.py:83: UserWarning: barrier(): using the device under current context. You can specify `device_id` in `init_process_group` to mute this warning.
(Worker_TP0 pid=3667549)   return func(*args, **kwargs)
(Worker_TP0 pid=3667549) INFO 05-19 02:11:43 [fp8.py:577] Using MoEPrepareAndFinalizeNoDPEPModular
(Worker_TP6 pid=3667555) INFO 05-19 02:11:43 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP1 pid=3667550) INFO 05-19 02:11:43 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP2 pid=3667551) INFO 05-19 02:11:43 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP7 pid=3667556) INFO 05-19 02:11:44 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP4 pid=3667553) INFO 05-19 02:11:44 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP5 pid=3667554) INFO 05-19 02:11:44 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP3 pid=3667552) INFO 05-19 02:11:44 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP0 pid=3667549) INFO 05-19 02:11:44 [gpu_model_runner.py:4823] Model loading took 89.34 GiB memory and 33.644844 seconds
(Worker_TP0 pid=3667549) INFO 05-19 02:11:44 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP0 pid=3667549) INFO 05-19 02:11:45 [fused_moe.py:1077] Using configuration from /home/benjaminba/vllm-bisect-src/vllm/model_executor/layers/fused_moe/configs/E=256,N=256,device_name=NVIDIA_H200,dtype=fp8_w8a8,block_shape=[128,128].json for MoE layer.
(Worker_TP0 pid=3667549) INFO 05-19 02:11:47 [gpu_worker.py:436] Available KV cache memory: 32.11 GiB
(EngineCore pid=3667336) INFO 05-19 02:11:47 [kv_cache_utils.py:1319] GPU KV cache size: 344,192 tokens
(EngineCore pid=3667336) INFO 05-19 02:11:47 [kv_cache_utils.py:1324] Maximum concurrency for 202,752 tokens per request: 1.70x
(Worker_TP0 pid=3667549) INFO 05-19 02:11:47 [ssu_dispatch.py:207] Using triton Mamba SSU backend.
(Worker_TP3 pid=3667552) INFO 05-19 02:11:47 [ssu_dispatch.py:207] Using triton Mamba SSU backend.
(Worker_TP4 pid=3667553) INFO 05-19 02:11:47 [ssu_dispatch.py:207] Using triton Mamba SSU backend.
(Worker_TP6 pid=3667555) INFO 05-19 02:11:47 [ssu_dispatch.py:207] Using triton Mamba SSU backend.
(Worker_TP1 pid=3667550) INFO 05-19 02:11:47 [ssu_dispatch.py:207] Using triton Mamba SSU backend.
(Worker_TP2 pid=3667551) INFO 05-19 02:11:47 [ssu_dispatch.py:207] Using triton Mamba SSU backend.
(Worker_TP7 pid=3667556) INFO 05-19 02:11:47 [ssu_dispatch.py:207] Using triton Mamba SSU backend.
(Worker_TP5 pid=3667554) INFO 05-19 02:11:47 [ssu_dispatch.py:207] Using triton Mamba SSU backend.
(Worker_TP7 pid=3667556) 2026-05-19 02:11:47,969 - INFO - autotuner.py:446 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP0 pid=3667549) 2026-05-19 02:11:47,969 - INFO - autotuner.py:446 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP5 pid=3667554) 2026-05-19 02:11:47,969 - INFO - autotuner.py:446 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP6 pid=3667555) 2026-05-19 02:11:47,969 - INFO - autotuner.py:446 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP1 pid=3667550) 2026-05-19 02:11:47,969 - INFO - autotuner.py:446 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP3 pid=3667552) 2026-05-19 02:11:47,969 - INFO - autotuner.py:446 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP4 pid=3667553) 2026-05-19 02:11:47,969 - INFO - autotuner.py:446 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP2 pid=3667551) 2026-05-19 02:11:47,969 - INFO - autotuner.py:446 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP5 pid=3667554) 2026-05-19 02:11:48,263 - INFO - autotuner.py:455 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP7 pid=3667556) 2026-05-19 02:11:48,263 - INFO - autotuner.py:455 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP0 pid=3667549) 2026-05-19 02:11:48,263 - INFO - autotuner.py:455 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP1 pid=3667550) 2026-05-19 02:11:48,263 - INFO - autotuner.py:455 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP3 pid=3667552) 2026-05-19 02:11:48,263 - INFO - autotuner.py:455 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP4 pid=3667553) 2026-05-19 02:11:48,263 - INFO - autotuner.py:455 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP2 pid=3667551) 2026-05-19 02:11:48,263 - INFO - autotuner.py:455 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP6 pid=3667555) 2026-05-19 02:11:48,263 - INFO - autotuner.py:455 - flashinfer.jit: [Autotuner]: Autotuning process ends
(EngineCore pid=3667336) INFO 05-19 02:11:48 [core.py:307] init engine (profile, create kv cache, warmup model) took 4.19 s
(EngineCore pid=3667336) Warning: You are sending unauthenticated requests to the HF Hub. Please set a HF_TOKEN to enable higher rate limits and faster downloads.
(EngineCore pid=3667336) INFO 05-19 02:11:49 [vllm.py:834] Asynchronous scheduling is enabled.
(EngineCore pid=3667336) WARNING 05-19 02:11:49 [vllm.py:892] Enforce eager set, disabling torch.compile and CUDAGraphs. This is equivalent to setting -cc.mode=none -cc.cudagraph_mode=none
(EngineCore pid=3667336) WARNING 05-19 02:11:49 [vllm.py:903] Inductor compilation was disabled by user settings, optimizations settings that are only active during inductor compilation will be ignored.
(EngineCore pid=3667336) INFO 05-19 02:11:49 [kernel.py:199] Final IR op priority after setting platform defaults: IrOpPriorityConfig(rms_norm=['vllm_c', 'native'])
(EngineCore pid=3667336) INFO 05-19 02:11:49 [vllm.py:1081] Cudagraph is disabled under eager mode
(EngineCore pid=3667336) WARNING 05-19 02:11:50 [vllm.py:1249] Auto-initialization of reasoning token IDs failed. Please check whether your reasoning parser has implemented the `reasoning_start_str` and `reasoning_end_str`.
(EngineCore pid=3667336) INFO 05-19 02:11:50 [compilation.py:294] Enabled custom fusions: norm_quant, act_quant, allreduce_rms
(APIServer pid=3666862) INFO 05-19 02:11:50 [api_server.py:600] Supported tasks: ['generate']
(APIServer pid=3666862) INFO 05-19 02:11:50 [parser_manager.py:202] "auto" tool choice has been enabled.
(APIServer pid=3666862) WARNING 05-19 02:11:50 [model.py:1442] Default vLLM sampling parameters have been overridden by the model's `generation_config.json`: `{'temperature': 1.0, 'top_p': 0.95}`. If this is not intended, please relaunch vLLM instance with `--generation-config vllm`.
(APIServer pid=3666862) Could not cache non-existence of file. Will ignore error and continue. Error: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/.no_exist/f396cf805182f4ca10fa675e1a99815b3ca384db/processor_config.json'
(APIServer pid=3666862) Could not cache non-existence of file. Will ignore error and continue. Error: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/.no_exist/f396cf805182f4ca10fa675e1a99815b3ca384db/preprocessor_config.json'
(APIServer pid=3666862) Could not cache non-existence of file. Will ignore error and continue. Error: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/.no_exist/f396cf805182f4ca10fa675e1a99815b3ca384db/processor_config.json'
(APIServer pid=3666862) Could not cache non-existence of file. Will ignore error and continue. Error: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/.no_exist/f396cf805182f4ca10fa675e1a99815b3ca384db/preprocessor_config.json'
(APIServer pid=3666862) Could not cache non-existence of file. Will ignore error and continue. Error: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/.no_exist/f396cf805182f4ca10fa675e1a99815b3ca384db/video_preprocessor_config.json'
(APIServer pid=3666862) Could not cache non-existence of file. Will ignore error and continue. Error: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/.no_exist/f396cf805182f4ca10fa675e1a99815b3ca384db/preprocessor_config.json'
(APIServer pid=3666862) INFO 05-19 02:11:52 [api_server.py:604] Starting vLLM server on http://0.0.0.0:8011
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:37] Available routes are:
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /openapi.json, Methods: HEAD, GET
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /docs, Methods: HEAD, GET
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /docs/oauth2-redirect, Methods: HEAD, GET
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /redoc, Methods: HEAD, GET
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /tokenize, Methods: POST
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /detokenize, Methods: POST
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /load, Methods: GET
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /version, Methods: GET
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /health, Methods: GET
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /metrics, Methods: GET
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /v1/models, Methods: GET
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /ping, Methods: GET
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /ping, Methods: POST
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /invocations, Methods: POST
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /v1/chat/completions, Methods: POST
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /v1/chat/completions/batch, Methods: POST
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /v1/responses, Methods: POST
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /v1/responses/{response_id}, Methods: GET
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /v1/responses/{response_id}/cancel, Methods: POST
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /v1/completions, Methods: POST
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /v1/messages, Methods: POST
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /v1/messages/count_tokens, Methods: POST
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /inference/v1/generate, Methods: POST
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /scale_elastic_ep, Methods: POST
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /is_scaling_elastic_ep, Methods: POST
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /v1/chat/completions/render, Methods: POST
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /v1/completions/render, Methods: POST
(APIServer pid=3666862) INFO 05-19 02:11:52 [launcher.py:46] Route: /generative_scoring, Methods: POST
(APIServer pid=3666862) INFO:     Started server process [3666862]
(APIServer pid=3666862) INFO:     Waiting for application startup.
(APIServer pid=3666862) INFO:     Application startup complete.
(APIServer pid=3666862) INFO:     127.0.0.1:56544 - "GET /v1/models HTTP/1.1" 200 OK
(APIServer pid=3666862) INFO:     127.0.0.1:56548 - "POST /v1/chat/completions HTTP/1.1" 200 OK
(Worker_TP0 pid=3667549) WARNING 05-19 02:11:53 [flashmla_sparse.py:811] Padding num_heads from 8 to 64 for BF16 sparse prefill kernel
```
