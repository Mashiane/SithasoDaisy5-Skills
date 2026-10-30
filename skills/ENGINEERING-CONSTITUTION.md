# ENGINEERING CONSTITUTION
### SithasoDaisy5 Web Application Engineering System

**Status:** v1.0-adopted (2026-10-11). Governs all AI agents, skills, tooling
that generate, modify, verify, or release B4J/BANano web apps on SithasoDaisy5.
**Scope:** B4J/BANano browser apps only. The framework transpiles B4J to
JavaScript (`BANano.BuildAsB4xlib`); the runtime is the browser. Not native
Android/B4A/B4X — the sibling `b4xdaisyuikit-skills` methodology is precedent
only, its UIKit APIs do not apply here.
**Source:** Adapted from `b4xdaisyuikit-skills/ENGINEERING-CONSTITUTION.md`
v1.0. Articles below restate only what this repo's skills, scripts, and
evidence support. Amend per Art XI.

> Generative agents produce claims. Deterministic tooling produces evidence.

## Article I — Source-of-Truth Hierarchy

Truth flows downward. A lower level may never be overridden by a higher one.

| Level | Source | Authority |
|---|---|---|
| **0** | Framework implementation (`C:\b4j\workspace\0SithasoDaisy5\SDUI5*.bas`, `SDUI5App.bas`, `modSD5.bas`, `UIShared`) | Absolute |
| **1** | Framework registry (`SithasoDaisy5.b4j` `ModuleN=` entries, normalized; path-qualified entries reduce to basename) | Authoritative interface |
| **2** | Verified demos (`0SithasoDaisy5DemoCode\B4J\pg*.bas`, project `SithasoDaisy5DemoCode.b4j`, `pgIndex.bas`) | Working proof of usage |
| **3** | Generated manifest (`skills/sithasodaisy5/references/component-manifest.md` via `generate_manifest.py`) | Authoritative machine-readable inventory |
| **4** | Component specs (`skills/sithasodaisy5/components/*.md`) | Derived, not original |
| **5** | Recipes and doctrine (`references/`: rules-enforcer, negative-knowledge, design-tokens, app-scaffolds, gate-state-machine, etc.) | Guidance for agents |
| **6** | AI reasoning | Interpretation only |

**Rule:** Level 6 must never override Levels 0–3. On conflict the agent
is wrong until re-inspection of Level 0–1 proves otherwise. Level 3–4 API
facts are refreshed only by `sd5-book-to-skill` extraction + Mode 4 refresh
(`refresh_registered_components.py`, `generate_manifest.py`,
`generate_core_index.py`) — never by hand-editing generated tables, and never
by agent prose. The refresh preserves authored Core Idea/demo/example sections.
Unregistered source notes live in `components/_unused/` and must not be called
from app code unless the framework registry adopts them.

## Article II — Non-Negotiable Rules

1. The executable implementation outranks AI knowledge, training data,
   and prior conversation, in that order.
2. An unverified API, method, property, or event must never be generated
   or documented as if it were confirmed fact. Every emitted class, property,
   setter, event signature, and method must exist in framework source.
3. An unresolved requirement must be marked `OPEN` — never silently
   become an assumption. Unresolved material decisions keep dependent gates open.
4. Static scans passing is necessary but never sufficient for build, runtime,
   or visual correctness. `check-contract`/`pre-scan`/`verify-conformance`
   PASS never implies B4J/BANano build or browser render.
5. Framework and reference-demo source are immutable to app-building agents.
   No agent may edit them to make generated code pass; fix app-authored code
   or document a real framework gap.
6. Every requirement must trace to an implementation and a verification
   artifact — no orphans, no untraceable code.
7. No release without evidence (static + build + runtime + UX + regression).
   An unavailable gate stays `BLOCKED`/`NOT RUN` — never relabeled pass.
8. Failed gates cannot be bypassed, suppressed, or downgraded by an agent.
9. Changes must preserve unrelated functionality — no silent regressions.
   Shared modules, loaders, themes, shell, and routing changes widen scope.
10. Evidence must be produced by deterministic tooling wherever one can
    produce it instead of the agent's own claims.
