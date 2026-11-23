---
name: sd5-application-planner
description: Turn a plain-language SithasoDaisy5 app or feature request into a source-grounded plan, page contracts, navigation map, and acceptance checks before implementation. Use for greenfield apps and substantial feature work; it does not invent SDUI5 APIs or backend behavior.
metadata:
  category: application-engineering
  triggers: build an app, create a web app, plan a SithasoDaisy5 app, dashboard prompt, app requirements, screen contracts
---

# SithasoDaisy5 Application Planner

Turn the request into an implementable, traceable contract. It owns requirements, assumptions, scope, navigation, and acceptance criteria. It does not implement the app.

Hand approved artifacts to `sd5-web-orchestrator`. For screenshot-led requests, use `sd5-visual-analysis`; treat its findings as evidence, not requirements.

## Work from the request

1. Preserve the outcome, framework, target devices, visual direction, and exclusions.
2. Classify consequential details as `REQUIREMENT`, `CONSTRAINT`, `BUSINESS RULE`, `ASSUMPTION`, or `OPEN`. Label inferred sample copy/data as illustrative. Never invent endpoints, credentials, database fields, or framework APIs.
3. Identify actors, journeys, features, pages, and the smallest useful shell. Each screen has one owning feature and one primary task. Do not add routes or chrome without a need.
4. Record data source and behavior boundaries. A static UI uses explicit sample data; do not imply live external data.
5. Map each critical requirement to at least one observable acceptance check, covering static gates and runtime behavior where possible.
6. Select components only after checking the manifest, component file, source, and closest demo.
   Include the parent container for every child leaf (RULE-LAYOUT-005).
   Declare every prompt-specific non-default value (RULE-DEFAULTS-001).
   Strip `Raw*` and `ReadMe` from code contracts; mark documented-only behavior.
7. Maintain `GLOSSARY.md` and record material decisions in `.agent/DECISIONS.md`.
8. Record the visual contract in `contract/screens/<page-id>.md`:
   - **Thesis**: industry archetype and one-sentence direction.
   - **Dials (1-10)**: density, variance, motion intensity.
   - **Architecture**: modern archetypes (Bento, split hero, dash pro) over legacy shells.
   - **Type and surfaces**: font pairing, tracking, border weight, radius, elevation.
   - **Accent rarity and states**: one primary action; secondary controls neutral/ghost/outline; empty states for every dynamic list/table.

## Required artifacts

```text
.agent/PLAN.md
.agent/STATE.md
.agent/DECISIONS.md
contract/application.md
contract/navigation.md
contract/data-contract.md
contract/domain-model.md            # optional - only for persisted/exchanged entities
contract/business-rules.md
contract/acceptance-tests.md
contract/features/<feature-id>.md
contract/screens/<page-id>.md
```

Use [contract-schema.md](references/contract-schema.md) and [application-plan.template.md](references/application-plan.template.md). Extend `sd5-web-orchestrator/references/screen-contract.template.md` for visual fields; do not maintain competing rule copies.

## Gate and handoff

Planning is complete when requirements and exclusions are preserved, each screen has one feature, navigation matches the journey, component choices have evidence, critical requirements map to checks, and no implementation-blocking `OPEN` remains.

Run `scripts/validate-contracts.py` before bootstrap. A failing G0 returns to planning; it is never skipped. For low-risk visual ambiguity, state a reversible assumption and proceed. Escalate only a material decision that cannot be inferred.

## Scope boundaries

- Do not modify framework or demo-library source.
- Form validation, keyboard traversal, and IME behavior are out of scope unless reopened.
- Do not claim a build, runtime, or visual pass from contracts alone.

## Non-negotiables

- RULE-LAYOUT-005: every child leaf has its designated parent in the inventory.
- RULE-DEFAULTS-001: prompt-specific values are declared, not left to defaults.
- No invented APIs or backend behavior.

Full definitions: [rules-enforcer.md](../sithasodaisy5/references/rules-enforcer.md).

## References

- [Application plan template](references/application-plan.template.md)
- [Contract schema and traceability](references/contract-schema.md)
- [ADR template](references/adr-template.md) — how to record decisions and gate exceptions in `.agent/DECISIONS.md`.
- [Recipe crosswalk](../sithasodaisy5/chapters/ch07-recipes.md) — common page patterns and SDUI5 composition.
- [Planning evaluations](evals/planning-cases.md)
- `../sd5-web-orchestrator/SKILL.md` for end-to-end execution
