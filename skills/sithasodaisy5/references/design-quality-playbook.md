---
name: design-quality-playbook
description: Practical art direction and rendered-screen quality bar for creating distinctive, usable SithasoDaisy5 apps. Use before implementation for new screens and during screenshot critique.
---

# Design Quality Playbook

Use this with [design-intelligence.md](design-intelligence.md), [creative-director.md](creative-director.md), and the component references. This playbook owns the missing bridge between a sound UX plan and a screen that feels deliberately designed. It does not replace API evidence, accessibility checks, or runtime verification.

## Why the gate exists

API correctness, component coverage, and a successful build do not demonstrate visual quality. A screen can pass those checks and still look like a default component showcase, feel unrelated to its product, waste the viewport, clip on a phone, or show a broken asset. Treat the captured screen as the product; source code is not visual evidence.

“Award-winning” is an aspiration, not a verifiable claim. Aim for work that is distinctive, coherent, polished, and easy to use, then report the rendered evidence and score below.

## 1. Set art direction before choosing components

For each new app, and for every screen whose visual direction is changing, record a short **Creative Brief** in the screen contract's Visual Direction section (or in `.agent/design/<screen-id>.md` when the contract has no such section):

```text
Product and audience:
Primary job on this screen:
Visual thesis: one sentence describing the experience and why it fits this product
Character: three concrete adjectives (for example, calm, editorial, precise)
Reference evidence: user-provided reference, named product/category, or “original direction”
Signature move: one restrained, repeatable visual detail that makes this product recognizable
Hierarchy: page title, key content, primary action, supporting information
Density and layout: Hero / Comfortable / High; grid, content width, alignment, responsive changes
Visual tokens: theme/palette roles, typography roles, spacing rhythm, surface/border/shadow/radius
Image and icon direction: subject, crop, style, source, licensing, and local file path
Interaction tone: feedback, transitions, and motion preference
Explicit exclusions: visual tropes or components that would make this feel wrong
```

The thesis and signature move are required for new screens. “Modern dashboard”, “clean”, “use theme X”, or a DaisyUI component name is not an art direction. Name the actual product context and turn the direction into visible decisions. Inherit a proven direction for a bounded edit; do not invent a new style per screen.

If the user supplied an image, brand guide, or URL, use it as design evidence and preserve its intent. Otherwise choose a specific direction from the product and audience, or state a reversible assumption. Do not browse for inspiration by default or copy a recognizable product screen wholesale. The reference UIKit skill's scenario chapters can inform interaction recipes, but they are not evidence that a particular visual treatment is right for this web app.

## 2. Translate direction into a small system

Choose tokens once and assign each a role. Use the selected daisyUI theme as a palette foundation, not as a complete design. Define and verify the actual screen's:

- **Type**: a small hierarchy with a clear display/page heading, section heading, body, label, and metadata role. Verify the font is loaded and that labels remain readable at the contracted viewport and zoom.
- **Color**: page canvas, raised surface, primary text, muted text, primary action, and semantic success/warning/error roles. Use one dominant accent; don't color unrelated cards just to make them “pop.”
- **Space and grid**: one spacing rhythm, shared alignment edges, intentional content width, and different density only where the task requires it.
- **Surfaces**: decide where a border, background, divider, or card communicates a real grouping. Prefer open layout and whitespace for incidental grouping; do not box every section.
- **Shape and depth**: a consistent radius and shadow policy. Use elevation only when it explains hierarchy or interaction.
- **Assets**: meaningful, cohesive imagery and icons. Each image must have a purpose, correct crop, and a verified local path. No unrelated stock hero, emoji stand-in, broken SVG, or placeholder avatar in a finished screen.

Only claim custom styles that the installed skill and component API can produce. Where the framework has a real capability gap, use the nearest source-backed treatment and record the compromise. Do not distort product hierarchy just to stay inside a familiar scaffold.

## 3. Compose around the job, not a component inventory

Before writing B4J, sketch the screen as named regions in reading order. For each region, state its user purpose, content, interaction, and responsive behavior. Remove regions that do not help the primary job. Treat the page architecture as a starting frame, not a mandated set of banners, cards, stats, or dividers.

Apply these craft checks while composing:

- Make the page title, key content, and next action distinct at a glance. Keep one clear primary action; use secondary actions only when the task needs them.
- Give each section a reason to occupy space. Avoid duplicate calls to action, repeated generic value cards, empty decorative bands, and arbitrary spacer heights.
- Use realistic, internally consistent copy and data. Avoid filler claims, invented proof points, and repeated lorem-like content.
- Keep repeated items truly consistent. Break the pattern only to signal a meaningful difference.
- Let content set the layout. Check long titles, empty/error messages, translations, and realistic row counts rather than tuning only to short demo copy.
- Make navigation, selected state, keyboard focus, loading, empty, error, success, and disabled states visually legible wherever applicable.
- For touch screens, keep frequent actions reachable and targets usable. For every viewport, avoid page-level horizontal scroll unless the user is viewing a deliberately scrollable data region.