11. Output is B4J/BANano code that drives the framework — never raw HTML.
    The framework injects markup from property setters (RULE-ANTI-001).
12. Color Channels (design-tokens.md §1.1): Semantic tokens (`primary`,
    `secondary`, `accent`, `neutral`, `info`, `success`, `warning`, `error`,
    `base-100`, etc.) are recommended for theme-aware UI. Hex colors (`#hex`)
    are fully supported and NOT banned — they are valid across `.Color`,
    `.BackgroundColor`, `.TextColor`, `.BorderColor`, `.Classes` (Tailwind
    arbitrary values like `bg-[#1a2b3c]`), `.Styles`, and component color props
    for brand identity and custom art direction.
13. Lifecycle (RULE-LIFECYCLE-001/002): every `Sub Show` starts with
    `BANano.Await(app.ClearPageView)` and ends with `pgIndex.UpdateTitle(...)`.
14. Demonstrated status (RULE-MOUNT-003): prefer components classified ✅
    Demonstrated in `component-manifest.md`. Documented-only ⚪ components
    require explicit user approval.
15. Forms, validation behavior, keyboard traversal, and IME behavior are out
    of scope unless the user explicitly reopens them. No form/keyboard gate
    may be invented from the Android suite's IME tooling.

## Article III — Artifact Types

Five types. Never conflate them; no artifact may claim a type it is not.

- **Knowledge** — what an agent knows/believes. Never authoritative alone.
- **Specification** — what the contract says to build. Intent, not impl fact.
- **Implementation** — what was generated. A claim until verified.
- **Evidence** — what deterministic tooling demonstrates (gate script logs,
  build logs, BUILD-WATCH reports, screenshots, manifest diffs). Only type
  that closes a gate.
- **Decision** — why a choice was made, for future audit.

## Article IV — The Application Contract

No app, feature, or screen without a contract. **No contract = no gen.**

Canonical artifacts (planner templates must emit exactly these names):

```text
.agent/PLAN.md
.agent/STATE.md
.agent/DECISIONS.md
contract/application.md
contract/navigation.md
contract/data-contract.md
contract/domain-model.md            # optional — only when the app persists/exchanges domain entities
contract/business-rules.md
contract/acceptance-tests.md
contract/contract.index.json         # generated by validate-contracts.py --write-index (G0 machine evidence)
contract/features/<feature>.md
contract/screens/<screen>.md
```

Rules: keep requirements / rules / decisions / assumptions distinct
(`REQUIREMENT|CONSTRAINT|BUSINESS RULE|ASSUMPTION|OPEN`); every critical
requirement maps to ≥1 acceptance check; every screen belongs to exactly one
feature and one primary task; contract changes need impact analysis first;
smallest sufficient app shell (the demo shell is an example, not a mandate);
preserve existing architecture unless the contract authorizes change.
Planning is complete only when `validate-contracts.py` (G0) passes or its
failures return to planning — never skipped.

## Article V — Traceability

Every consequential artifact carries an ID, chained forward:

```text
REQ → FEATURE → RULE/BR → SCREEN → COMPONENT → CODE → TEST
```

E.g. `REQ-001 → FEATURE-002 → RULE-004 → SCREEN-003 →
COMPONENT-SDUI5Card → CODE:pgDashboard.bas → TEST-008`

Enables: impact analysis, orphan detection, coverage reporting,
regression targeting, release auditing. Broken/missing chain =
unverified, however produced.

## Article VI — Component Provenance

Every component spec records at minimum: designer properties table, events
with `${mEventName}_<event>` wiring, key setters, emitted daisyUI classes,
init signature, skeleton-contract status, demo evidence, manifest status
(Demonstrated vs Documented-only). Two generated artifacts carry the
machine-readable truth, refreshed only by `sd5-book-to-skill` tooling:

- `references/component-manifest.md` (via `generate_manifest.py`) — authority
  for registry inventory and demo-backed status.
- `references/component-provenance.json` (via `generate_provenance.py`) —
  authority for source sha256 checksums and member (props/events/setters/
  getters/methods) lists plus per-component demo pages.

