# L07 exercise blueprint

## Status and teaching boundary

- Date: 2026-09-23
- Branch: `lesson/l07-exercises`, created from clean `main` at `68923d3` after the released presentation and learning materials
- Sources: released L07 written lesson and presentation, `_internal/osnova_lekci.md`, and the L06 practical
- Independent exercise review: complete; final focused re-review reported no findings
- Human exercise approval: Ondřej Mottl, 2026-09-23; approved the completed worksheet with no requested revisions

The 90-minute practical has a planned 68-minute direct-work route: 10 minutes for project and file preparation, then 58 minutes for L07-U01 through L07-U08. About 22 minutes remain for explanation, discussion, and slower groups. The same public script must work for classroom use and self-study. Teacher transitions, pacing cues, and troubleshooting policy remain in this record rather than the student worksheet.

## Outcomes, prerequisites, starting states, and timing

| Segment | Purpose and approved L07 outcome | Starting state and knowledge | Direct work |
| --- | --- | --- | ---: |
| Preparation | Obtain the script and approved CSV, open an RStudio Project, and verify the relative path. | L06 project and CSV workflow; complete instructions remain visible for independent study. | 10 min |
| L07-U01 | Load and inspect 128 population means, set origin factor order, verify completeness, and identify the unit of analysis; supports all outcomes. | Open project and CSV preflight; L06 `read.csv()`, `nrow()`, `table()`, `is.na()`, and `factor()`. | 7 min |
| L07-U02 | Plot and fit the familiar one-predictor annual-temperature model; establish the unadjusted slope for later comparison; outcomes 1–2. | `data_kridlatka` from U01; L03–L05 `plot()`, `lm()`, `coef()`, `confint()`, and residual diagnostics. | 7 min |
| L07-U03 | Fit the first two-predictor additive model and interpret each coefficient while holding the other temperature constant; outcome 1. | `data_kridlatka` and `mod_rocni_teplota`; immediately preceding independent synthetic worked example demonstrates formula `+`. | 8 min |
| L07-U04 | Quantify predictor correlation and compare the annual-temperature estimate and SE between one- and two-predictor models; outcomes 2–3. | Models from U02–U03; `cor()` introduced in L02; full coefficient tables named in the task. | 7 min |
| L07-U05 | Combine categorical origin and annual temperature, interpret the reference, adjusted group difference, and common slope, and connect additivity to parallel lines; outcomes 1–2. | Factor order and data from U01; L06 reference-group coefficients; L07 conditional interpretation from U03. | 8 min |
| L07-U06 | Determine the observed overlap, create two supported scenarios at 14 °C, and predict model means with confidence intervals; outcome 1 and prediction boundary. | `data_kridlatka` and `mod_puvod`; independent worked `predict()` example immediately before the task. | 7 min |
| L07-U07 | Reverse temperature-predictor order, verify invariant fit and coefficients, and contrast order-dependent sequential ANOVA tests with coefficient tests; approved L07 distinction. | `mod_dve_teploty`; L06 `anova()` and L05 coefficient p-values; equality checks specified in the task. | 7 min |
| L07-U08 | Complete the integrated workflow and explain why the overall and origin-adjusted slopes answer different questions; outcomes 1–3. | Outputs from U01–U07; familiar residual plot and confidence interval; explicit conclusion checklist. | 7 min |

The L06 refresher is skippable when students already know reference groups, coefficient tables, confidence intervals, `anova()`, and residual plots. Project and file setup remains permanent because the practical depends on a local CSV. Later tasks explicitly name their student-created dependencies.

## Dataset, dependencies, and scientific boundaries

- The only required input is `data/kridlatka_populace.csv`, the released L07 teaching table assembled from Cao et al. (2025) Dryad data and CHELSA-BIOCLIM 2.1. Each of 128 rows is one source-population mean from the Shanghai common garden: 55 `Puvodni` and 73 `Zavleceny`, with no missing values in the modeled variables.
- The student script uses preloaded base R packages only. It does not install or attach packages, alter the working directory, depend on private helpers, or create student solution objects when sourced unfilled.
- The independent refresher data are explicitly synthetic and use distinct `_priklad` objects. They demonstrate an additive formula and `predict()` without solving a knotweed task.
- Reference values: annual-temperature slope −0.0091332 mm/°C, SE 0.0008462, 95% CI −0.0108077 to −0.0074586; five-degree change −0.0456658 mm. The annual and maximum temperatures correlate at 0.8545793.
- In the two-temperature model, annual-temperature slope is −0.0052789 (SE 0.0015853) and maximum-temperature slope is −0.0047509 (SE 0.0016700). The coefficients are conditional, not two separate marginal trends.
- In the origin-plus-temperature model, original populations are the reference, `puvodZavleceny` is +0.1089473 mm, and the common annual-temperature slope is +0.0014910 mm/°C with 95% CI −0.0009100 to 0.0038920. The observed ranges are 12.15–19.95 °C and 5.95–16.35 °C, giving overlap 12.15–16.35 °C. At 14 °C the predicted means are 0.3323001 and 0.4412474 mm.
- Reversing the two temperature predictors leaves coefficients and fitted values unchanged. Sequential ANOVA gives the first-listed predictor the shared information: annual-first sums of squares are 0.201696 and 0.013265; maximum-first values are 0.196788 and 0.018173.
- Conclusions are limited to associations among the sampled source populations grown in a common garden. Common conditions reduce current environmental variation but do not erase population history, genetic differences, or correlated geography. Neither model proves causation.
- Outside scope: fitting or interpreting interactions, VIF thresholds, stepwise or automated selection, unrestricted all-predictor models, choosing a model by R² or AIC, causal attribution, and deleting observations solely because they are influential.

