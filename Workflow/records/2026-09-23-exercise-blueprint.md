# L07 exercise blueprint

## Status and teaching boundary

- Date: 2026-09-23
- Branch: `lesson/l07-exercises`, created from clean `main` at `68923d3` after the released presentation and learning materials
- Sources: released L07 written lesson and presentation, `_internal/osnova_lekci.md`, and the L06 practical
- Independent exercise review: complete; final focused re-review reported no findings
- Human exercise approval: pending

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