A checksum mismatch on re-extraction means framework source moved under the
docs: treat affected specs as `stale` until refreshed. A removed/unregistered
member (see `components/_unused/`) blocks G2 for affected screens until the
registry adopts it or a visible human `DECISION` accepts the risk.

## Article VII — Lifecycle State Machine

Strict order. No skips; no self-reported later state without its gate.

```text
DISCOVERED → PLANNED → CONTRACTED → BOOTSTRAPPED → IMPLEMENTED
  → STATIC-VERIFIED → BUILT → RUNTIME-VERIFIED → UX-VERIFIED
  → REGRESSION-VERIFIED → RELEASE-CANDIDATE → RELEASED
```

State is tracked in the generated app's `.agent/STATE.md`; evidence is
appended, prior results never overwritten.

## Article VIII — Quality Gates

`RELEASE = G0 AND G1 AND G2 AND G3 AND G4 AND G5 AND G6 AND G7 AND G8`

| Gate | Name | Closes when |
|---|---|---|
| **G0** | Contracts | Requirements trace to acceptance checks; no blocking OPENs (`validate-contracts.py`) |
| **G1** | Bootstrap | Embedded `.b4j` entry + `pgIndex` + page modules wired; module/file counts agree |
| **G2** | Feature slices | Source-verified component APIs, page wiring, requested behaviors per contract |
| **G3** | Static integrity | `pre-scan` + module coverage + `verify-conformance` + Skill Coverage Contract PASS |
| **G4** | B4J/BANano build | Actual compile + transpile output captured (missing toolchain = `BLOCKED`) |
| **G5** | Browser runtime | App loads; content/title/theme/resources verified via build-watch (no browser = open) |
| **G6** | UX/accessibility | Rendered screenshots reviewed (ux-review.md); hierarchy, fit, contrast, labels judged by a human |
| **G7** | Regression | Impact-scoped acceptance + smoke checks; `.agent/REGRESSION.md` separates new/fixed/pre-existing failures |
| **G8** | Delivery evidence | Hardening PASS on published output + app path, run instructions, screenshots, gate logs, limitations, per-gate pass/open/blocked status |

Scope/skill/evidence/remediation wiring: `skills/sd5-web-orchestrator/references/gate-state-machine.md`
is normative for entry criteria, outputs, status semantics, retry limits,
GATE-INSTANCE evidence rows, per-(gate,scope) counters with 4th-failure halt,
runbook mapping, and STATE.md write-back.
**Failed gate blocks. Remediation capped at 3 cycles per (gate, scope); each
retry must respond to recorded evidence. Never loop on unchanged failures.**

## Article IX — Verification Discipline

Deterministic, not generative. The 7 truth-and-accuracy rules (uncertainty,
sources, statistics, recent events, people/quotes, code/technical, logic gaps)
apply to every response; gaps become `OPEN` items or escalations, never silent
assumptions. Screenshots support review but prove nothing alone: keyboard
reachability, focus, runtime errors, resource loads, and interaction must come
from build-watch/DOM evidence or human browser review. Fidelity claims cite
comparison artifacts, not vibes. Visual forensics follows function → structure
→ style (DI-12); literal pixel mapping is a stop-and-redo offense (NEG-036).
Unsupported aesthetics are approximated under the Style Tiers policy with the
deviation declared — never by inventing a property.

## Article X — Escalation

Max 3 remediation loops per (gate, scope), then mandatory human escalation
with: failing gate, scope, all prior evidence, the specific unresolved
question. No bar-lowering, no marking failure as pass, no reinterpreting a
contract to erase failure. Independent work may proceed while a blocked gate
waits on environment or human input.

## Article XI — Amendment

This constitution is itself a contract artifact. Changes need stated rationale
+ `DECISIONS.md`-style entry (record in the change commit), and never
retroactively reinterpret gates already closed under a prior version.
Adoption log: v1.0 (2026-10-11) — adapted from Android constitution v1.0;
Articles II/IV/V/VI/VIII rewritten for B4J/BANano, registry manifest,
color channels, lifecycle, and deferred form/IME scope.
