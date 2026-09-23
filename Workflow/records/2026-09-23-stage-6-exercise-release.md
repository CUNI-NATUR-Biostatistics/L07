# L07 Stage 6 exercise release

## Release decision

- Date: 2026-09-23
- Target tag: `L07-v1.1.0-20260923`
- Branch: `release/l07-v1.1.0-20260923`, based on updated `main` after exercise PR #1 merged
- Authorization: Ondřej Mottl requested and authorized the complete release sequence on 2026-09-23
- Release change: add the approved `Exercises/cviceni.R` to the public allowlist and expose stable student links in `README.md`

## Public bundle and routes

The manifest publishes the approved learning-material HTML, PDF, and source; presentation HTML, PDF, and source; the practical R script; the knotweed population CSV; `LICENSE.md`; and the dataset provenance README. No answer key, private notes, student information, credentials, or restricted assessment material is included.

Expected stable routes after the release workflow completes:

- `https://cuni-natur-biostatistics.github.io/L07/current/learning/`
- `https://cuni-natur-biostatistics.github.io/L07/current/presentation/`
- `https://cuni-natur-biostatistics.github.io/L07/current/code/cviceni.R`
- `https://cuni-natur-biostatistics.github.io/L07/current/data/kridlatka_populace.csv`
- immutable snapshot under `https://cuni-natur-biostatistics.github.io/L07/releases/L07-v1.1.0-20260923/`

## Validation evidence

- Repository visibility is public. GitHub Pages uses GitHub Actions with HTTPS enforced.
- The `github-pages` environment allows `main` and tags matching `L07-v*`.
- The manifest identifies L07, academic year 2026–27, and the approved lesson title; every allowlisted path exists in the merged tree.
- `LICENSE.md` retains the CC BY 4.0 / MIT split and third-party exclusions. `data/README.md` documents the Dryad and CHELSA provenance, CC0 terms, and CSV checksum.
- The approved exercise contains no answer key or private course administration. Its clean-session, reference-solution, encoding, visual, and independent-review checks are recorded in `2026-09-23-exercise-blueprint.md`; human approval is complete.
- The README directs students to stable `/current/` resources and does not present `main` or `/preview/` as the approved student version.
- The existing learning-material and presentation HTML/PDF artifacts are unchanged from stable release `L07-v1.0.0-20260921`; this minor release adds the approved practical script and corresponding public links.

## Remaining operational checks

After the release PR is merged, create and push `L07-v1.1.0-20260923`, wait for the release workflow to finish, then verify the GitHub release, immutable route, `/current/` exercise and data downloads, and HUB refresh. The 68-minute practical timing remains an author estimate rather than a beginner-group observation; this does not block publication.
