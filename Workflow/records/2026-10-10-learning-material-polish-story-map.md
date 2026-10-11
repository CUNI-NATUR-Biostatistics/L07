# L07 learning-material polishing story map

## Scope and approval record

- Artifact: complete `Learning_materials/skripta.qmd`, including retained optional material.
- Date: 2026-10-10.
- Branch: `polish/l07-before-teaching` (planned); base: `ce67423`.
- Requested work: resolve findings A2–A5 and B1–B11 in [the review](2026-10-10-polish-review.md).
- Story-map status: complete.
- Heading-strip audit completed: [x].
- Knowledge-state audit completed: [x].
- Human story-map approval: approved.
- Approver: Ondřej Mottl.
- Approval date: 2026-10-10.
- Decision and requested revisions: explicit user decision „I appove all maps.“ (2026-10-10), recorded separately for each map; no revisions to rows or ledger. Decisions D1 (keep all seven illustrations) and D3 (more sections are fine) recorded in the review.
- Preserve the knotweed common-garden dataset, the two-temperature and origin models, the order-dependent `anova()` sequence, the supported/unsupported prediction scenario and all optional boxes (Dryad/CHELSA preparation, R², VIF, model selection, interaction preview, Cook's distance, mediator/collider, safe prediction, type II tests). This is a polishing pass, not a new stage sequence.

## Complete story map

One row per major section or concept block. Headings are planned student-facing headings, not full prose.

| Order | Internal role | Student-facing heading | Speaker note |
|---|---|---|---|
| 1 | Biological opening, recall and prediction | Úvod | Short recall: one numeric predictor gave a slope, one categorical predictor gave group differences. Knotweed as a global invader; common gardens explained in one sentence. Spine question in `box-question` „Mění klima původu tloušťku listů křídlatky?“. Prediction box: „Populace z teplejších míst mají tenčí listy. Co dalšího se může s teplotou místa původu měnit?“ Collapsed answer lists other climate variables, origin and population history, without results. |
| 2 | Learning contract | Výsledky učení | Shared five-item list from the review record, identical in the deck. Replaces „Co se v této lekci naučíme“ (7 items). |
| 3 | Data entry and inspection | Každý řádek je jedna zdrojová populace | Cao et al. (2025) and CHELSA in two sentences. CSV link, save to `data/`, visible `read.csv(file = "data/kridlatka_populace.csv")`, `factor()` with level order, `summary()`, `str()`, missing values, `table()` of origin; Czech step comments, named arguments. Variable table retained. Counts and ranges inline. Unit-of-analysis question with collapsed answer. |
| 4 | Optional provenance | Doplňující: stažení a příprava dat | Retain the collapsed Dryad/CHELSA box unchanged in substance; object names gain type prefixes. |
| 5 | Whole-data reading | Populace z teplejších oblastí mají v průměru tenčí listy | Plain scatter (brand theme, grey points, `fig-alt`). Noticing box with collapsed answer. Visible `cor()`; the correlation lacks units, which motivates the model. |
| 6 | Familiar one-predictor model | Jedna teplota, jeden sklon | Visible `lm()` and `summary()`; reading box with collapsed answer. Slope in Czech decimals. Text-only equation „odhadnutá změna tloušťky = sklon × rozdíl teplot“, then substitution with named `zmena_teploty_C`. Figure with line and band. Retain R² Extra. |
| 6a | Model check | Sedí přímka k datům? (H3) | Visible `fitted()`/`resid()` scatter with Czech labels and a dashed zero line; what to look for and what we see. Replaces `plot(which = 1)`. |
| 7 | Second familiar model | Také nejteplejší měsíc souvisí s tloušťkou listu | `mod_max_teplota`, figure, one-sentence residual check (same transparent plot). Short: both models describe a decreasing trend from one part of the climate. |
| 8 | Two predictors in one model | Jeden model, dvě teploty | `+` in the formula; `summary()`; „Které tři parametry model odhadl?“ with collapsed answer naming *intercept* (glossary) and both conditional slopes in units. Text-only equation → substitution for population CN35 selected by ID → collapsed result → general symbols with every symbol explained. Conditional meaning stated in words. |
| 9 | Overlapping climate information | Klimatické proměnné nenesou nezávislé informace | Prediction box with collapsed answer; correlation matrix in the deck's colours (amethyst positive, grey negative) with Czech decimals; code Extra retained; scatter of the two temperatures. |
| 10 | Why the estimate changed | Proč se odhad roční teploty změnil? | Replaces „Porovnání modelů“. Both coefficient tables; estimate and SE before and after; correlated predictors leave few populations that differ in one temperature at almost the same other temperature, so the SE grows. „Jakou otázku zodpovídá koeficient roční teploty?“ with collapsed answer. Retain VIF and model-selection Extras. |
| 10a | Model check | Změnil druhý prediktor strukturu reziduí? (H3) | Transparent residual plot for `mod_dve_teploty` only (the first model's plot is not repeated). |
| 11 | Origin as a second explanation | Původ populací mění příběh vztahu | Scatter by origin (brand categorical colours), noticing box with collapsed answer; within-group versus between-group reading; `mod_puvod` with `summary()`; reading box with collapsed answer; parallel lines limited to each group's range. Retain interaction Extra. |
| 11a | Model check | Sedí model s teplotou a původem k datům? (H3) | Transparent residual plot; retain Cook's distance Extra with glossary link. |
| 12 | Confounding, named after the evidence | Při stejném původu sklon teploty téměř mizí | New main-route section. Figure: the two temperature slopes with t-based 95% intervals (overall vs. same origin), as in the deck. Prose: origin is associated with both temperature and leaf thickness, so the overall slope mixes two paths; name *konfundování* (glossary) here. Neither coefficient is „the true one“; they answer different questions. Retain the mediator/collider Extra directly after. |
| 13 | Comparing groups at one temperature | Jak porovnat skupiny při stejné teplotě? | Reordered (B10): raw origin means first and why they mix origin with climate → observed ranges and overlap (computed once) → named `teplota_pro_porovnani` inside the overlap → two scenario rows → text-only equation → both substitutions → `predict()` check → abstract formula. Ends with the open question about precision. |
| 14 | Adding uncertainty | Jak přesně známe modelové průměry? | `emmeans(specs = ~ puvod, at = …)` with intervals; what the interval describes; figure with both model means. Retain safe-prediction Extra (uses `teplota_pro_porovnani`, visible table code, Czech labels). |
| 15 | Order of predictors and tests | Záleží u testu na pořadí prediktorů? | Retain the sequence and H3s „Co se změní v tabulce koeficientů?“ and „Sekvenční analýza rozptylu klade otázky zleva doprava“, with collapsed answers to both question boxes. Retain warning box, type II Extra and „Výběr prediktorů patří do dalších lekcí“. |
| 16 | Working routine | Jak postupovat u modelu s více prediktory | Retain the eight-step checklist. |
| 17 | Answer to the spine question | Co tedy můžeme říct o křídlatce? | Absorbs „Společná zahrada neznamená náhodně přiřazené klima“. Opening question verbatim; computed overall slope, slope at the same origin and origin difference at the comparison temperature; limits of the common-garden design; association, not causation. Example reporting box (L05 pattern). |
| 18 | Bridge | Co bude následovat dál | Parallel lines are an assumption; the next lesson asks when the effect of one predictor depends on the other. Later lessons compare candidate models. |
| 19 | Earned recap | Shrnutí | Five bullets mirroring the outcomes. Replaces „Co si odnést“. |
| 20 | Transfer commitment | Závěrečná otázka (H3 under Shrnutí) | Same closing question as the deck: „Jaký biologický vzorec by vyžadoval různé sklony pro obě skupiny?“ Collapsed possible answers without fitting an interaction. |
| 21 | Term reference | Slovníček pojmů | HTML glossary table and PDF online fallback. |

## Chronological knowledge-state ledger

| Block / rows | May assume before | Introduced or earned here | Must not assume yet | Visible evidence / experience |
|---|---|---|---|---|
| Opening / 1–2 | L02 correlation; L03–L05 one-predictor `lm()`, slope, SE, CI, p-value, residual plots; L06 categorical predictor, reference group, `anova()`, `emmeans()` | Spine question; the idea that several characteristics vary together | Multiple predictors, conditional coefficients, confounding | Knotweed context; prediction with collapsed answer |
| Data / 3–4 | `read.csv()`, `factor()`, `summary()`, `str()`, `table()` | One source population per row; climate belongs to the population | Plant-level analysis | Runnable code with output; variable table; collapsed provenance |
| One temperature / 5–7 | Scatterplots, correlation, `lm()`, residual plots | Overall decreasing association with annual and with maximum temperature | That either slope isolates one climate component | Plain scatter, models, figures, transparent residual plots |
| Two temperatures / 8 | One-predictor slope and intercept | `+` in the formula; conditional coefficient „při stejné hodnotě druhé teploty“; general notation | Interaction; correlated predictors | Output, three-parameter box, CN35 substitution |
| Overlap / 9–10a | Correlation; SE from L04 | Correlated predictors share information; estimate changes and SE grows | VIF thresholds, model selection | Correlation matrix, temperature scatter, coefficient tables |
| Origin / 11–12 | L06 categorical coefficients; rows 8–10 | Additive model with a group shift and a common slope; overall vs. same-origin slope; *konfundování* named after the evidence | Interaction fitting; causal claims | Grouped scatter, parallel lines, slope comparison with intervals |
| Same temperature / 13–14 | L06 `emmeans()`; `predict()`; CI meaning | Why raw means mislead here; comparison inside the observed overlap; model means with intervals | Prediction intervals for single populations | Raw means, range overlap, substitutions, `emmeans()` output and figure |
| Tests / 15–16 | L05 coefficient t-tests; L06 `anova()` and F | Order-invariant coefficients and fit; order-dependent sequential tests | AIC and model comparison | Two coefficient tables, `all.equal()`, two `anova()` tables |
| Ending / 17–21 | Whole lesson | Supported answer to the spine question with limits; recall; transfer | Interaction model results | Spine return, reporting box, bridge, summary, closing question, glossary |

## Implementation and review contract

- Shared rules with the presentation map: one origin colour mapping (brand categorical teal/terracotta), data grey, model purple, interpretation orange; Czech decimals via `R/format_value_cz.R`; „intercept“ with glossary link; model names `mod_rocni_teplota`, `mod_max_teplota`, `mod_dve_teploty`, `mod_dve_teploty_opacne`, `mod_puvod`; named teaching inputs (`zmena_teploty_C`, `teplota_pro_porovnani`, example population ID); seed 900723 where randomness is used; no hand-typed computed values.
- Source hygiene: L05 glossary setup with fallbacks; `glossary-headings.lua`; `theme_biostat()` and `biostat_cols`; `fig-alt` on every figure; Typst `date: last-modified`; Czech step comments, named arguments and type prefixes in visible code; Typst `#block(breakable: false)` around short code+output pairs where pagination splits them; objects created next to first use; unwrapped prose.
- Do not add interaction fitting, VIF thresholds, automatic selection, AIC calculations or new predictors.
- Order: implement, clean-session run of every visible chunk from `data/kridlatka_populace.csv` alone, canonical HTML/PDF render, glossary-coverage pass, separate read-only vision review, full PDF inspection, then human review.
- Author audit: heading strip reads as a content narrative; *intercept* glossed in row 8; correlated predictors named in row 9 only after the prediction; *konfundování* first in row 12 after the slope comparison; no row needs a later concept.

## Review-driven amendments (2026-10-10)

Independent read-only vision review (general-purpose capable model) and glossary-coverage review (economical model) of the implemented artifact; all findings were resolved and the vision reviewer re-verified the corrections. Headings and order are unchanged.

- Terminology: „residuum/residua“ throughout (`terminology.md`, L04/L05), including headings and axis labels.
- Row 6a, 7, 10a, 11a: base-R residual plots gain Czech `fig-alt` and explicit text sizes. The residual plots of the temperature-only models are described honestly: no arch or funnel, but residuals tend to lie below zero at low fitted values and above zero in the middle; row 11a states that origin explains this grouping. Probe: origin explains 12 % of the residual variance of the one-temperature model.
- Row 9–10: the prediction and noticing prompts no longer contain their answers; the SE explanation follows the collapsed answer.
- Row 11a: Cook's distance sentence is computed and conditional (no population stands out).
- Row 12: visible `confint()` for both models precedes the slope comparison.
- Row 13: one sentence explains why raw and model differences are close here.
- Origin colour vectors moved from setup to a hidden chunk before their first use; temperature ranges shown with two decimals; 25 glossary first occurrences added.

## Author-requested amendments (2026-10-11)

Ondřej Mottl, during review of the polished learning materials:

- Variable table: all eight climate variables are „potenciální spojitý klimatický prediktor“; `puvod` is „potenciální kategoriální prediktor“.
- Variable emoji return on figure axes (🌡️ annual temperature, 🌞 hottest month, 🌿 leaf thickness). Figures use the ragg device with the brand fonts registered through `R/Functions/use_ragg_brand_fonts.R`, because showtext cannot draw colour emoji. The sun is 🌞 rather than ☀️, which the Inter font draws as a monochrome glyph.
- „Doplňující“ blocks use `.box-data collapse="true"` as in L02–L06; `.box-extra` had no Typst styling and rendered in a default colour in the PDF.
- Question „anova(mod_null, mod_dve_teploty)?“: added as the optional block „Doplňující: test celého modelu“. It connects the last line of `summary()` with the overall F-test from the previous lesson and leaves comparison of candidate models to the later lesson.

## Human decision

Approved by Ondřej Mottl on 2026-10-10 („I appove all maps.“), recorded separately for this map and its ledger.

Final artifact, review-driven amendments and author-requested amendments approved by Ondřej Mottl on 2026-10-11 („I appove this new version of lecture“).
