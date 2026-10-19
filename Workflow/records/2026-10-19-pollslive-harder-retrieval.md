# L07 PollsLive retrieval quiz: harder replacement questions

- Date: 2026-10-19
- Branch: `pollslive-harder-retrieval`
- Workstream: focused post-presentation PollsLive revision
- Approver: Ondřej Mottl (human author)
- Decision: approved on 2026-10-19 in the authoring session. The author accepted replacing the already activated quiz ("shame but need to redo it").

Integration-map status: unchanged and approved. Exact-question status: approved.

## Reason for the revision

After teaching L03 the author judged the retrieval questions far easier than the Moodle self-tests. The previous L07 set named the reference group in the stem and then asked what the intercept means, so it could be answered from the stem alone. The new set asks students to derive a difference between two non-reference groups, to predict the effect of changing the reference group, and to read a post-hoc interval plot.

## Integration map

The retrieval block keeps its approved position before `Výsledky učení`. No other slide changes.

| Position | Teaching move | Student knowledge used | Bridge |
|---|---|---|---|
| Q1 | Derive a difference between non-reference groups from coefficients | L06 coefficients as differences from the reference | Coefficients answer questions relative to what the model holds fixed. |
| Q2 | Predict how relevel changes intercept and coefficients | L06 reference change | The meaning of a coefficient depends on the model's structure. |
| Q3 | Read simultaneous Tukey intervals | L06 post-hoc comparison | Several predictors make each coefficient conditional on the others. |

## Exact production questions

The canonical text is `pollslive/quiz.json`.

| Question ID | Correct option | Key | Distractors and the misconception each encodes |
|---|---|---|---|
| `gentoo-minus-chinstrap` | asi 1 343 g | D | 1 375 g (reads the Gentoo coefficient as the pairwise difference); 1 408 g (adds the coefficients); "nelze" (thinks a missing row means the estimate is unavailable) |
| `zmena-reference-na-gentoo` | 5 076 g a −1 375 g | B | nothing changes; sign not reversed; intercept and coefficient swapped |
| `zaver-parovych-porovnani` | Gentoo heavier than both; Chinstrap and Adélie not distinguished | C | significant F means all pairs differ; interval containing zero proves equality; a positive point estimate counts as proven |

Checked numbers (fresh R session, 342 penguins): intercept 3 700,7 g, druhChinstrap +32,4 g, druhGentoo +1 375,4 g; with Gentoo as reference the intercept is 5 076,0 g and druhAdelie −1 375,4 g. Tukey 95% intervals (emmeans, revpairwise): Chinstrap − Adélie 32 [−127; 191], Gentoo − Adélie 1 375 [1 243; 1 508], Gentoo − Chinstrap 1 343 [1 178; 1 507] g.

## Knowledge-state ledger

| Item | Available before quiz? | Evidence in L06 |
|---|---|---|
| Intercept = reference mean; other coefficients = differences from it | yes | slides and learning materials on `mod_tri` |
| A non-reference difference is the difference of two coefficients | yes | learning materials; Moodle family `rozdil-nereferencnich` |
| relevel changes intercept, names and signs but not group means or the overall test | yes | learning materials; Moodle family `reference-zmena` |
| Tukey intervals; a significant F does not say which pairs differ; an interval containing zero does not prove equality | yes | slides `Výsledek post-hoc testu` and `Tři rozdíly na jedné ose` |

## Evidence

| Asset | Source | SHA-256 |
|---|---|---|
| `l06-species-coefficients.png` | unchanged from the previous quiz; rendered by `R/render_pollslive_assets.R` | `9a1a646b366ab56f60e71914321306b272491bec759e1a3635fe461c3dff2b4c` |
| `l06-three-species-means.png` | unchanged byte-identical copy of L06 `three_species_means.png` | `0c2cc9c10223440035d6311d54fefda1ab21465f3f04577d2087d9a457a8216a` |
| `l06-posthoc-species-intervals.png` | byte-identical copy of L06 `Presentation/Materials/posthoc_species_intervals.png` | `efd1659c9c4e29e8b9c45dd9a27326a0451fb3048c0131307913a90a6f2d0896` |

The previous asset `l06-f-distribution-showcase.png` is removed.

## Answer key and course balance

L07 key: D B C (the previous key was C B D). The course-wide table is in L04 `Workflow/records/2026-10-19-pollslive-harder-retrieval.md`.

## Activation consequence

The previous L07 definition is synchronized, and its `_internal` activation row is enabled for 2026-11-16 with pinned checksums. Before 2026-11-16 the new definition must be pushed, synchronized while the poll is closed and has no responses, re-reviewed, and its new input and remote-content checksums approved in a separate `_internal` activation PR. Until then the activation row pins the checksums of the old content.

## Validation

- `node pollslive/validate.mjs`: passed without credentials.
- `Rscript R/verify_pollslive_assets.R`: passed.
- Offline render: see the review section.

## Review

Independent read-only review: completed on 2026-10-19 by a separate reviewer subagent (canonical prompt `.ai/agents/vision-corrector.md`, scoped to the retrieval block of L04, L05, L06, L07, L08 and L10; a capable general-purpose model, chosen because the task is a focused content review of 18 short items). No blockers: every keyed answer was confirmed correct, every distractor wrong, and the course-wide key balance verified.

Should-fix, resolved: Q2's options used 3 701 g and 1 375 g, which only Q1's evidence showed; the Q2 stem now states both numbers. Q3's correct option was the longest; it was shortened and a distractor lengthened. Minor, resolved: the Q1 explanation was reworded.

Focused re-check of these corrections by the same reviewer: pending.

## Operational boundary

No staging, commits, pushes, live PollsLive operations, response submissions or activation changes were made.
