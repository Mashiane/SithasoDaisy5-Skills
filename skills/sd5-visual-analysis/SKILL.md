---
name: sd5-visual-analysis
description: Design-to-code forensics for SithasoDaisy5. Turns a screenshot, mockup, wireframe, or reference URL into verified B4J/SDUI5 code via the 10-stage visual pipeline — function-first extraction (NEVER literal pixel mapping), screen contract, implementation through the orchestrator gates, then capture-and-compare fidelity review. Use when the user provides a design reference to replicate.
metadata:
  category: workflow
  triggers: screenshot to code, replicate this design, copy this screen, mockup to app, wireframe to code, visual forensics, design reference, rebuild this UI
---

# sd5-visual-analysis — Screenshot → SDUI5 Forensics Pipeline

The user hands you a picture of an app. You produce a verified B4J/BANano web app. The rule that makes this work is **design-intelligence.md DI-12**: extract *function first, structure second, style last* — never map pixels to components 1:1 (NEG-036).

```text
REFERENCE SCREEN (image / URL / wireframe)
   ↓
 1. INGEST            — obtain a stable image; URL → screenshot first
   ↓
 2. VISUAL FORENSICS  — regions, hierarchy, density, spacing, colors, type
   ↓
 3. FUNCTION EXTRACTION — DI-11 2-second test on the REFERENCE
   ↓
 4. COMPONENT IDENTIFICATION — semantic selection (§0.1/0.2), NEG-036 guard
   ↓
 5. TOKEN & STYLE EXTRACTION — sampled colors → theme/tokens/channels (§1.1)
   ↓
 6. SCREEN CONTRACT   — fill screen-contract.template.md (L5 gate)
   ↓
 7. IMPLEMENT         — sithasodaisy5 6-stage workflow (Stages 1–4)
   ↓
 8. BUILD + CAPTURE   — orchestrator Stages 5–8 (pre-scan, conformance, build, capture)
   ↓
 9. VISUAL COMPARISON — reference vs capture, region-by-region, severity-scored
   ↓
10. CORRECTION LOOP   — cap 3 → APPROVE
```

---

## When to Use

- "Rebuild this screen" + screenshot/mockup/wireframe
- "Make it look like this app" + reference image or live URL
- Figma/Sleek/Stitch exports as flat images
- Hand-drawn wireframes (Uizard-style sketch interpretation)

## When NOT to Use

- Prompt-only design (no reference) → `sithasodaisy5` Stage 0 + `references/prompt-contracts.md`
- Single-component question → `sithasodaisy5` directly
- Full app from prompt → `sd5-web-orchestrator` directly (visual analysis feeds INTO it at Stage 0)

---

## Stage Procedures

### 1. INGEST
- Image file: confirm it exists and is readable.
- Live URL: capture a full-page screenshot first (headless Edge/Chrome, same tooling as `capture-screens.ps1`), then treat the PNG as the reference. Do not scrape the DOM of the reference — analyze the *image*; the DOM of someone else's app is not our source of truth.
- Multi-screen reference: one pipeline run per screen; register pages in one contract set.

### 2. VISUAL FORENSICS
Fill `references/forensics.template.md`. Identify and record:
- **Regions**: every visually distinct band/card/list (top to bottom)
- **Alignment & rhythm**: grid columns, spacing step, one axis or broken
- **Density** (DI-6): Hero / Comfortable / High
- **Sampled colors**: hex per region (bg, surface, text, accent, state colors)
- **Typography scale**: relative sizes, weights, casing per rank
- **Decorative effects**: gradients (orientation + stops), glass, shadows, glows (aura?), masks

### 3. FUNCTION EXTRACTION (before any component thought)
Answer DI-11 for the **reference**:
1. Primary task? 2. Dominant element? 3. Obvious next action? 4. Recognize vs recall?
Then restate every region as **function**: "header → identity + global nav", "row of numbers → KPI display", "colored pill → status". If you cannot state a region's function, mark it decorative-or-noise and propose dropping it (confirm with user).

### 4. COMPONENT IDENTIFICATION
Run `../sithasodaisy5/references/daisyui-compatibility.md` §0.1 (discovery protocol) + §0.2 (semantic selection layer) per region:
- Function → interaction pattern → semantic role → SDUI5 candidate(s)
- Shortlist ≥ 2 candidates for non-obvious regions; read both component .md files; select with rationale
- **NEG-036 guard**: writing "there is a card → SDUI5Card" without a function statement is a stop-and-redo offense
- Check every candidate against `component-manifest.md` status (Demonstrated preferred, Documented-only needs user approval)

### 5. TOKEN & STYLE EXTRACTION
Map forensic samples to the channel policy (`../sithasodaisy5/references/design-tokens.md` §1.1) — in this priority order:
1. **Theme approximation** — does a `THEME_*` constant (design-tokens §6) carry the palette? Prefer it.
2. **Custom theme** — brand identity colors → daisyUI CSS vars + `app.SetTheme("<custom>")`.
3. **Channels** — accents/decorative: `.Classes` arbitrary values, gradient props, component color props, `.Styles`. Never `.Color`.
- Typography → Tailwind size/weight classes; density → spacing step; effects → `glass` utility, gradient props, `SDUI5Aura`.
- Unsupported styles (skeuomorphic chrome, overlap chaos) → style-tier policy: approximate + declare.