## Optional practice

| Task | Purpose and exact starting state | Estimated work |
| --- | --- | ---: |
| L07-N01 | Build the correlation matrix for the eight named climate columns and identify strong positive and negative pairs; uses `data_kridlatka`. | 7 min |
| L07-N02 | Plot and predict supported `(14, 29)` and unsupported `(7, 33)` two-temperature scenarios; uses `mod_dve_teploty`. | 7 min |
| L07-N03 | Compare raw origin means with U06 model estimates at 14 °C and explain the changed comparison; uses `data_kridlatka` and `data_scenare`. | 6 min |
| L07-N04 | Relevel origin to `Zavleceny`, refit the same model, and verify invariant fitted values; uses `data_kridlatka` and `mod_puvod`. | 6 min |
| L07-N05 | Inspect Cook’s distance, identify the most influential population, and state an evidence-based follow-up without automatic deletion; uses `mod_puvod`. | 6 min |
| L07-N06 | Correct three misconceptions about predictor count, changed coefficients, and causal interpretation; uses the core results. | 5 min |

The optional bank is about 37 minutes and is not a completion target. Teachers may ask students to predict coefficient changes before U04, contrast overall and conditional questions before U05, and articulate what is held constant before U06. These facilitation cues must not enter the public worksheet.

## Validation and review gates

Before human review: parse and verify UTF-8 without BOM; source the unfilled script in a clean temporary project with the CSV; verify the missing-file failure in a second temporary project; solve U01–U08 and N01–N06 in an untracked reference harness; verify all expected values, plots, labels, and factor directions; audit first use, task anatomy, progressive hints, prohibited patterns, provenance, and public content; rehearse the distribution route; and assess timing. Assign the complete worksheet and blueprint to a separate read-only reviewer using `_internal/.ai/agents/exercise-reviewer.md`, resolve credible findings, and rerun affected checks.

The release manifest remains unchanged until explicit human approval. A later release workflow must add `Exercises/cviceni.R` under `resources.exercises` and verify the stable download route before the worksheet link is described as live.

## Completed validation and review

- The worksheet parses, is UTF-8 without BOM or replacement characters, and sources from a clean temporary project under the available Czech UTF-8 locale. With the CSV missing, it stops with the intended Czech recovery message. The unfilled script creates only its file-path check, synthetic refresher objects, and reusable group display vectors; it does not create any student solution data or models.
- An untracked reference harness solved all eight core and six optional tasks. It verified row and group counts, missingness, factor direction, all coefficients and intervals, the 5 °C contrast, predictor correlation and standard errors, shared temperature range, predictions at 14 °C, sequential ANOVA sums of squares, full climate-correlation matrix, supported and unsupported scenarios, raw group means, reference invariance, and the most influential population (`JA2`).
- Four reference plots were generated and visually inspected: the one-predictor relationship, the accessible parallel-line display, the explicitly labelled residual diagnostic, and the supported-versus-unsupported predictor scenarios. Czech labels and units rendered correctly.
- All 14 tasks contain a starting state, commented answer space, expected result or interpretation criterion, progressively more concrete hints, and an interpretation prompt. A focused search found no package attachment or installation, working-directory change, `attach()`, required `View()`, `par()`, absolute local path, teacher cue, or answer key.
- A separate read-only exercise reviewer identified four initial findings and one focused follow-up: stale plot state in N02, a missing required parallel-line display, default diagnostic labels, a reversed subtraction hint, an incomplete negative-correlation expectation, and missing axis-label requirements in U05. All were corrected. The final focused re-review reported `No findings.`
- The planned 68-minute route is plausible but tight, especially U05–U08, and has not been observed with a beginner group. The live exercise URL remains unavailable until explicit human approval and a later release workflow updates `website-release.yml`.

