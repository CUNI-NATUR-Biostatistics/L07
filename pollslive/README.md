# L07 PollsLive retrieval quiz

The approved three-question quiz retrieves L06 reference coding and the overall species test. The exact content and placement were approved by Ondrej Mottl on 2026-09-18.

`quiz.json` and `config.json` use the merged `_L-template` schema-version-2 adapter. The client is pinned to reviewed `_internal` commit `8f85e9f9e31dc1b0f05912d5605e4c9cc557e8e6`.

`R/render_pollslive_assets.R` verifies the byte-identical L06 mean plot and F-distribution plot, verifies the copied L06 penguin data, and regenerates the coefficient figure from `lm(hmotnost_tela_g ~ druh)` with Adélie as reference. Do not replace these assets with a different version of the L06 evidence.

Run `node pollslive/validate.mjs`, then set `POLLSLIVE_RENDER_MODE=offline` and run `Rscript R/render_presentation.R`. Generated files under `pollslive/generated/` remain ignored. Synchronized rendering requires the approved inputs to be committed and pushed; activation is a separate `_internal` PR after the lesson PR merges.
