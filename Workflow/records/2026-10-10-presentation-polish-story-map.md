# L07 presentation polishing story map

## Scope and approval record

- Artifact: complete `Presentation/presentation.qmd`, including the PollsLive retrieval block.
- Date: 2026-10-10.
- Branch: `polish/l07-before-teaching` (planned); base: `ce67423`.
- Requested work: resolve findings A2–A5 and C1–C9 in [the review](2026-10-10-polish-review.md), with decisions D1 and D3 recorded there.
- Story-map status: complete.
- Heading-strip audit completed: [x].
- Knowledge-state audit completed: [x].
- Human story-map approval: approved.
- Approver: Ondřej Mottl.
- Approval date: 2026-10-10.
- Decision and requested revisions: explicit user decision „I appove all maps.“ (2026-10-10), recorded separately for each map; no revisions to rows or ledger. Decisions D1 (keep all seven illustrations) and D3 (more sections are fine) recorded in the review.
- This map is separate from the learning-material map and needs its own approval. It is derived from the revised written backbone. PollsLive quiz content and option order are unchanged.

## Complete physical story map

Each row is one physical slide. H1 rows are minimal section dividers. Fragment states do not count as extra slides. Illustration placements follow decision D1 (all seven in-deck illustrations kept).

| Order | Internal role | Level | Student-facing heading | Speaker note |
|---|---|---|---|---|
| 1 | Arrival screen | H2 | Mění klima původu tloušťku listů křídlatky? | `.course-title-illustrated` with reserved slot `kridlatka_titulni_ilustrace.png` and caption „Ilustrace vytvořená pomocí AI.“; L07, formal title, materials link unchanged. |
| 2 | Biological visual hook | H2 | Mění klima původu tloušťku listů křídlatky? | Retain detective illustration and the three incremental candidates; standard disclosure. |
| 3 | Retrieval title | H2 | Co si pamatujete z minulé lekce? | Unchanged generated include. |
| 4 | Retrieval Q1 | H2 | V modelu hmotnost_tela_g ~ druh je referenční skupinou Adélie. Co znamená intercept? | Unchanged. |
| 5 | Retrieval Q2 | H2 | Koeficient druhGentoo ve stejném modelu je přibližně +1 375 g. Jak ho číst? | Unchanged. |
| 6 | Retrieval Q3 | H2 | Celkový F-test modelu se třemi druhy dal velmi malou p-hodnotu. Co z něj plyne přímo? | Unchanged. |
| 7 | Learning contract | H2 | Výsledky učení | Shared five-item list; „Po absolvování této přednášky budete schopni:“; incremental, restrained highlights. |
| 8 | Section divider | H1 | Jedna teplota, jeden sklon | Familiar territory; no new term. |
| 9 | Recall | H2 | Co už umíme s jedním prediktorem? | Retain two panels. Takeaway without „Dnes“: „Novinka: jedna odezva, několik prediktorů současně — a s nimi jiná otázka.“ |
| 10 | Data context | H2 | Křídlatky z různých částí světa | Retain photos, credits and the flow strip. |
| 11 | MCQ | H2 | Co je jednotka analýzy? | Retain; B circled after discussion. |
| 12 | Reveal | H2 | Jeden bod představuje jednu zdrojovou populaci | Retain. |
| 13 | Whole-data encounter | H2 | Populace z teplejších oblastí mají v průměru tenčí listy | Retain plain scatter. |
| 14 | Think–pair–share | H2 | Co dokážeme vyčíst z grafu? | Retain. |
| 15 | Familiar model | H2 | Průměrná teplota má záporný sklon | Retain; 5 °C from named `zmena_teploty_C`. |
| 16 | Model check | H2 | Odpovídá přímka struktuře reziduí? | Retain. |
| 17 | Second predictor alone | H2 | Také nejteplejší měsíc souvisí s tloušťkou listu | Retain. |
| 18 | Section divider | H1 | Dva prediktory | |
| 19 | Open question | H2 | Co ukáže model s oběma teplotami? | Retain amethyst prompt slide. |
| 20 | MCQ | H2 | Co znamená znaménko `+` ve formuli? | Moved before the code slide. Formula shown on the slide; no illustration. Options reordered: A) Oba prediktory vstupují do jednoho modelu (correct, circled after discussion), B) Sečteme naměřené teploty, C) Oba koeficienty musí být kladné. |
| 21 | Code and composition | H2 | Jeden model může použít obě teploty | Retain code and takeaway equation; `dve_teploty_jeden_model.png` moves here from the MCQ (row 20), after the answer has been discussed. Standard disclosure and speaker note. |
| 22 | Conditional meaning | H2 | Každý sklon drží druhou teplotu stejnou | Retain. |
| 23 | Worked example | H2 | Jak model odhadne jednu populaci? | Retain CN35 table and substitution. |
| 24 | General form | H2 | Model skládá odhad ze tří příspěvků | Retain text equation, then symbols. |
| 25 | Section divider | H1 | Korelace prediktorů | Correlation is known from L02; the new part is its meaning for predictors. |
| 26 | Prediction | H2 | Které klimatické dvojice budou silně souviset? | Retain. |
| 27 | Evidence | H2 | Osm proměnných popisuje společné klima | Czech decimals; one label layer; retain reading strip. |
| 28 | Evidence | H2 | Průměrná a maximální teplota se mění společně (r = …) | Retain; r computed. |
| 29 | Consequence | H2 | Překrývající se informace zvětšuje nejistotu | t-based 95% intervals from `broom::tidy(conf.int = TRUE)`, labelled. |
| 30 | Interpretation | H2 | Přidáním prediktoru se změnila otázka | Retain the two-question panels and `sdilena_klimaticka_slozka.png`; standard disclosure. |
| 31 | Section divider | H1 | Původ populací | New divider; the origin block leaves the correlation section. |
| 32 | Evidence | H2 | Původ populací mění obraz vztahu | Retain grouped scatter; brand categorical colours. |
| 33 | Pointing task | H2 | Co porovnává celkový sklon? | Retain. |
| 34 | Model | H2 | Jeden model spojí teplotu i původ | Retain; visible `summary(object = mod_puvod)`. |
| 35 | Model picture | H2 | Aditivní model: rovnoběžné přímky | Lines limited to each group's observed range (C4). |
| 36 | Fill-in task | H2 | Jak čteme společný sklon a posun skupiny? | Retain. |
| 37 | Comparison | H2 | Při zohlednění původu sklon téměř mizí | Renamed from „téměř obrátí“; two-panel comparison retained. |
| 38 | Comparison and naming | H2 | Při zohlednění původu sklon téměř mizí | Slope comparison with t-based intervals; fragment names *konfundování*: origin is associated with temperature and with leaf thickness, so the overall slope mixes both paths. Matches written row 12. |
| 39 | Spine return | H2 | Co už víme o klimatické otázce? | Opening question verbatim in `box-question`; retain „Víme“ / „Ještě nevíme“ panels. |
| 40 | Section divider | H1 | Predikce při stejné teplotě | Merges the former „Odhad při společné teplotě“ and „Predikovatelné scénáře“ sections. |
| 41 | Evidence | H2 | Pro obě skupiny potřebujeme společnou teplotu | Retain ranges figure. |
| 42 | MCQ | H2 | Která teplota leží v překryvu obou skupin? | Options reordered: A) 21 °C, B) 1 °C, C) 14 °C (correct, circled after discussion). |
| 43 | Reveal | H2 | 14 °C leží uvnitř překryvu obou skupin | Value from `teplota_srovnani_C`. |
| 44 | Scenario rows | H2 | Dvě modelové populace se liší pouze původem | Retain code and table. |
| 45 | Substitution | H2 | Odhad při 14 °C | Remove „Opakování z minulé lekce“; the text equation is this lesson's content. Retain both substitutions and `predict()`. |
| 46 | Open question | H2 | Bodový odhad ještě neukazuje přesnost | Retain; `coef(object = mod_puvod)`. |
| 47 | Evidence | H2 | Modelové průměry doplníme o intervaly spolehlivosti | `specs = ~ puvod` in visible and hidden code; trailing comma removed. |
| 48 | Silent write and pair | H2 | Co zjistíme při stejné teplotě? | Retain. |
| 49 | Caveat | H2 | Model spočítá i kombinaci mimo pozorovaný mrak | Retain climate-passport illustration; standard disclosure. |
| 50 | MCQ | H2 | Který scénář má oporu v datech? | Retain; A circled after discussion. |
| 51 | Reveal | H2 | Jedna kombinace leží v mraku, druhá mimo něj | Retain. |
| 52 | Section divider | H1 | Pořadí prediktorů | |
| 53 | Prediction table | H2 | Změní pořadí prediktorů výsledek modelu? | Visible code uses `mod_dve_teploty` and `mod_dve_teploty_opacne`. |
| 54 | Reveal | H2 | Koeficienty se po změně pořadí nezmění | Retain. |
| 55 | Metaphor | H2 | Který prediktor dostane sdílenou klimatickou informaci? | Retain queue illustration. |
| 56 | Evidence | H2 | Sekvenční test čte formuli zleva doprava | Retain computed table. |
| 57 | Rule | H2 | Pořadí mění sekvenční test, nikoli fit modelu | Retain. |
| 58 | Section divider | H1 | Závěr | |
| 59 | Workflow strip | H2 | Jak postupovat u modelu s více prediktory | Retain. |
| 60 | Caveat | H2 | Společná zahrada sjednocuje prostředí, ne historii populací | Retain suitcases illustration. |
| 61 | Earned recap | H2 | Shrnutí | Renamed from „Co si odnést“; five bullets mirroring the outcomes, closing takeaway strip. |
| 62 | Closing question and bridge | H2 | Kdy by rovnoběžné přímky nestačily? | Retain diverging-paths illustration and bridge to the next lesson. |

