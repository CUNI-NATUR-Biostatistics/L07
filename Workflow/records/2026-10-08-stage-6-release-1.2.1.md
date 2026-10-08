# Stage 6: release L07-v1.2.1-20261008

- Requester: Ondrej Mottl, 2026-10-08.
- Authorization: "Go one by one and make new Release" for L03-L08; "rerun manually workflows if needed" for successful HUB acceptance. L09 is excluded.
- Target: `L07-v1.2.1-20261008` at merged main commit `c319723ccab51fb8f254f7f4f3ee1a59523a6e09`.
- No new teaching source edits, commits, branch pushes, PollsLive synchronization, or activation are included in this release operation.

## Pre-publication validation

- Local main is clean for tracked files and matches GitHub main. Packaging uses exact Git bytes from `git -c core.autocrlf=false archive`; no working-copy line-ending conversion enters the bundle.
- The canonical shared Ruby packager validates website-release.yml, including lesson, academic year, file existence and the public allowlist.
- ZIP integrity, exact 10-resource allowlist, source byte identity, sizes and SHA-256 hashes pass; public source/data encoding and credential-marker checks pass.
- The bundle includes the approved exercise and license. Existing complete-exercise independent review, clean-session/reference-harness evidence, and human approval are recorded in the lesson exercise workflow records; unchanged exercises were not retested merely for this release.
- Committed PDFs: 37 learning-material pages and 60 presentation pages. Presentation HTML equals docs/index.html by bytes.
- Retrieval key: `CBD`. Credential-free lesson validator passes. The latest source/render independent-review evidence remains applicable.
- Repository is public. Pages uses Actions. The github-pages environment permits main and the intended lesson tags.
- Evidence directory: `C:\Users\ondre\AppData\Local\Temp\biostat-releases-5f1a5e3f\L07`. Prepared ZIP SHA-256: `d88a27a34f01207141ed37f920ab54984d7df99439f305c39f2faf3a02248dc1`.

## Title and provenance gate

- The title slide has the course logo but lacks the required lesson-derived generated illustration. The requirement and the missing illustration remain recorded.
- Explicit publication exception approved by Ondrej Mottl on 2026-10-08: "yes, you can publish them even though they do not have title ilustration". This authorizes publication of the unchanged reviewed L05-L08 bundles; it does not claim that the illustration requirement has been met.

## Publication and live verification

- Stable GitHub release: not yet verified/published.
- Stable and immutable Pages routes and resource hashes: pending.
- HUB release entry and stable links: pending.

## Remaining limits

- Offline quiz rendering does not prove live PollsLive synchronization, scheduled opening or activation. Those operations are separate and were not performed.
- Existing pedagogical/layout limitations remain in the latest lesson review records; publication does not erase them.
- The shared tag-triggered stale Pages defect remains an infrastructure follow-up if encountered. Recovery uses a fresh supported workflow, not repeated reruns of a contaminated artifact run.
- This local Stage 6 record is excluded from the public allowlist and remains uncommitted for the repository owner.
