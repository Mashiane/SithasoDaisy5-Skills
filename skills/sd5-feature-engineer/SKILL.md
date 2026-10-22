---
name: sd5-feature-engineer
description: Implement a planned SithasoDaisy5 app feature as a traceable B4J/BANano vertical slice. Use after contracts exist; verify every component API and lifecycle call against source-backed references and demos.
metadata:
  category: application-engineering
  triggers: implement a feature, build this dashboard, add a page, compose a screen, implement a SithasoDaisy5 feature
---

# SithasoDaisy5 Feature Engineer

Implement the smallest complete feature slice that satisfies its contract. The application planner owns requirements and contracts; this skill owns code changes in app-authored files. For end-to-end delivery, the orchestrator selects and sequences this skill.

## Workflow

1. Read the application, feature, screen, data, navigation, and acceptance contracts. If a critical behavior is missing or contradictory, update the plan/decision record with the concrete gap; do not silently invent domain or backend behavior.
2. For an existing app, inspect its `.b4j`, `pgIndex`, affected pages, shared helpers, nearest demo, current static-gate findings, and regression baseline. For a greenfield app, follow `sd5-project-bootstrap` first.
3. Work in vertical slices: requirement → feature → state/data source → page composition → route → acceptance evidence. A presentation-only request can remain local and static; label sample content explicitly instead of introducing a fabricated backend.
4. For every SDUI5 component, verify registered name, properties, methods, dependency loader, and mount slot in the component reference and source. Mark each screen-contract inventory row provenance-checked (manifest status + provenance member lists + date). A stale spec or missing member blocks G2 for that screen. Use the closest demo to validate actual call order. Cite the relevant file and routine in the screen contract or implementation notes.
5. Compose through B4J/BANano and registered components. Await the parent `AddComponent` before mounting children. Preserve the app's `Show` lifecycle and exact project module registration. For light-surface form fields and component sizing, follow `../sithasodaisy5/patterns.md` P4a; use `Width`/`Height` only where that component exposes the property, and keep checkbox/toggle/radio/range/rating/slider styling component-specific. No hand-authored raw HTML or invented framework APIs.
6. Implement the contracted states that apply: loading, populated, empty, error, offline, and partial data. State clearly when a static-only sample does not make remote requests and states are not applicable.
7. Keep business/data behavior out of large rendering routines when logic exists. Wire only behavior requested by the contract; events follow event → operation → state change → UI update, with failures visible.
8. Update traceability: `REQ → FEATURE → RULE/BR → SCREEN → COMPONENT → CODE → TEST`. Run local acceptance and applicable static checks, then hand off gate evidence to `sd5-web-orchestrator`.

## Limits

- Modify app-authored files only; treat framework component source as read-only.
- Do not claim compile, browser runtime, visual, accessibility, or financial correctness without corresponding evidence.
- Form validation, keyboard traversal, and IME behavior remain outside current scope unless explicitly reopened.
- Use `sd5-web-regression` when working in an existing app or when a shared component, route, dependency, or contract change can affect other screens.

## References

- `../sd5-project-bootstrap/references/bootstrap-workflow.md`
- `../sithasodaisy5/references/component-manifest.md` and `../sithasodaisy5/components/<Name>.md`
- [Feature implementation checklist](references/feature-implementation-checklist.md)
