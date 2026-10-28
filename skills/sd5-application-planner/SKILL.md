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
6. Choose component candidates only after checking `skills/sithasodaisy5/references/component-manifest.md`, the matching `components/<Name>.md`, source, and the closest real demo. Mark documented-only or unverified behavior accurately. Enforce B4X code naming: strip `Raw` prefixes for code properties (`.Content`, `.Steps`, `.Options`, `.Classes`, etc.) and exclude `ReadMe` from all code contracts. **Companion Hierarchy Planning (RULE-LAYOUT-005):** Maintain a strict distinction between structural Parent Containers (`SDUI5Row`, `SDUI5Stat`, `SDUI5Steps`, `SDUI5Timeline`, `SDUI5Tabs`, `SDUI5Menu`, `SDUI5List`, `SDUI5Carousel`, `SDUI5Slider`, `SDUI5Swiper`, `SDUI5Footer`) and Child Leaf Components (`SDUI5Column`, `SDUI5StatItem`, `SDUI5StepsItem`, `SDUI5TimelineItem`, `SDUI5TabsItem`, `SDUI5MenuItem`, `SDUI5ListItem`, `SDUI5CarouselItem`, `SDUI5SliderItem`, `SDUI5SwiperSlide`, `SDUI5FooterTitle`). Whenever child leaf components are planned, their mandatory parent container MUST be included in the screen contract component inventory and component hierarchy tree. Child leaf components can never be planned as orphans. **Default Property Setter Alignment (RULE-DEFAULTS-001):** In screen contracts and component inventories, explicitly specify any non-default property values required to fulfill the user prompt. Cross-reference candidate component default values against `skills/sithasodaisy5/references/component-default-setters.md`. Do not rely on framework defaults when the user prompt specifies visual directions, styling (e.g. borderless cards, primary buttons, horizontal stats, full-width inputs), or container sizing overrides (e.g. `.Width = "full"` for cards in columns).
7. Maintain a shared glossary/ADR practice: update `GLOSSARY.md` and record decisions in `.agent/DECISIONS.md` when terminology or architecture changes.
8. **Mandatory Visual & Craft Contract**: In `contract/screens/<page-id>.md`, establish the Creative Brief per `skills/sithasodaisy5/references/design-quality-playbook.md` and `skills/sithasodaisy5/references/design-craft-guide.md`:
   - Visual Thesis & Industry Archetype: Select primary profile (Fintech, B2B SaaS, Command Center, E-Commerce, Healthcare, or Creative Showcase).
   - The 3 Design Dials (1-10): Declare explicit values for Visual Density (1-10), Design Variance (1-10), and Motion/Interaction Intensity (1-10).
   - Page Architecture: Prioritize modern archetypes (`ARCH-11` Bento, `ARCH-12` Split Hero, `ARCH-13` Dash Pro, `ARCH-14` Settings Split, `ARCH-15` Product Studio) over legacy models.
   - Typography Pairing: Declare Google font pairing (e.g. `Plus Jakarta Sans` / `Inter`) and tracking hierarchy (`tracking-tight` on headings, `tracking-widest uppercase` on kickers).
   - Surface & Elevation Strategy: Declare hairline borders (`border-base-200/80` or `border-white/10`), glassmorphism (`backdrop-blur-md bg-base-100/80`), `rounded-2xl`/`rounded-3xl` radius, and ambient canvas.
   - Accent Rarity: Declare the single primary action; secondary controls must be `neutral`, `ghost`, or `outline`.
   - Empty State Strategy: Declare illustrated empty states (icon + copy + CTA) for every dynamic table/list container.

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