The detailed cognitive-load, content-density, scanning, and accessibility rules remain in [design-intelligence.md](design-intelligence.md) and [ux-master-doctrine.md](ux-master-doctrine.md). Use them as judgment criteria; do not mechanically insert a card, divider, wizard, dock, or five-choice limit where it harms the task.

## 4. Render, inspect, and revise

For each contracted screen capture at least one desktop-width viewport and one phone-width viewport (use the contract's target sizes when supplied). Capture additional tablet or zoom states when the layout or user needs call for them. Review the image itself and the browser console/network output; never approve from source alone.

Run the existing 2-second test and four critique lenses in [ux-review.md](../../sd5-web-orchestrator/references/ux-review.md), then score five quality dimensions from 0 to 4:

| Dimension | 0–1: fail | 2: weak | 3: solid | 4: exceptional |
|---|---|---|---|---|
| Task clarity and hierarchy | User's job or next action is unclear | Competing focal points | Obvious task and readable ranks | Immediate comprehension with deliberate, memorable emphasis |
| System coherence | Tokens, typography, and components visibly conflict | Mostly defaults or inconsistent patterns | Type, color, spacing, and surfaces work together | A precise system carries through every region and state |
| Product fit and distinction | Generic, misleading, or mismatched to the product | Direction is named but barely visible | Visual character fits the audience and has one recognizable detail | Distinctive, restrained character is recognizable without hurting usability |
| Layout and responsive craft | Clipped, overflowing, broken, or unusable | Large dead zones, awkward density, or poor mobile fit | Clear alignment and intentional desktop/phone adaptation | Every viewport feels composed for its available space and content |
| Interaction and finish | Broken assets/states, unclear controls, or inaccessible essentials | Obvious rough edges or incomplete feedback | Controls and applicable states are clear; no visible defects | Feedback, focus, motion, and details feel complete and effortless |

Score each dimension separately for every screen and viewport; cite a visible example for every score below 4. **Release quality gate:** no dimension below 3, average at least 3.5, and no severity-4/5 UX or accessibility finding. New product screens should target 4 on Product fit and distinction. Any broken/missing asset, clipped content, unexpected page-level horizontal scroll, or unresolved critical console/resource error is an automatic fail regardless of average.

For every 0–2 score, write a specific fix with the screenshot region, expected change, and a fresh capture to verify it. Revise and re-score the affected screen, up to the orchestrator's remediation cap. Report `NOT RUN` when screenshots, a browser, or required viewports are unavailable; a skipped visual gate is not a pass.

## 5. Common ways a screen can look bad while code passes

| Visible result | Likely cause | Required correction |
|---|---|---|
| Default-looking set of colored DaisyUI cards | Theme chosen without an art direction; component inventory drove the page | Rebuild the visual thesis, hierarchy, and surface strategy before polishing individual cards |
| Large blank regions or content stranded at the top | Fixed heights, wrong width/height assumptions, or a screenshot reviewed at only one size | Rework content-led layout and compare desktop and phone captures |
| Horizontal scrollbar or clipped control | Responsive classes, nested width defaults, or long content not reviewed in the browser | Fix the owning container and verify no page-level overflow at target widths |
| Tiny, unlabeled, or visually ambiguous fields | Screenshot review focused on general appearance, not form affordances | Show persistent labels, clear control states, readable sizing, and keyboard/focus treatment |
| Broken or irrelevant imagery | Asset path, loading, crop, and purpose were not verified in the rendered page | Correct the local path, verify successful load, and choose an image that supports the product story |
| Polished palette but still “AI-generated” | No product-specific content, editorial rhythm, signature detail, or distinction | Replace generic content and repeated modules with a purposeful composition tied to the audience |

## References

- [Design intelligence](design-intelligence.md) — framework-agnostic hierarchy, density, cognitive load, and ergonomics.
- [Creative director](creative-director.md) — theme, density, task, states, and page-model selection.
- [Page architectures](page-architectures.md) — practical composition starting points.
- [UX review](../../sd5-web-orchestrator/references/ux-review.md) — screenshot critique, severity, and revision loop.
- B4XDaisyUIKit `SKILL.md` and scenario chapters — native component and domain recipes; verify web behavior separately.
