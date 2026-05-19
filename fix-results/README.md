# Fix Results

The exact bad commit is `ac3dac545`:

```text
[Bugfix][Perf] Indexer upcast WK to BF16 for fusion (#38928)
```

The likely root cause is buffer lifetime with RunAI Model Streamer. Commit `ac3dac545` introduced `_pending_wk_fp8`, which temporarily stores FP8 indexer `wk` weights/scales until both tensors are available for BF16 dequantization into the fused `wk_weights_proj` parameter.

The original code stores the streamed tensor object directly:

```python
entry["weight" if is_weight else "scale"] = tensor
```

RunAI streamer can reuse backing buffers while iterating weights. Holding a streamed tensor past the current iterator step can therefore leave `_pending_wk_fp8` pointing at overwritten data. The subsequent dequantization can load corrupted indexer `wk` weights, which matches the observed corruption: the model loads and serves, but sparse-indexer-guided generation becomes gibberish.

The minimal validated fix is to clone tensors before buffering them:

```python
entry["weight" if is_weight else "scale"] = tensor.clone()
```

This preserves the intended FP8-to-BF16 fused-indexer path while making the delayed dequantization independent of streamer buffer reuse.

Validation:

| Case | Result |
| --- | --- |
| `18013df6a` unpatched | bad |
| `18013df6a` with full revert of `ac3dac545` | good |
| `18013df6a` with one-line clone fix | good |
| `v0.20.0` unpatched | bad |
| `v0.20.0` with one-line clone fix | good |

Artifacts:

| Path | Contents |
| --- | --- |
| `fix-results/18013-clone-pending-wk/` | one-line clone fix patch and validation summary on first bad nightly |
| `fix-results/v020-clone-pending-wk/` | one-line clone fix patch and validation summary on `v0.20.0` |
| `fix-results/18013-revert-ac3/` | full revert fallback patch and validation summary on first bad nightly |
| `bisect-results/v020-unpatched/` | unpatched `v0.20.0` bad validation summary |
