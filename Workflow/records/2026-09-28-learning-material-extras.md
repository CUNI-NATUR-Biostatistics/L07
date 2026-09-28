# L07 learning-material Extras revision

## Approval and scope

- Date: 2026-09-28
- Branch: `lesson/l07-learning-material-extras`
- Human approver: Ondřej Mottl
- Decision: approved in the course-wide L01-L08 Extra-content review and explicitly authorised for implementation on 2026-09-28.
- Scope: extend the existing correlated-predictor narrative and prevent the misconception that every available variable should be controlled.

## Mandatory story map

- Artifact: Learning materials amendment
- Story-map status: complete
- Heading-strip audit completed: [x]
- Knowledge-state audit completed: [x]
- Human story-map approval: approved
- Approved by: Ondřej Mottl
- Approval date: 2026-09-28
- Approval decision and requested revisions: The course-wide L01-L08 Extra-content map was approved and implementation was explicitly authorised; no revisions were requested. The table below records that approved content in the canonical format without changing its substance.

| Order | Internal role | Student-facing heading | Speaker note |
|---|---|---|---|
| 1 | Collinearity consequence | Doplňující: korelované prediktory mohou vytvářet nestabilní koeficienty | Place after the coefficient and SE comparison so the VIF preview interprets evidence students have already seen. |
| 2 | Adjustment warning | Doplňující: přidat další prediktor není vždy správná kontrola | Use verbal causal roles only to challenge the rule of adding every available variable; do not teach identification or DAG procedures. |

## Knowledge-state ledger

| Concept block | May assume before | Introduced or earned here | Must not assume yet | Evidence or experience |
|---|---|---|---|---|
| Correlated predictors and coefficient stability | Students have just seen SE grow when correlated temperature predictors enter together. | Individual coefficients can become unstable; VIF is a warning aid, not a universal decision threshold. | Automated deletion or formal model selection. | Extend the displayed two-temperature coefficient comparison; model selection is L09. |
| Roles of additional variables | Students can interpret a coefficient conditional on other predictors. | A confounder, mediator and common consequence have different roles; adding every variable can change the question or introduce bias. | Formal causal identification or DAG analysis. | Use verbal biological examples; advanced causal inference remains beyond the course. |

## Leakage audit

- The lesson does not claim that a statistical adjustment proves causality.
- VIF is not given a rigid threshold and does not become a model-selection rule.

## Review and validation

- Independent amendment review: passed after moving the VIF block below its coefficient/SE evidence and removing an unsupported prediction-stability claim.
- Glossary coverage: checked for the added prose; `VIF`, `mediator` and `collider` remain explicitly marked as future glossary additions.
- Source checks: UTF-8 without BOM, no replacement characters, `git diff --check` passed.
- Render: the locked R packages were restored from `renv.lock`, and project-native HTML and PDF rendering then passed under a valid Windows UTF-8 locale. All 37 PDF pages were inspected through lesson-wide contact sheets, with both new Extra pages checked at readable size; no clipping, overlap, broken glyphs or orphaned blocks remain. The startup still warns that the project-local `renv` activation is incomplete, although the render itself succeeds.
- Pre-existing full-artifact review notes outside this amendment: an existing equation progression/hardcoded teaching input and incomplete glossary infrastructure remain candidates for a later cleanup.