## Revision 2026-11-12 (pre-teaching review)

Trigger: the 2026-11-12 pre-teaching review of L07 against the current `.ai/` guidance. Ondřej Mottl decided to fix every finding, to add the standing practices from earlier lessons, and to accept a longer core route („Accept longer route“, 2026-11-12). Branch: `fix/l07-pre-teaching-review`.

### Changes to `Exercises/cviceni.R`

- Origin colours now use the brand pair of the skripta and deck (`Puvodni` teal `#4E9A8A`, `Zavleceny` terracotta `#C2613A`); finding A2 of the 2026-10-10 review is resolved.
- Refresher: no lesson codes; the intercept bullet states what the previous lesson taught (mean of the reference group); the bullet on coefficient tests that consider other predictors (L07 content) is removed; a reminder of the overall F-test from `anova()` and of the three residual plots is added. Lesson codes in the closing section are replaced by „následující lekce“ and „pozdější lekce“.
- Standing practices: U01 adds a histogram of `tloustka_listu_mm` before the summaries; U08 adds the residual histogram and the Q–Q plot of `mod_puvod` with computed expected results and an interpretation prompt; optional N05 adds the 4/n line, the count above it and the leave-one-out slope range. A sixth self-check question asks about the three residual plots.
- Every core task and N01, N02 and N05 now give numbered steps in `Zadání`.
- The two „Připomenutí“ blocks are renamed „Ukázka: …“ and each gains one comment on what to notice in the printed output. A new worked example „Ukázka: barvy skupin, přímka a legenda“ before U05 recalls colours indexed by a factor, `abline(a = , b = )` and `legend()` from an earlier practical on the synthetic data; U05 `Zadání` states that the named vectors are indexed with `data_kridlatka$puvod`, and its `Nápověda 2` names the `legend()` arguments.
- Terminology: „model s více prediktory“, „otázka s jedním prediktorem“, „oblak bodů“, „referenční skupina“, „predikce“ for scenario values, „Statisticky významný koeficient“ in N06.

### New and changed expected values (reference harness, 2026-11-12)

- U01: leaf thickness 0,292–0,519 mm; histogram with default breaks has two peaks (0,30–0,35 mm: 45 populations; 0,40–0,45 mm: 53).
- U08: residuals of `mod_puvod` range from −0,090 to +0,108 mm; 112 of 128 (87,5 %) lie within ±0,04 mm; the Q–Q plot departs from the line at both ends (skewness about 0,87).
- N05: 4/n = 0,031; 11 of 128 populations exceed it (5 `Puvodni`, 6 `Zavleceny`); maximum 0,087 for JA2; leave-one-out temperature slope 0,00119–0,00184 mm/°C.
- All other expected values are unchanged and were reproduced.

### Timing

The practical lasts 120 minutes. The planned direct-work route of 68 minutes recorded above is superseded. The realistic core route for a beginner group is now about 105–110 minutes: preparation 12–15, U01 10, U02 10, U03 8, U04 8, worked examples 6, U05 13–15, U06 10, U07 8, U08 16–18. This exceeds the 85–95 minute budget of `exercises.md`; Ondřej Mottl accepted the longer route on 2026-11-12. The optional bank (about 40 minutes) is not a completion target. The estimate has not been observed with a beginner group.

### Standing practices (`check_prior_practices.R L07`, 2026-11-12)

| Practice | Disposition |
|---|---|
| `plot_distribution_before_summary` | applied: U01 step 4 |
| `plot_residual_histogram` | applied: U08 step 3 |
| `plot_residual_qq` | applied: U08 step 3 |
| `show_groups_in_plot` | false positive: U05 colours and symbols the groups with a legend; the pooled U02 plot deliberately shows the overall question |
| `check_influential_observations` | applied in optional N05 (4/n line, count, leave-one-out range) |
| `show_confidence_band` (not triggered) | omitted: the fitted lines in U02 and U05 are drawn with `abline()` without a band, to keep the core route within the accepted time; the band is shown in the skripta and deck |

### Validation

- Parses; UTF-8 without BOM; CRLF; no line above 80 characters except the data URL.
- The unfilled script sources from a clean session (`Rscript --vanilla`) in a mirrored `L07_praktikum/` folder and creates only the file check, the synthetic `_priklad` objects and the display vectors; without the CSV it stops with the Czech recovery message.
- An untracked reference harness solved U01–U08 and N05 and reproduced every new and unchanged expected value listed above.

### Open

- Independent re-review with `exercise-reviewer.md` of the revised script.
- Re-approval by Ondřej Mottl: the 2026-09-23 approval predates the 2026-10-15 layout change and this revision.