## Physical count

- Baseline: 60 physical slides (51 H2 including the arrival screen, 4 retrieval slides, 5 H1 dividers).
- Proposed: 62 physical slides with seven H1 dividers (rows 8, 18, 25, 31, 40, 52, 58); see D3.
- Added: dividers „Jedna teplota, jeden sklon“, „Původ populací“, „Závěr“.
- Merged: „Odhad při společné teplotě“ and „Predikovatelné scénáře“ into „Predikce při stejné teplotě“.
- Reordered: the `+` MCQ (20) now precedes the code slide (21).
- Renamed: rows 37–38 („téměř mizí“), 45, 61.
- Illustrations (D1, all kept): title slot (new), detective (2), two thermometers (21, moved off the MCQ), shared climate folder (30), climate passport (49), queue (55), suitcases (60), diverging paths (62). Seven in-deck images exceed „about 3–5“ by author decision. All recorded in a new `Presentation/Materials/GENERATED_IMAGES.md`.

## Title image (proposed record)

- File: `Presentation/Materials/kridlatka_titulni_ilustrace.png` (reserved slot; shows nothing until the file exists).
- Reference assets: `kridlatka_japonska_cc0.jpg` (CC0), `spolecne_zahrady_cao_2025_ccby.jpg` (Cao et al. 2025, CC BY 4.0, attribution kept in the caption), `kridlatka_klimaticky_detektiv.png` (series character), the grouped scatter with parallel lines (row 35).
- Draft prompt: warm storybook natural-history watercolour/gouache; the knotweed detective character from the series stands in a common garden of identical pots holding knotweed plants from different parts of the world, each pot with a small travel suitcase; in the background, two softly drawn parallel paths in teal and terracotta; gentle academic humour, natural anatomy; brand palette accents; no text, numbers, letters, axes, charts, logos or watermarks.
- Alt text (draft): „Ilustrace křídlatky v roli detektiva ve společné zahradě s rostlinami z různých částí světa; v pozadí dvě rovnoběžné cesty. Ilustrace vytvořená pomocí AI.“
- Caption: „Ilustrace vytvořená pomocí AI. Fotografie zahrad: Cao et al. (2025), CC BY 4.0.“

