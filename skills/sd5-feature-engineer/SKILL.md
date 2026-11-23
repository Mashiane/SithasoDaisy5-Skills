---
name: sd5-feature-engineer
description: Implement a planned SithasoDaisy5 app feature as a traceable B4J/BANano vertical slice. Use after contracts exist; verify every component API and lifecycle call against source-backed references and demos.
metadata:
  category: application-engineering
  triggers: implement a feature, build this dashboard, add a page, compose a screen, implement a SithasoDaisy5 feature
---

# SithasoDaisy5 Feature Engineer

Implement the smallest complete feature slice that satisfies its contract. The planner owns requirements and contracts; this skill owns code changes in app-authored files. The orchestrator sequences this skill for end-to-end delivery.

## Workflow

1. Read the application, feature, screen, data, navigation, and acceptance contracts. If a critical behavior is missing or contradictory, update the plan/decision record with the gap; do not invent domain or backend behavior.
2. For an existing app, inspect its `.b4j`, `pgIndex`, affected pages, shared helpers, nearest demo, static-gate findings, and regression baseline. For a greenfield app, follow `sd5-project-bootstrap` first.
3. Work in vertical slices: requirement -> feature -> state/data source -> page composition -> route -> acceptance evidence. A presentation-only request can remain local and static; label sample content explicitly instead of inventing a backend.
4. Verify every SDUI5 component against the component reference, source, and closest demo:
   registered name, properties, methods, dependency loader, and mount slot.
   Mark each inventory row provenance-checked (manifest status + provenance member lists + date).
   A stale spec or missing member blocks G2 for that screen.
   For large docs, load only the needed section with `../sithasodaisy5/scripts/component_sections.py <Name> --get "<section>"`.
5. Compose and style the slice:
   - **5a Mount order**: await the parent `AddComponent` before mounting children; use the component's documented mount sequence (RULE-LAYOUT-005).
   - **5b Styling**: assign designer properties first; reserve `.Classes` for responsive, animation and flex/grid tokens. Use suffix-only values for `Width`/`Height`/`Shadow`/`Rounded` (RULE-PROP-001/002).
   - **5c Defaults**: override every default that conflicts with the prompt or container (RULE-DEFAULTS-001).
   - **5d Code syntax**: no `Raw*` properties or `ReadMe`; suffix component globals with `'ignore`; call `BANano.Await(Show)` for self-invocation.
   - **5e Encoding**: save UTF-8 without BOM and keep string literals ASCII (RULE-ENCODING-001/002/003).
   - **5f Assets**: every local icon/image uses `./assets/<name>.svg` (RULE-ASSET-001).
6. Implement the contracted states that apply: loading, populated, empty, error, offline, and partial data. State clearly when a static-only sample makes remote states not applicable.
7. Keep business/data behavior out of large rendering routines when logic exists. Wire only behavior requested by the contract; events follow event -> operation -> state change -> UI update, with failures visible.
8. Update traceability `REQ -> FEATURE -> RULE/BR -> SCREEN -> COMPONENT -> CODE -> TEST`. Run local acceptance and applicable static checks, then hand gate evidence to `sd5-web-orchestrator`.
9. A slice is complete only when its traceability rows exist and its slice-scoped gates re-ran (`pre-scan.ps1` + `verify-conformance.ps1`). Code alone is not completion; delivery still requires the full G0-G8 chain closed by `check-delivery.ps1`.

## Non-negotiables

- RULE-LAYOUT-005: companion children mount into their designated parent, never a generic container.
- RULE-PROP-001/002: properties before `.Classes`; suffix-only size/elevation values.
- RULE-DEFAULTS-001: override conflicting designer defaults explicitly.
- RULE-ENCODING-001/002/003: UTF-8 without BOM, ASCII string literals.
- RULE-ASSET-001: `./assets/<name>.svg` for every local icon/image.
- No raw HTML, invented APIs, or framework source edits.

Full definitions: [rules-enforcer.md](../sithasodaisy5/references/rules-enforcer.md). Apply-this checklist: [implementation-constraints.md](references/implementation-constraints.md).

## Limits

- Modify app-authored files only; treat framework component source as read-only.
- Do not claim compile, browser runtime, visual, accessibility, or financial correctness without corresponding evidence.
- Form validation, keyboard traversal, and IME behavior remain outside current scope unless explicitly reopened.
- Use `sd5-web-regression` when a shared component, route, dependency, or contract change can affect other screens.

## References

- [Apply-this constraint checklist](references/implementation-constraints.md)
- [Canonical rules](../sithasodaisy5/references/rules-enforcer.md)
- [Recipe crosswalk](../sithasodaisy5/chapters/ch07-recipes.md) — common screen compositions and accessibility notes.
- [Operating principles](../sithasodaisy5/references/operating-principles.md)
- [Component manifest](../sithasodaisy5/references/component-manifest.md) and `../sithasodaisy5/components/<Name>.md`
- [Bootstrap workflow](../sd5-project-bootstrap/references/bootstrap-workflow.md)
