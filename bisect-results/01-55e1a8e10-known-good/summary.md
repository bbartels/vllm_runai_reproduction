# 55e1a8e1035bddb0b5b63f9ddecc8b4e16fc3ef6

Result: good

Metrics:

- done: True
- decoded_text_chars: 186
- non_ascii_ratio: 0.0108
- has_greeting: True
- has_bad_marker: False

Versions:

```text
vllm==0.19.1rc1.dev312+g55e1a8e10.precompiled
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
commit=55e1a8e1035bddb0b5b63f9ddecc8b4e16fc3ef6
subject=[Mooncake] Fix mixed MLA+Eagle block-size validation (#39596)
commit_date=2026-04-15T11:36:47-07:00
started_at=2026-05-19T02:00:23+00:00
ready_after_seconds=73
repro_status=0

```

Decoded Stream Excerpt:

```text
The user just said "hi". I'll respond with a friendly greeting.Hi there! 👋 How can I help you today? Whether it's coding, debugging, file management, or anything else — just let me know!
```

Raw Stream Excerpt:

```text
data: {"id":"chatcmpl-afe45127de82a225","object":"chat.completion.chunk","created":1779156129,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"role":"assistant","content":""},"logprobs":null,"finish_reason":null}],"prompt_token_ids":null}

data: {"id":"chatcmpl-afe45127de82a225","object":"chat.completion.chunk","created":1779156129,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":"The"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-afe45127de82a225","object":"chat.completion.chunk","created":1779156129,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" user"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-afe45127de82a225","object":"chat.completion.chunk","created":1779156129,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" just"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-afe45127de82a225","object":"chat.completion.chunk","created":1779156129,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" said"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-afe45127de82a225","object":"chat.completion.chunk","created":1779156129,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" \""},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-afe45127de82a225","object":"chat.completion.chunk","created":1779156129,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":"hi"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-afe45127de82a225","object":"chat.completion.chunk","created":1779156129,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":"\"."},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-afe45127de82a225","object":"chat.completion.chunk","created":1779156129,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" I"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-afe45127de82a225","object":"chat.completion.chunk","created":1779156129,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":"'ll"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-afe45127de82a225","object":"chat.completion.chunk","created":1779156129,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" respond"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-afe45127de82a225","object":"chat.completion.chunk","created":1779156129,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" with"},"logprobs":null,"finish_reason":null,"token_ids":null}]}

data: {"id":"chatcmpl-afe45127de82a225","object":"chat.completion.chunk","created":1779156129,"model":"zai-org/GLM-5.1-FP8","choices":[{"index":0,"delta":{"reasoning":" a"},"logprobs":
```

Server Log Tail:

```text
Loading safetensors using Runai Model Streamer:   0% Completed | 1/119028 [00:05<167:50:04,  5.08s/it]
(Worker_TP0 pid=3653643) 
Loading safetensors using Runai Model Streamer:  11% Completed | 12645/119028 [00:07<00:46, 2276.95it/s]
(Worker_TP0 pid=3653643) 
Loading safetensors using Runai Model Streamer:  21% Completed | 24559/119028 [00:09<00:27, 3460.17it/s]
(Worker_TP0 pid=3653643) 
Loading safetensors using Runai Model Streamer:  31% Completed | 37403/119028 [00:11<00:18, 4415.44it/s]
(Worker_TP0 pid=3653643) 
Loading safetensors using Runai Model Streamer:  41% Completed | 49172/119028 [00:13<00:14, 4878.79it/s]
(Worker_TP0 pid=3653643) 
Loading safetensors using Runai Model Streamer:  51% Completed | 61182/119028 [00:15<00:11, 5227.36it/s]
(Worker_TP0 pid=3653643) 
Loading safetensors using Runai Model Streamer:  61% Completed | 72550/119028 [00:17<00:08, 5327.85it/s]
(Worker_TP0 pid=3653643) 
Loading safetensors using Runai Model Streamer:  70% Completed | 83830/119028 [00:19<00:06, 5419.53it/s]
(Worker_TP0 pid=3653643) 
Loading safetensors using Runai Model Streamer:  80% Completed | 95207/119028 [00:21<00:04, 5442.42it/s]
(Worker_TP0 pid=3653643) 
Loading safetensors using Runai Model Streamer:  90% Completed | 106882/119028 [00:23<00:02, 5559.27it/s]
(Worker_TP0 pid=3653643) 
Loading safetensors using Runai Model Streamer:  99% Completed | 118215/119028 [00:25<00:00, 5532.70it/s]
(Worker_TP0 pid=3653643) 
Loading safetensors using Runai Model Streamer: 100% Completed | 119028/119028 [00:25<00:00, 4631.52it/s]
(Worker_TP0 pid=3653643) 
(Worker_TP0 pid=3653643) /home/benjaminba/vllm-bisect-venv/lib/python3.12/site-packages/torch/distributed/c10d_logger.py:83: UserWarning: barrier(): using the device under current context. You can specify `device_id` in `init_process_group` to mute this warning.
(Worker_TP0 pid=3653643)   return func(*args, **kwargs)
(Worker_TP0 pid=3653643) INFO 05-19 02:01:59 [fp8.py:577] Using MoEPrepareAndFinalizeNoDPEPModular
(Worker_TP0 pid=3653643) INFO 05-19 02:02:00 [gpu_model_runner.py:4823] Model loading took 89.34 GiB memory and 33.258903 seconds
(Worker_TP0 pid=3653643) INFO 05-19 02:02:00 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP5 pid=3653648) INFO 05-19 02:02:00 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP4 pid=3653647) INFO 05-19 02:02:00 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP6 pid=3653649) INFO 05-19 02:02:00 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP1 pid=3653644) INFO 05-19 02:02:00 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP7 pid=3653650) INFO 05-19 02:02:00 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP3 pid=3653646) INFO 05-19 02:02:00 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP2 pid=3653645) INFO 05-19 02:02:00 [interface.py:489] Setting kv cache block size to 64 for DEEPSEEK_V32_INDEXER backend.
(Worker_TP0 pid=3653643) INFO 05-19 02:02:01 [fused_moe.py:1077] Using configuration from /home/benjaminba/vllm-bisect-src/vllm/model_executor/layers/fused_moe/configs/E=256,N=256,device_name=NVIDIA_H200,dtype=fp8_w8a8,block_shape=[128,128].json for MoE layer.
(Worker_TP0 pid=3653643) INFO 05-19 02:02:04 [gpu_worker.py:436] Available KV cache memory: 32.11 GiB
(EngineCore pid=3653429) INFO 05-19 02:02:04 [kv_cache_utils.py:1319] GPU KV cache size: 344,192 tokens
(EngineCore pid=3653429) INFO 05-19 02:02:04 [kv_cache_utils.py:1324] Maximum concurrency for 202,752 tokens per request: 1.70x
(Worker_TP6 pid=3653649) INFO 05-19 02:02:04 [ssu_dispatch.py:207] Using triton Mamba SSU backend.
(Worker_TP4 pid=3653647) INFO 05-19 02:02:04 [ssu_dispatch.py:207] Using triton Mamba SSU backend.
(Worker_TP2 pid=3653645) INFO 05-19 02:02:04 [ssu_dispatch.py:207] Using triton Mamba SSU backend.
(Worker_TP0 pid=3653643) INFO 05-19 02:02:04 [ssu_dispatch.py:207] Using triton Mamba SSU backend.
(Worker_TP7 pid=3653650) INFO 05-19 02:02:04 [ssu_dispatch.py:207] Using triton Mamba SSU backend.
(Worker_TP5 pid=3653648) INFO 05-19 02:02:04 [ssu_dispatch.py:207] Using triton Mamba SSU backend.
(Worker_TP3 pid=3653646) INFO 05-19 02:02:04 [ssu_dispatch.py:207] Using triton Mamba SSU backend.
(Worker_TP1 pid=3653644) INFO 05-19 02:02:04 [ssu_dispatch.py:207] Using triton Mamba SSU backend.
(Worker_TP5 pid=3653648) 2026-05-19 02:02:04,918 - INFO - autotuner.py:446 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP6 pid=3653649) 2026-05-19 02:02:04,918 - INFO - autotuner.py:446 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP7 pid=3653650) 2026-05-19 02:02:04,918 - INFO - autotuner.py:446 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP2 pid=3653645) 2026-05-19 02:02:04,918 - INFO - autotuner.py:446 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP4 pid=3653647) 2026-05-19 02:02:04,918 - INFO - autotuner.py:446 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP3 pid=3653646) 2026-05-19 02:02:04,918 - INFO - autotuner.py:446 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP1 pid=3653644) 2026-05-19 02:02:04,919 - INFO - autotuner.py:446 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP0 pid=3653643) 2026-05-19 02:02:04,919 - INFO - autotuner.py:446 - flashinfer.jit: [Autotuner]: Autotuning process starts ...
(Worker_TP5 pid=3653648) 2026-05-19 02:02:05,212 - INFO - autotuner.py:455 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP6 pid=3653649) 2026-05-19 02:02:05,212 - INFO - autotuner.py:455 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP2 pid=3653645) 2026-05-19 02:02:05,212 - INFO - autotuner.py:455 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP7 pid=3653650) 2026-05-19 02:02:05,212 - INFO - autotuner.py:455 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP0 pid=3653643) 2026-05-19 02:02:05,212 - INFO - autotuner.py:455 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP3 pid=3653646) 2026-05-19 02:02:05,212 - INFO - autotuner.py:455 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP4 pid=3653647) 2026-05-19 02:02:05,212 - INFO - autotuner.py:455 - flashinfer.jit: [Autotuner]: Autotuning process ends
(Worker_TP1 pid=3653644) 2026-05-19 02:02:05,212 - INFO - autotuner.py:455 - flashinfer.jit: [Autotuner]: Autotuning process ends
(EngineCore pid=3653429) INFO 05-19 02:02:05 [core.py:307] init engine (profile, create kv cache, warmup model) took 4.50 s
(EngineCore pid=3653429) Warning: You are sending unauthenticated requests to the HF Hub. Please set a HF_TOKEN to enable higher rate limits and faster downloads.
(EngineCore pid=3653429) INFO 05-19 02:02:06 [vllm.py:834] Asynchronous scheduling is enabled.
(EngineCore pid=3653429) WARNING 05-19 02:02:06 [vllm.py:892] Enforce eager set, disabling torch.compile and CUDAGraphs. This is equivalent to setting -cc.mode=none -cc.cudagraph_mode=none
(EngineCore pid=3653429) WARNING 05-19 02:02:06 [vllm.py:903] Inductor compilation was disabled by user settings, optimizations settings that are only active during inductor compilation will be ignored.
(EngineCore pid=3653429) INFO 05-19 02:02:06 [kernel.py:199] Final IR op priority after setting platform defaults: IrOpPriorityConfig(rms_norm=['vllm_c', 'native'])
(EngineCore pid=3653429) INFO 05-19 02:02:06 [vllm.py:1081] Cudagraph is disabled under eager mode
(EngineCore pid=3653429) WARNING 05-19 02:02:07 [vllm.py:1249] Auto-initialization of reasoning token IDs failed. Please check whether your reasoning parser has implemented the `reasoning_start_str` and `reasoning_end_str`.
(EngineCore pid=3653429) INFO 05-19 02:02:07 [compilation.py:294] Enabled custom fusions: norm_quant, act_quant, allreduce_rms
(APIServer pid=3653167) INFO 05-19 02:02:07 [api_server.py:600] Supported tasks: ['generate']
(APIServer pid=3653167) INFO 05-19 02:02:07 [parser_manager.py:202] "auto" tool choice has been enabled.
(APIServer pid=3653167) WARNING 05-19 02:02:07 [model.py:1442] Default vLLM sampling parameters have been overridden by the model's `generation_config.json`: `{'temperature': 1.0, 'top_p': 0.95}`. If this is not intended, please relaunch vLLM instance with `--generation-config vllm`.
(APIServer pid=3653167) Could not cache non-existence of file. Will ignore error and continue. Error: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/.no_exist/f396cf805182f4ca10fa675e1a99815b3ca384db/processor_config.json'
(APIServer pid=3653167) Could not cache non-existence of file. Will ignore error and continue. Error: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/.no_exist/f396cf805182f4ca10fa675e1a99815b3ca384db/preprocessor_config.json'
(APIServer pid=3653167) Could not cache non-existence of file. Will ignore error and continue. Error: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/.no_exist/f396cf805182f4ca10fa675e1a99815b3ca384db/processor_config.json'
(APIServer pid=3653167) Could not cache non-existence of file. Will ignore error and continue. Error: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/.no_exist/f396cf805182f4ca10fa675e1a99815b3ca384db/preprocessor_config.json'
(APIServer pid=3653167) Could not cache non-existence of file. Will ignore error and continue. Error: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/.no_exist/f396cf805182f4ca10fa675e1a99815b3ca384db/video_preprocessor_config.json'
(APIServer pid=3653167) Could not cache non-existence of file. Will ignore error and continue. Error: [Errno 13] Permission denied: '/home/benjaminba/.cache/huggingface/hub/models--zai-org--GLM-5.1-FP8/.no_exist/f396cf805182f4ca10fa675e1a99815b3ca384db/preprocessor_config.json'
(APIServer pid=3653167) INFO 05-19 02:02:09 [api_server.py:604] Starting vLLM server on http://0.0.0.0:8011
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:37] Available routes are:
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /openapi.json, Methods: GET, HEAD
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /docs, Methods: GET, HEAD
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /docs/oauth2-redirect, Methods: GET, HEAD
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /redoc, Methods: GET, HEAD
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /tokenize, Methods: POST
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /detokenize, Methods: POST
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /load, Methods: GET
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /version, Methods: GET
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /health, Methods: GET
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /metrics, Methods: GET
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /v1/models, Methods: GET
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /ping, Methods: GET
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /ping, Methods: POST
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /invocations, Methods: POST
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /v1/chat/completions, Methods: POST
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /v1/chat/completions/batch, Methods: POST
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /v1/responses, Methods: POST
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /v1/responses/{response_id}, Methods: GET
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /v1/responses/{response_id}/cancel, Methods: POST
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /v1/completions, Methods: POST
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /v1/messages, Methods: POST
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /v1/messages/count_tokens, Methods: POST
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /inference/v1/generate, Methods: POST
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /scale_elastic_ep, Methods: POST
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /is_scaling_elastic_ep, Methods: POST
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /v1/chat/completions/render, Methods: POST
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /v1/completions/render, Methods: POST
(APIServer pid=3653167) INFO 05-19 02:02:09 [launcher.py:46] Route: /generative_scoring, Methods: POST
(APIServer pid=3653167) INFO:     Started server process [3653167]
(APIServer pid=3653167) INFO:     Waiting for application startup.
(APIServer pid=3653167) INFO:     Application startup complete.
(APIServer pid=3653167) INFO:     127.0.0.1:55206 - "GET /v1/models HTTP/1.1" 200 OK
(APIServer pid=3653167) INFO:     127.0.0.1:55208 - "POST /v1/chat/completions HTTP/1.1" 200 OK
(Worker_TP0 pid=3653643) WARNING 05-19 02:02:09 [flashmla_sparse.py:811] Padding num_heads from 8 to 64 for BF16 sparse prefill kernel
(APIServer pid=3653167) INFO 05-19 02:02:19 [loggers.py:271] Engine 000: Avg prompt throughput: 231.7 tokens/s, Avg generation throughput: 0.1 tokens/s, Running: 1 reqs, Waiting: 0 reqs, GPU KV cache usage: 0.8%, Prefix cache hit rate: 0.0%
(APIServer pid=3653167) INFO 05-19 02:02:29 [loggers.py:271] Engine 000: Avg prompt throughput: 0.0 tokens/s, Avg generation throughput: 0.0 tokens/s, Running: 1 reqs, Waiting: 0 reqs, GPU KV cache usage: 0.8%, Prefix cache hit rate: 0.0%
```
