# intent-to-skill — deterministic task → skill resolution

Deterministic first: keyword match against `skills-registry.json` keywords/triggers → filter by platform + status (exclude deprecated unless explicitly requested) → resolve `depends` transitively → order by authority (domain first) → emit selected + rejected-with-reason. No embeddings. This file is the human-readable form of that rule; the registry is the machine-readable form.

## Resolution table

| Task keywords | Selected IDs | Why | Rejected + reason |
|---|---|---|---|
| new web app, greenfield, scaffold, project file, pgIndex | sd5-project-bootstrap, sithasodaisy5, sd5-web-verify | shell first, then composition, then gate | sd5-web-regression (no existing behavior to protect) |
| login screen, auth flow, form validation, cloud auth | sd5-application-planner, sithasodaisy5, sd5-web-verify | auth touches requirements + contract before composition | sd5-project-bootstrap (not greenfield) |
| navigation shell, navbar, drawer, dock, routing, multi-page | sd5-application-planner, sithasodaisy5, sd5-project-bootstrap, sd5-web-verify | shell structure + composition + gate | sd5-web-regression (greenfield, nothing to regress) |
| plan web app, feature planning, requirements, architecture | sd5-application-planner (+ sd5-web-orchestrator for full build) | contract set before code; no contract = no gen | sd5-feature-engineer (no contract yet), bootstrap (plan before shell) |
| implement feature, vertical slice, connect screen | sd5-feature-engineer, sithasodaisy5, sd5-web-verify | slice needs domain + gate | bootstrap (not greenfield), orchestrator (single feature, not release) |
| compose UI, screen, form, dashboard, card, modal, DaisyUI web | sithasodaisy5, sd5-web-verify | domain generation + conformance gate | generic styling skill (platform mismatch; authority 6 loses to 2) |
| screenshot to web app, recreate screenshot, mockup to B4J, wireframe to code | sd5-visual-analysis + sd5-application-planner + sithasodaisy5 + sd5-web-verify; add sd5-project-bootstrap for a new app and sd5-web-regression for an existing app | visual forensics → canonical screen contract → verified BANano/SDUI5 mapping → appropriate app gates | image-to-code workflow (skips contracts, API truth, or existing-app impact) |
| adapt another app's screenshot, use screenshot as inspiration | sd5-visual-analysis + sd5-application-planner + sithasodaisy5 + sd5-web-verify when implementing | extract structure and hierarchy while preserving the destination app's approved design system | faithful brand copy when the user asked for adaptation |
| compare current web app screenshot with target | sd5-visual-analysis + sd5-web-regression + sithasodaisy5 + sd5-web-verify when changing the app; sd5-web-verify for review only | classify current-state evidence, protect existing behavior, and review the rendered result against the target | treating the current screenshot as the target without user intent |
| verify, conformance, invented API, module wiring, before build | sd5-web-verify | static gate before compile | — (gate never skipped; failed gate blocks) |
| release, ship web app, end-to-end, full app, screen contract | sd5-web-orchestrator + all depends | thin sequencer owns G0-G8 for multi-scope release | single-component shortcut (release requires full gate chain) |
| change existing web app, fix, regression, impact | sd5-web-regression, sd5-web-verify | baseline → impact → targeted + smoke | bootstrap (not greenfield), planner (unless contract changes) |

## Rules

1. `sd5-web-verify` is selected for every code-producing task. Verification is not optional.
2. `sd5-web-orchestrator` only for multi-scope release work; single screens/features resolve without it.
3. Domain (`sithasodaisy5`, authority 2) wins over generic styling skills on any conflict; cite the winning source.
4. Unknown component name → answer "not in manifest" + cite manifest lookup. Never generate.
5. `status: deprecated` skills are excluded unless the task explicitly names them; `replaced_by` is suggested instead.

## Diagnostic format (emit with every selection)

```text
Task: <one line>
Selected: <id> — Reason: <rule/dependency>
Rejected: <id> — Reason: <platform mismatch | not greenfield | no contract yet | authority loses | deprecated>
Evidence: <registry entries + manifest hits cited>
```
