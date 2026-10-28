# SithasoDaisy5 delivery gates

This is the delivery contract for prompt-to-app work. It adapts the B4XDaisyUIKit gate sequence to B4J/BANano and the evidence available for SithasoDaisy5. Gates are evidence states, not claims based on model confidence.

| State transition | Gate | Owner | Evidence to close |
|---|---|---|---|
| `REQUESTED → PLANNED` | plan | `sd5-application-planner` | `.agent/PLAN.md` and classified prompt requirements |
| `PLANNED → CONTRACTED` | G0 requirements | planner + validator | contracts pass `validate-contracts.py --write-index`; `contract.index.json` written; critical REQ IDs have TEST IDs |
| `CONTRACTED → BOOTSTRAPPED` | G1 architecture | `sd5-project-bootstrap` | `.b4j` module/file counts, registered page files, startup reaches `pgIndex` and requested page |
| `BOOTSTRAPPED → IMPLEMENTED` | G2 feature slice | `sd5-feature-engineer` + `sithasodaisy5` | each requested requirement traces through screen/component/code; APIs verified against source/reference/demo; every inventory row provenance-checked (manifest + provenance lists + date) |
| `IMPLEMENTED → STATIC_VERIFIED` | G3 source integrity | `sd5-web-verify` | pre-scan, registry coverage, lifecycle and conformance logs pass |
| `STATIC_VERIFIED → BUILT` | G4 compilation | `build-banano-app.ps1` | B4JBuilder exit 0 + fresh BANano `index.html`/`scripts/app.js` + success marker; `BUILD-<stamp>.md` written; `Publish` path lands in the Laragon app folder |
| `BUILT → RUNTIME_VERIFIED` | G5 browser runtime | build-watch/browser | app loads; no console/resource errors; contracted page, title, theme and content render |
| `RUNTIME_VERIFIED → UX_VERIFIED` | G6 UX/design quality/accessibility | desktop + phone captures + UX review | every contracted screen has desktop and phone renders; each viewport passes the scored design gate, accessibility review, and has no release-blocking findings |
| `UX_VERIFIED → REGRESSION_VERIFIED` | G7 regression | `sd5-web-regression` | changed and impacted checks pass; baseline failures are separately listed |
| `REGRESSION_VERIFIED → RELEASE_CANDIDATE` | — (bundling) | orchestrator | G0–G7 evidence collected into the app folder |
| `RELEASE_CANDIDATE → DELIVERED` | G8 evidence | orchestrator + `verify-production-hardening.ps1` | hardening PASS on published output + all gate evidence and run instructions bundled |

## Gate status vocabulary

- `PASS`: the required artifact or behavior was checked and evidence is recorded.
- `FAIL`: a check ran and its acceptance condition did not pass.
- `BLOCKED`: required environment, dependency, or prerequisite was unavailable. Name it.
- `NOT RUN`: a gate was intentionally omitted or not yet attempted. It is not pass.
- `NOT APPLICABLE`: the contract explains why that gate does not apply; it is not a substitute for G4/G5 on a requested working app.

## Gate scope and retries

- G0/G1/G4/G5/G8 are whole-app gates. G2/G3/G6/G7 can be assessed per feature/screen and then as a whole app where shared code is involved.
- A retry means a gate was evaluated, failed with recorded evidence, a targeted change was made, and that same scope was re-evaluated. Do not retry without a new change or new evidence.
- Maximum three remediation cycles for the same gate and scope. Record counts and evidence links in `.agent/STATE.md`. After three unsuccessful changes, stop repeated attempts on that scope, report it `FAIL`, and state the unresolved issue. Continue unrelated work.
- Every changed gate creates a new state/evidence row; retain old outcomes so failures are not hidden by later passes.

## Minimum app handoff