### 6. SCREEN CONTRACT (L5 gate)
Fill `../sd5-web-orchestrator/references/screen-contract.template.md` from the forensics artifact:
- Task model + DI-11 answers → contract Task Model
- Sampled palette → Design Direction (theme + channels + style tier)
- Region→component table → Component Inventory (with manifest status)
- Declared deviations from the reference (style-tier approximations, dropped decorative regions) → Notes/Deviations
No contract → no generation.

### 7. IMPLEMENT
Run the `sithasodaisy5` 6-stage workflow Stages 1–4 (bootstrap → rules → architecture → synthesis) exactly as the orchestrator defines. Component selection is already done — Stage 4 becomes verification of mount sequences and demo citations.

### 8. BUILD + CAPTURE
Orchestrator Stages 5–8: pre-scan → verify-conformance → build + build-watch → `capture-screens.ps1`. Same gates, no shortcuts.

### 9. VISUAL COMPARISON
Side-by-side: reference PNG vs captured PNG. Per region, score **fidelity of function and structure**, not pixels:

| Must match | May differ (declared in contract) |
|---|---|
| Region structure & order | Exact colors (theme approximation) |
| Hierarchy ranks (DI-2) | Exact fonts (framework typography) |
| Content types & states | Decorative effects (tier policy) |
| Interaction targets & density tier | Platform conventions (DI-10) |

Score mismatches with `../sd5-web-orchestrator/references/ux-review.md` severity scale + run its 2-second test on OUR capture (the reference already passed it by existing).

### 10. CORRECTION LOOP (cap 3)
Diagnose each mismatch (cite DI-*/NEG-*/RULE-*) → fix client-side → re-run gates → re-capture → re-compare. After 3 failed passes → human escalation with the comparison table. Approved comparison artifacts go in `ux-review/comparison/`.

---

## Hard Rules (non-negotiable)

1. **Function before structure before style** (DI-12 / NEG-036). Literal pixel mapping = redo.
2. Every emitted component must exist in `components/<Name>.md` and be checked against the manifest — no inventing APIs to match a visual (RULE-MOUNT-002/003).
3. No raw HTML to chase a visual (RULE-ANTI-001). Channels only (design-tokens §1.1).
4. The screen contract gate still applies — a beautiful analysis is not a contract.
5. Fidelity claims must cite the comparison artifact, not vibes.

---

## References

- `../sithasodaisy5/references/design-intelligence.md` — DI-* doctrine (this skill is DI-12 applied end-to-end)
- `../sithasodaisy5/references/daisyui-compatibility.md` — §0.1 discovery protocol, §0.2 semantic selection, §0 channels
- `../sithasodaisy5/references/design-tokens.md` — §1.1 channels, §6 themes, §14 style tiers
- `../sithasodaisy5/references/negative-knowledge.md` — NEG-036 + full anti-pattern catalog
- `../sithasodaisy5/references/prompt-contracts.md` — if the reference has a known style, the matching contract may pre-solve Stage 5
- `../sd5-web-orchestrator/SKILL.md` — Stages 5–9 gates + release bundle
- `../sd5-web-orchestrator/references/screen-contract.template.md` — Stage 6 artifact
- `../sd5-web-orchestrator/references/ux-review.md` — Stage 9 severity + critic
- `./references/forensics.template.md` — Stage 2 artifact

---

## Core Operating Principles: Truth & Accuracy

You are committed to truth and accuracy above everything else, including being helpful. A wrong answer delivered confidently is worse than no answer. Follow these 7 rules in every response:

1. **UNCERTAINTY**: If you are not fully certain about something, say so clearly. Use phrases like "I am not certain, but..." or "You may want to verify this...". Never state guesses as facts.
2. **SOURCES**: Do not invent paper titles, author names, URLs, or book references. If you cannot name a real, verifiable source, say "I do not have a verified source for this."
3. **STATISTICS**: Flag any number you are not 100 percent confident in. Say "approximately" and recommend the user verify it from a primary source.
4. **RECENT EVENTS**: Remind the user when a topic may have changed since your knowledge cutoff. Do not present outdated info as current.
5. **PEOPLE and QUOTES**: Never attribute a quote to a real person unless you are certain they said it. If unsure, say "I cannot confirm this quote is accurate."
6. **CODE and TECHNICAL**: Never invent function names, library methods, or API syntax. If unsure a function exists, tell the user to verify it in the current docs.
7. **LOGIC GAPS**: Do not fill missing context with assumptions. If something is unclear, ask a clarifying question before answering.

If a response would require breaking any of these rules, choose honesty over helpfulness every time.
