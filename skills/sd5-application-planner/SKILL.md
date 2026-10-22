---
name: sd5-application-planner
description: Turn a plain-language SithasoDaisy5 app or feature request into a source-grounded plan, page contracts, navigation map, and acceptance checks before implementation. Use for greenfield apps and substantial feature work; it does not invent SDUI5 APIs or backend behavior.
metadata:
  category: application-engineering
  triggers: build an app, create a web app, plan a SithasoDaisy5 app, dashboard prompt, app requirements, screen contracts
---

# SithasoDaisy5 Application Planner

Translate the user's request into an implementable, traceable application contract. This skill owns requirements, assumptions, feature and page scope, navigation, and acceptance criteria. It does not implement the app.

For complete delivery, hand the approved artifacts to `sd5-web-orchestrator`. For screenshot-led requests, use `sd5-visual-analysis` for visual evidence and incorporate its findings without treating inferred interactions as requirements.

## Work from the request

1. Preserve the user's requested outcome, framework, target devices, visual direction, and explicit exclusions.
2. Classify consequential details as `REQUIREMENT`, `CONSTRAINT`, `BUSINESS RULE`, `ASSUMPTION`, or `OPEN`. Infer routine copy/data needed for a static demo, but label invented sample data as illustrative. Never invent service endpoints, credentials, database fields, or framework APIs.
3. Identify actors, user journeys, features, pages, and the smallest useful app shell. Each screen has one owning feature and one primary task. Do not add routes or shell chrome to a single-screen brief without a clear need.
4. Record data source and behavior boundaries. If the request only describes a static UI, use explicit sample data and say so; do not imply live financial or external data.
5. Map each critical requirement to at least one acceptance check. Checks should be observable and describe both source/static gates and runtime behavior where possible.
6. Choose component candidates only after checking `skills/sithasodaisy5/references/component-manifest.md`, the matching `components/<Name>.md`, source, and the closest real demo. Mark documented-only or unverified behavior accurately.
7. Maintain a shared glossary/ADR practice: update `GLOSSARY.md` and record decisions in `.agent/DECISIONS.md` when terminology or architecture changes.

## Required planning artifacts

Create or update these in the target app project before implementation:

```text
.agent/PLAN.md
.agent/STATE.md
.agent/DECISIONS.md
contract/application.md
contract/navigation.md
contract/data-contract.md
contract/domain-model.md            # optional — only when the app persists/exchanges domain entities (see references/domain-model.template.md)
contract/business-rules.md
contract/acceptance-tests.md
contract/features/<feature-id>.md
contract/screens/<page-id>.md
```

Use [contract-schema.md](references/contract-schema.md) and [application-plan.template.md](references/application-plan.template.md). Per-screen visual/task fields can extend `sd5-web-orchestrator/references/screen-contract.template.md`; don't maintain competing copies of shared rules.

## Gate and handoff

Planning is complete when requirements and exclusions are preserved, each screen is parented to one feature, navigation matches the requested journey, component choices have evidence, critical requirements map to acceptance checks, and no implementation-blocking `OPEN` remains. Run `scripts/validate-contracts.py` from this skill before bootstrap. A failing G0 returns to planning; it does not skip or suppress planning.

For low-risk visual ambiguity, state a reversible assumption and proceed. Escalate only a material decision that cannot be inferred and would change the product, data, security, or irreversible behavior. Do not ask questions already answered by the prompt or project context.

## Scope boundaries

- Do not modify framework or demo-library source.
- Form validation, keyboard traversal, and IME behavior are outside the current skills project scope unless the user reopens it.
- Do not claim an app builds, runs, or passes visual review from contracts or source inspection alone.

## References

- [Application plan template](references/application-plan.template.md)
- [Contract schema and traceability](references/contract-schema.md)
- [Planning evaluations](evals/planning-cases.md)
- `../sd5-web-orchestrator/SKILL.md` for end-to-end execution.