```text
.agent/PLAN.md
.agent/STATE.md
.agent/DECISIONS.md
.agent/impact-analysis.md
.agent/REGRESSION.md
contract/application.md
contract/navigation.md
contract/data-contract.md
contract/business-rules.md
contract/acceptance-tests.md
contract/features/*.md
contract/screens/*.md
pre-scan.log
verify-conformance.log
build log / output location
ux-review/BUILD-WATCH-*.md
ux-review/screens/*.png
ux-review/UX-REVIEW-*.md
```

Only files that apply to the request need content, but their status and reason belong in `.agent/STATE.md`. Build/runtime evidence cannot be synthesized from source.

## Remediation loop — precise mechanics

One loop = (1) gate evaluated for a **scope** (whole-app, or feature/screen
ID) returns fail + evidence; (2) orchestrator invokes the table's owner skill
for that gate with the failure evidence (not a blank retry); (3) skill
changes; (4) gate re-evaluated for the same scope + new evidence row in
`.agent/STATE.md` (never overwrite — Constitution Art VI discipline for
specs applies to state rows too); (5) pass → counter for that `(gate, scope)`
resets to 0; fail → increments.

Counters live in `.agent/STATE.md` keyed by `(gate, scope-id)`:

```yaml
remediation-loop-count:
  G3:
    FEATURE-002: 1
  G7:
    <whole-app>: 0
```

A global-per-gate counter is wrong: one feature's 3 failed G3 attempts would
block every future feature at G3. **4th failure of the same (gate, scope)**
→ orchestrator halts + escalates per Constitution Art X with gate, scope, all
3 prior evidence rows, the unresolved question. No 4th attempt on agent
judgment.

## Runbook mapping (normative — use with `../SKILL.md` procedure steps)

| Orchestrator step | Gate |
|---|---|
| 1. Plan + 2. G0 Contract (`validate-contracts.py --write-index`) | G0 (contracts validate + `contract.index.json` written; critical REQ → TEST) |
| 3. G1 Bootstrap (`.b4j` + `pgIndex` + pages) | G1 (module/file counts, routes resolve) |
| 4. G2 Implement (feature-engineer + sithasodaisy5) | G2 (provenance-checked components, trace REQ→CODE) |
| 5. G3 Static integrity (pre-scan + contract + conformance) | G3 |
| 6. G4 Build (`build-banano-app.ps1` + Laragon `Publish`) | G4 (exit 0 + identified output in app folder) |
| 7. G5 Runtime (build-watch) | G5 (load, console, resources, title/theme/content) |
| 8. G6 UX (desktop + phone capture + ux-review.md) | G6 (all screenshots reviewed; score gate and accessibility pass; no blocking findings) |
| 9. G7 Regression | G7 (impact scope passes; `.agent/REGRESSION.md`) |
| 10. G8 Delivery | bundling + G8 (hardening PASS + evidence bundle, per-gate status) |

## Worked example — finance dashboard, end to end

Planner drafts REQ/TEST + contracts → CONTRACTED (G0, `validate-contracts.py`
PASS). Bootstrap writes `FinanceDashboard.b4j` + `pgIndex` + page → G1.
Feature-engineer composes Container/Text/Progress per contract → G2. Pre-scan
CLEAN + conformance PASS → STATIC-VERIFIED (G3). B4J compile exit 0 + BANano
transpile → BUILT (G4, `.agent/build/BUILD-20261010-030936.md`). BUILD-WATCH:
no JS errors, no failed loads, title OK (2 warnings: no data-theme,
`#financePage` id) → RUNTIME-VERIFIED (G5). Mobile screenshot captured;
human UX pass open → G6 pending. Regression: greenfield smoke path → G7.
Bundle + per-gate status → DELIVERED (G8) once G6 closes.

## STATE.md write-back

Every row above regenerates `.agent/STATE.md`: gate entries added/updated,
lifecycle-state advanced, evidence paths appended. STATE.md regeneration *is*
the transition record — never agent narration after the fact.