## Chronological knowledge-state ledger

| Block / rows | May assume before | Introduced or earned here | Must not assume yet | Visible evidence / experience |
|---|---|---|---|---|
| Opening / 1–7 | L01–L06; retrieval uses only L06 content | Spine question; outcomes | Multiple predictors, confounding | Hook illustration, retrieval |
| One temperature / 8–17 | One-predictor `lm()`, SE, CI, residual plots | Unit of analysis; overall associations with two temperatures | Conditional coefficients | Photos, MCQ, scatter, two models, residual plots |
| Two predictors / 18–24 | Rows 8–17 | `+` composes one model; conditional slope; worked substitution; general notation | Interaction; correlated predictors | MCQ, code, cards, CN35 example |
| Correlation / 25–30 | L02 correlation; rows 18–24 | Predictors share information; SE grows; the question changes | VIF thresholds; model selection | Prediction, matrix, scatter, interval comparison |
| Origin / 31–39 | L06 categorical predictor; rows 18–30 | Group shift plus common slope; overall vs. same-origin slope; *konfundování* named after the evidence | Interaction fitting; causation | Grouped scatter, model table, parallel lines, slope comparison, spine return |
| Prediction / 40–51 | L06 `emmeans()`; CI meaning | Comparison inside the observed overlap; model means with intervals; supported versus unsupported combinations | Prediction intervals | Ranges, MCQ, substitutions, `emmeans()` figure, scenarios |
| Test order / 52–57 | L05 coefficient tests; L06 `anova()` | Order-invariant fit; order-dependent sequential tests | AIC; type II tests (written Extra only) | Prediction table, coefficient table, queue metaphor, sequential table |
| Ending / 58–62 | Whole lesson | Routine, design limits, recap, transfer | Interaction model results | Workflow strip, caveat, summary, closing question |

