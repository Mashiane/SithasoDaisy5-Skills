---
name: design-intelligence
description: Framework-agnostic design-decision doctrine for AI agents building UI — the "decide WHAT the UI should be" layer that sits above component syntax. Canonical source shared by SithasoDaisy5-Skills (web) and B4XDaisyUIKit-Skills (native). Cite DI-* sections in your reasoning trace.
---

# Design Intelligence — the decision layer

Component skills answer "how do I build X". This doctrine answers "should X exist, and what should it be". Modern AI design tools (Figma design-system thinking, Claude Design's reasoning, Stitch/Sleek pipelines) all converge on the same lesson: **generation quality is decided before the first component is emitted.**

Every section below is framework-agnostic. Platform mapping (daisyUI themes, B4X widgets) happens in the consuming suite's own references.

---

## DI-1 · The decision pipeline

```text
USER / BUSINESS PROBLEM
    ↓
USER JOURNEY        — who does what, in what order, why
    ↓
TASK / INTENT       — the actual job on this screen
    ↓
INFORMATION ARCHITECTURE — what content exists, how it groups
    ↓
SCREEN CONTRACT     — formalized (screen-contract.template.md)
    ↓
VISUAL DESIGN SYSTEM — theme, tokens, hierarchy
    ↓
LAYOUT → COMPONENTS → IMPLEMENTATION
    ↓
VISUAL + UX VALIDATION
```

Rule: an agent that cannot state the **primary task** of a screen in one sentence is not ready to generate that screen. Fill the screen contract first.

## DI-2 · Visual hierarchy

Hierarchy is expressed through exactly four instruments — size, weight, color, and space. Use them deliberately:

| Rank | Instrument | Typical expression |
|---|---|---|
| 1 — Primary task | size + color | Hero numeric / `primary` CTA, one per screen |
| 2 — Key data | size | Large values, medium labels |
| 3 — Supporting data | weight | Semibold labels, regular values |
| 4 — Metadata | space + opacity | Small, muted (`base-content` variants), pushed to edges |

Anti-rules: two elements cannot share rank 1. If everything is emphasized, nothing is. Spacing ranks content as strongly as styling does — the item with the most air around it reads as most important.

## DI-3 · Information & task hierarchy

- **Primary task**: the reason the screen exists. Visually dominant, reachable in one interaction.
- **Secondary tasks**: support the primary. Grouped, visually subordinated.
- **Tertiary/rare tasks**: behind overflow menus, drawer, or settings.
- Information hierarchy: group related content by proximity (Gestalt), separate groups by whitespace before separators before containers. Prefer whitespace > divider > card, in that order — a card is a claim that "this is a distinct object"; don't spend it on incidental grouping.

## DI-4 · Progressive disclosure

Show the 20% that serves the primary task; make the rest discoverable, not visible:

- Detail behind collapse/accordion, drawer, or detail page — not stacked on the same screen.
- Advanced options behind an explicit affordance ("Advanced", gear).
- Progressive forms (wizard) when a task has > 7 inputs (Miller) or branching steps.
- Defaults over configuration: prefill the most common answer; hide the setting that 90% of users never touch.

## DI-5 · Cognitive load

- **Recognition over recall**: show options; don't make users remember paths.
- ≤ 5 simultaneous choices at any decision point (Hick).
- ≤ 7 controls per form group (Miller), grouped with fieldsets.
- One decision per screen region: never make the user parse two competing choices in the same visual zone.
- Consistency is load reduction: same semantic → same component → same position (Jakob). Deviate only with reason.

## DI-6 · Content density

| Density | When | Character |
|---|---|---|
| Hero | marketing, onboarding, single-focus screens | one message, generous air |
| Comfortable | consumer apps, dashboards | cards, breathing room |
| High | expert tools, data admin, tables | compact rows, dense grids, less chrome |

Pick density per screen (screen contract field), not per app. Mixed-density apps are allowed — a Hero landing page can open into a High-density admin. Density failure mode #1 is decoration: chrome and containers that spend pixels without carrying information.

## DI-7 · Visual rhythm

- Use the framework's spacing scale consistently; pick a base step (e.g. 4/8/16/24/32) and avoid arbitrary values except at trust/brand boundaries.
- Align to one axis system; ragged alignment reads as error, not style.
- Repetition creates prediction: identical card types should repeat identical internal layouts. Rhythm breaks signal meaning — so only break rhythm on purpose.

## DI-8 · Scanning patterns

- Text-heavy / left-aligned reading surfaces: **F-pattern** — front-load meaning; the first words of headings and rows carry the scan.
- Structured grids, dashboards, cards: **layer-cake / pattern-based scanning** — consistent row shapes let users skip whole regions.
- Put the primary action where the scan ends (bottom of a card, end of a form, bottom-right LTR / bottom-left RTL).

## DI-9 · Mobile ergonomics (touch)

- **Thumb zone**: primary and frequent controls live in the bottom third; destructive and rare actions live in the hard-to-reach corners.
- Reach cost = friction: top-bar actions are for navigation, not for the primary task.
- One-hand assumption: bottom nav (dock), bottom sheets, FABs exist for this reason.
- Gesture affordances must have visible equivalents — never gesture-only.

## DI-10 · Platform & context conventions

- **Design intent ≠ platform convention ≠ implementation.** A mobile-native pattern on a desktop web app (or vice versa) must be a decision, not a default.
- Web: hover states exist, cursor precision is high, keyboard is first-class, viewport is variable — density can go higher, gestures are not assumed.
- Respect user-set density/zoom; test the screen at 100% and 200% zoom.
- Browser context is stateful (back button, refresh, tab title) — navigation model must survive both.

## DI-11 · The 2-second test (screen-level acceptance)

Before generation, answer in the screen contract:

1. What is the primary task? (one sentence)
2. What element dominates the visual hierarchy? (one element)
3. What is the obvious next action? (one action)
4. What must the user recognize, not recall?

After capture (screenshot review), the critic re-asks the same four. If the rendered screen fails 2+ of them, the revision loop runs.

## DI-12 · Anti-cargo-cult clause

A named visual pattern is a hypothesis, not a spec. When translating a mockup, screenshot, or prompt:

- "There is a card" → "there is a grouped visual region representing related information" — then decide whether card, panel, fieldset, list item, or plain layout is semantically right.
- "There is a button" → "there is an action" — then decide whether button, link, menu item, or icon button is right.
- Never map screenshot pixels 1:1 to components. Extract **function first, structure second, style last**.

This clause is normative. Component cargo-culting is the #1 failure mode of design-to-code translation.

---

## Relationship to other doctrine

| File | Scope |
|---|---|
| `ux-master-doctrine.md` | Quantitative laws (Fitts/Hick/Miller/WCAG) + Definition of Done |
| `creative-director.md` | Theme/density/palette decisions for a project |
| `screen-contract.template.md` | The artifact where DI-2/3/11 get written down |
| `rules-enforcer.md` / gates | Mechanical enforcement (this file is judgment, not gates) |

Cite `DI-*` IDs in the reasoning trace when a design decision is non-obvious.
