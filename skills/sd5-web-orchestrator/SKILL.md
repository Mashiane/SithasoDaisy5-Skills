---
name: sd5-web-orchestrator
description: Turn a plain-language request into a complete source-grounded SithasoDaisy5 B4J/BANano app and carry it through planning, implementation, static/build/runtime/visual/regression gates, and an evidence-based delivery decision. Use for greenfield apps, complete features, or release work.
metadata:
  category: application-engineering
  triggers: build a complete app, create app from prompt, end-to-end SithasoDaisy5, ship a screen, release gate
---

# SithasoDaisy5 App Orchestrator

Use this skill as the single entry point when a user describes an app or screen and expects working B4J/BANano code. Translate the request through the app planner, bootstrap, component skill, feature engineer, verifier, and regression skill; do not duplicate their component or API knowledge.

## Delivery state machine

```text
request → plan/contracts → G0 contract → G1 bootstrap → G2 feature slices
→ G3 static integrity → G4 build → G5 browser runtime → G6 UX review
→ G7 regression → G8 delivery evidence
```

Use [the gate state machine](references/gate-state-machine.md) for entry criteria, outputs, status semantics, and retry limits. Track state in the generated app's `.agent/STATE.md` and append evidence; do not report a later gate as pass when an earlier prerequisite failed.

## Procedure

1. **Plan** — Run `sd5-application-planner` on the original prompt. Preserve explicit visual and platform requirements; record sample data and assumptions. A text-only prompt does not need screenshot reconnaissance. Do not ask for details the prompt already gives.
2. **G0 Contract** — validate planner artifacts with `sd5-application-planner/scripts/validate-contracts.py --write-index <AppFolder>`. It writes `contract/contract.index.json` (machine file: requirements, features, screens, opens, PASS/FAIL). Fix contract errors before generating code. Record any unresolved material decision as OPEN and keep dependent gates open; proceed with independent work where safe.
3. **G1 Bootstrap** — for greenfield apps, follow `sd5-project-bootstrap` and source-backed `app-scaffolds.md`. Create the `.b4j` entry, page registry, page modules, and required assets. Verify module/file counts and route-to-module wiring.
4. **G2 Implement** — use `sd5-feature-engineer` for each vertical slice and `sithasodaisy5` for API and composition guidance. Before each component call, check the registered component reference, relevant source, and demo. No screen passes G2 with an unchecked inventory row: every row carries manifest status + provenance member-list confirmation + date. Use only source-backed API values. Keep forms/IME out of scope unless reopened.
5. **G3 Static integrity** — run `sd5-web-verify/scripts/pre-scan.ps1`, `check-contract.ps1`, and `verify-conformance.ps1` with the target app/framework/skill paths. Fix introduced hard failures, preserve existing issues as baseline evidence, and record logs.
6. **G4 Build** — run `sd5-web-verify/scripts/build-banano-app.ps1 -ProjectRoot <AppFolder>` (B4JBuilder compile → jar → JavaFX run → BANano transpile; writes `.agent/build/BUILD-<stamp>.md`). The app's `Publish` path must point at its Laragon folder (`C:\laragon\www\<app>\`, see `laragon-serve.md`) so output lands servable. Capture command and exit status. A missing compiler/library/toolchain leaves G4 `BLOCKED`; static checks are not a build substitute.
7. **G5 Runtime** — serve the built app and run `build-watch.template.ps1` against the local URL. Confirm startup, expected page content/title/theme, browser console, and resources. Record the environment and report; without a running browser/app this gate remains open.
8. **G6 UX and design quality** — capture every contracted screen at desktop and phone widths (plus any user-requested viewport) using `capture-screens.ps1`; repeat the capture with separate `-Out` folders (for example, `ux-review/screens/desktop` at 1280×900 and `ux-review/screens/phone` at 390×844). Review the actual rendered images with `references/ux-review.md`, `../sithasodaisy5/references/design-quality-playbook.md`, and the Anti-Slop Checklist in `../sithasodaisy5/references/design-craft-guide.md`. Verify typography hierarchy, surface elevation, accent rarity (1 primary CTA per viewport), mobile fit, zero default placeholder pollution (`"Card Title"`/`"Card Content"`), and zero page overflow. Apply the scored quality gate (score ≥ 3 per dimension, average ≥ 3.5); source alone cannot pass rendered visual checks. Fix app-authored issues and rerun affected downstream gates.
9. **G7 Regression** — run `sd5-web-regression` for the changed app and impacted journeys. On greenfield, establish the initial baseline and smoke path. Distinguish existing tool/demo failures from newly introduced defects.
10. **G8 Delivery** — run `sd5-web-verify/scripts/verify-production-hardening.ps1` against the built output (release-only security gate: secrets, absolute paths, required files). Then create `.agent/REGRESSION.md` and a delivery summary with app path, run/build instructions, screenshots, source/gate evidence, known limitations, and pass/open/blocked status for G0–G8. Only call it a working app when the B4J build and browser runtime have evidence.

## Failure and remediation

- Follow the per-gate/per-scope remediation cap in `references/gate-state-machine.md`; each retry must respond to recorded evidence. Do not loop on unchanged failures.
- Keep implementation and evidence work moving on independent portions when an environment gate is unavailable. Never relabel a blocked, skipped, warning, or unrun gate as pass.
- Do not modify framework or reference-demo source to make generated code pass. Correct app-authored code or document a real framework gap.
- If the prompt requires unsupported behavior, implement the closest source-backed approximation only when it preserves the user's intent; record the deviation and evidence. Do not invent a component property or library capability.

## Anti-Rationalization Table

| Excuse | Rebuttal |
|---|---|
| "Contracts are optional for a small screen" | No. No contract = no generation (G0). |
| "Pre-scan WARN is fine, skip it" | No. Fix bans first; WARN before verify. |
| "Build passed, skip build-watch" | No. Screenshots cannot prove runtime/load/console. |
| "Screenshot proves 48px" | No. Only build-watch/DOM evidence. |
| "I'll apply fix tickets myself" | No. Draft only; user unlocks `.bas`. |
| "One good screen proves the flow" | No. Capture every contracted screen. |

## References

- `../sd5-application-planner/SKILL.md` — prompt → app requirements/contracts.
- `../sd5-project-bootstrap/SKILL.md` — greenfield B4J/BANano shell and module wiring.
- `../sd5-feature-engineer/SKILL.md` — source-backed vertical implementation.
- `../sithasodaisy5/SKILL.md` — SDUI5 APIs, design rules, demos.
- `../sd5-web-verify/SKILL.md` — static and browser evidence tools.
- `../sd5-visual-analysis/SKILL.md` — supplied visual references.
- `../sd5-web-regression/SKILL.md` — change impact and regression record.
- [Gate state machine](references/gate-state-machine.md)