## Implementation and review contract

- Same shared rules as the learning-material map: one origin colour mapping, Czech decimals via `format_value_cz()`, „intercept“, consistent model names, named teaching inputs, no hand-typed computed values.
- Illustrations: `include_optional_figure()` slots for the title image; disclosure „Ilustrace vytvořená pomocí AI.“ with `.text-size-tiny .text-right` (photo credits stay in footers); speaker note per illustration; `GENERATED_IMAGES.md` per D2.
- In-deck MCQ answer positions become B, A, C, A; correct option circled in orange after discussion (L04/L05 pattern).
- Object locality, `fig-alt` on every figure, no `<style>` or inline `style=`, facilitation in `{.notes}`.
- Order: implement after the written backbone, clean-session run of visible chunks, offline canonical render, separate read-only vision review including all fragment states, full PDF inspection, then human review.
- Author audit: heading strip reads as a content narrative; no sequencing words in visible copy; `+` explained before the code that uses it; *konfundování* first in row 38; no callback claims L06 content it did not contain.

## Review-driven amendments (2026-10-10)

Independent read-only vision review (general-purpose capable model) of the source and all 62 rendered slides. Findings 1–14 and 16–24 were resolved; finding 15 concerns the generated PollsLive include (`Potom společně projdeme…`, orphan colon in the answer panel) and belongs to the upstream generator. Slide count (62), order and dividers are unchanged; changed student-facing headings:

| Order | Approved heading | Implemented heading | Reason |
|---|---|---|---|
| 13 | Populace z teplejších oblastí mají v průměru tenčí listy | Tloušťka listu a teplota místa původu | The heading answered the next slide's prompt. |
| 22 | Každý sklon drží druhou teplotu stejnou | Každý sklon platí při stejné druhé teplotě | Natural Czech. |
| 27 | Osm proměnných popisuje společné klima | Osm klimatických proměnných spolu souvisí | Natural Czech. |
| 40 | Predikce při stejné teplotě | Predikce jen v podložené oblasti | The section also covers two-temperature support. |
| 55 | Který prediktor dostane sdílenou klimatickou informaci? | Sdílenou informaci si vezme první prediktor ve formuli | The illustration showed the answer to the question heading. |

Other changes: slide 12 defines both origins with computed counts; slide 16 states the residual banding as an open question; slide 19 strip becomes an open question; slide 46 asks about the precision of both model means; slide 47 shows code, a Czech `emmeans` table and the non-overlap takeaway, and its figure moved to slide 48 (orange intervals); slide 34 visible code shows `coef()`; slide 45 shows the coefficient values; slides 11 and 26 show options from the start; slide 27 resolves the predicted pairs; colour roles realigned (model purple, uncertainty orange); emoji removed from axis titles; object locality fixed for `uroven_spolehlivosti`, `teplota_srovnani_C` and `p_rozsahy_srovnani`; Czech decimal commas on figure axes; one precision per coefficient.

## Author-requested amendment (2026-10-11)

Variable emoji return on figure axes (🌡️, 🌞, 🌿), rendered in colour with the ragg device and brand fonts (`R/Functions/use_ragg_brand_fonts.R`); ☀️ is replaced by 🌞 in slide text so that the icon matches the figures. Headings, order and slide count are unchanged.

## Human decision

Approved by Ondřej Mottl on 2026-10-10 („I appove all maps.“), recorded separately for this map and its ledger. Author decisions: „It is ok to have more images“ (D1) and „More sections is fine“ (D3).

Final artifact, review-driven amendments and author-requested amendments approved by Ondřej Mottl on 2026-10-11 („I appove this new version of lecture“). The generated title image `kridlatka_titulni_ilustrace.png` (2026-10-11) is part of the approved version and is recorded in `Presentation/Materials/GENERATED_IMAGES.md`.
