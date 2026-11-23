---
name: sd5-web-orchestrator
description: Turn a plain-language request into a complete source-grounded SithasoDaisy5 B4J/BANano app and carry it through planning, implementation, static/build/runtime/visual/regression gates, and an evidence-based delivery decision. Use for greenfield apps, complete features, or release work.
metadata:
  category: application-engineering
  triggers: build a complete app, create app from prompt, end-to-end SithasoDaisy5, ship a screen, release gate
---

# SithasoDaisy5 App Orchestrator

Use this skill as the single entry point when a user describes an app or screen and expects working B4J/BANano code.
Translate the request through the planner, bootstrap, component, feature, verify, and regression skills; do not duplicate their API knowledge.

## Delivery state machine

```text
request -> plan/contracts -> G0 contract -> G1 bootstrap -> G2 feature slices
-> G3 static integrity -> G4 build -> G5 browser runtime -> G6 UX review
-> G7 regression -> G8 delivery evidence
```

Use [the gate state machine](references/gate-state-machine.md) for entry criteria, outputs, status semantics, and retry limits.
Track state in the app's `.agent/STATE.md` and append evidence; never report a later gate as pass when a prerequisite failed.

### Automated pipeline runner

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File skills/sd5-web-orchestrator/scripts/run-pipeline.ps1 -AppFolder <AppFolder>
```

Use `-SkipBuild` for contracts/static only, or `-BaseUrl <url>` for a custom host. It halts on the first failure (exit 1) and writes `.agent/DELIVERY.json`.

### Non-skippable delivery rule

G8 is satisfiable only by `check-delivery.ps1` exiting 0 against `.agent/DELIVERY.json`:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File skills/sd5-web-verify/scripts/check-delivery.ps1 -AppFolder <AppFolder>
```

The runner reports execution; the gate decides delivery. A prose summary, a scorecard, or model confidence is not evidence.
Evidence is bound to a source digest: after any `.b4j`, `.bas`, `contract/`, `Files/`, or `JsonLayouts/` change, the prior run is `STALE` and must be repeated.

## Procedure

1. **Plan** - run `sd5-application-planner` on the original prompt. Preserve explicit visual and platform requirements; record sample data and assumptions. Do not ask for details the prompt already gives.
2. **G0 Contract** - validate with `validate-contracts.py --app-folder <AppFolder> --write-index`. Fix contract errors before generating code. Keep material unknowns `OPEN` and dependent gates open.
3. **G1 Bootstrap** - for greenfield apps, follow `sd5-project-bootstrap` and `app-scaffolds.md`. Create the `.b4j`, page registry, page modules, and assets; verify module/file counts and route wiring.
4. **G2 Implement** - use `sd5-feature-engineer` per vertical slice and `sithasodaisy5` for API guidance. Every inventory row carries manifest status + provenance member-list confirmation + date. Use only source-backed API values.
5. **G3 Static integrity** - run `pre-scan.ps1`, `check-contract.ps1`, and `verify-conformance.ps1` with the app/framework/skill paths. Fix introduced failures; record existing issues as baseline.
6. **G4 Build**
   - Run `build-banano-app.ps1 -ProjectRoot <AppFolder>` (B4JBuilder -> jar -> JavaFX -> BANano).
   - The app's `Publish` path points at its Laragon folder so output lands servable.
   - Capture the command and exit status.
   - A missing toolchain leaves G4 `BLOCKED`; static checks are not a build substitute.
7. **G5 Runtime**
   - Serve the built app and run `build-watch.template.ps1` against the local URL.
   - Confirm startup, expected title/theme/content, console, and resources.
   - Record the environment and report; without a browser the gate remains open.
8. **G6 UX and design quality**
   - Capture every contracted screen at desktop and phone widths.
   - Review the rendered images with `references/ux-review.md`, the design-quality playbook, and the anti-slop checklist.
   - Check hierarchy, surface elevation, accent rarity (one primary CTA per viewport), mobile fit, placeholder pollution, and overflow.
   - Apply the score gate (>= 3 per dimension, average >= 3.5); source alone cannot pass visual checks.
   - Fix app-authored issues and rerun affected downstream gates.
9. **G7 Regression** - run `sd5-web-regression` for the changed app and impacted journeys. On greenfield, establish the baseline and smoke path; separate pre-existing failures from new ones.
10. **G8 Delivery**
    - Run `verify-production-hardening.ps1` against the built output.
    - Create `.agent/REGRESSION.md` and a delivery summary with app path, run/build instructions, screenshots, evidence, limitations, and G0-G8 status.
    - Call it a working app only when build and browser runtime have evidence.

## Failure and remediation

- Follow the per-gate/per-scope remediation cap in `references/gate-state-machine.md`; each retry responds to recorded evidence.
- Keep independent work moving when an environment gate is unavailable. Never relabel a blocked, skipped, warning, or unrun gate as pass.
- Do not modify framework or demo source to make generated code pass. Correct app-authored code or document a real framework gap.
- For unsupported behavior, implement the closest source-backed approximation, record the deviation, and do not invent a capability.

## Anti-rationalization

| Excuse | Rebuttal |
|---|---|
| "Contracts are optional for a small screen" | No contract = no generation (G0). |
| "Pre-scan WARN is fine, skip it" | Fix bans first; WARN before verify. |
| "Build passed, skip build-watch" | Screenshots cannot prove runtime or console. |
| "One good screen proves the flow" | Capture every contracted screen. |
| "The gates take too long" | Deliver `overall=PARTIAL` and name every gate not run. Partial is honest; PASS without evidence is false. |

## References

- `../sd5-application-planner/SKILL.md` - prompt to contracts
- `../sd5-project-bootstrap/SKILL.md` - shell and module wiring
- `../sd5-feature-engineer/SKILL.md` - source-backed slices
- `../sithasodaisy5/SKILL.md` - SDUI5 APIs and composition
- `../sd5-web-verify/SKILL.md` - static and browser evidence
- `../sd5-visual-analysis/SKILL.md` - supplied visual references
- `../sd5-web-regression/SKILL.md` - change impact and baseline
- [Gate state machine](references/gate-state-machine.md)
