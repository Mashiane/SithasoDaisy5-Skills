---
name: sd5-web-regression
description: Assess and verify change impact in an existing SithasoDaisy5 B4J/BANano app. Use for bug fixes, refactors, shared component or route changes, and release readiness; report pre-existing failures separately.
metadata:
  category: quality-engineering
  triggers: regression, change existing SithasoDaisy5 app, refactor, bug fix, impact analysis, release regression
---

# SithasoDaisy5 Regression Engineer

Protect existing app behavior with a recorded baseline, explicit impact scope, targeted checks, and a release decision. This skill does not replace static conformance, build/runtime, or visual gates.

## Workflow

1. Record app version/revision when available, current static/build/runtime/visual status, known failures, critical user journeys, and existing acceptance checks. Do not characterize an unbuilt baseline as passing.
2. Trace changed artifacts and dependencies: B4J project modules, page modules, `pgIndex` routes, shared page chrome, components, data/API helpers, app-owned assets, and generated browser output. Classify each as `DIRECT`, `DEPENDENT`, `TRANSITIVE`, or `UNRELATED`.
3. Create `.agent/impact-analysis.md` from [the template](references/impact-analysis.template.md). Map each impacted journey and contract requirement to the narrowest meaningful check. Widen scope when a shared module, component loader, theme, shell, or routing convention changes.
4. Reproduce a reported defect when practical, then make the scoped change. Never "fix" the baseline record by overwriting prior failures.
5. Run checks for the changed feature and impacted pages, then project wiring, `sd5-web-verify` pre-scan/conformance, build, browser runtime, and visual capture according to what the environment supports. State `NOT RUN` or `BLOCKED` with the exact reason when unavailable.
6. Write `.agent/REGRESSION.md` using the template. Separate newly introduced failures, fixed failures, and pre-existing failures. A critical journey, G3 static gate, build, or runtime failure blocks release. Missing environment evidence means the corresponding gate remains open, not pass.

## Risk-based scope

Always run changed-feature checks, affected-page checks, project wiring checks, and conformance. Include adjacent routes for navigation changes; all pages using a changed shared component, loader, or theme; data-state journeys for data changes; and wide-app checks when impact cannot be bounded from source. For financial, authentication, permissions, persistence, or destructive behaviors, require runtime evidence beyond compilation.

For a greenfield app with no prior release baseline, record `GREENFIELD` and validate the complete app smoke path. Use this skill if app structure or shared modules are changed after the first implementation.

