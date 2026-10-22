---
name: forensics
description: Per-screen visual forensics artifact for sd5-visual-analysis. Filled at pipeline Stages 2–5; consumed by the screen contract (Stage 6) and the comparison review (Stage 9).
---

# Visual Forensics — `<reference-name>`

> One artifact per reference screen. Fills Stages 2–5 of the sd5-visual-analysis pipeline. Cite DI-*/NEG-* IDs where a decision is non-obvious.

## Reference

- **Source**: <file path | URL (captured to: <png path>)>
- **Type**: screenshot | mockup | wireframe | live capture
- **Style tier guess** (design-tokens.md §14): ✅ | 🧪 | ⛔ → <which aesthetic>
- **Analyst**: <agent> · **Date**: <date>

---

## DI-11 Function Extraction (Stage 3 — before components)

1. **Primary task**: <one sentence>
2. **Dominant element**: <what + why>
3. **Obvious next action**: <what>
4. **Recognition over recall**: <what the user must recognize>

2-second verdict on reference: PASS / FAIL (if FAIL, note — reference is itself poor UX; propose corrections in Deviations)

---

## Region Table (Stage 2 + Stage 4)

Top to bottom. One row per visually distinct region. Function BEFORE component (NEG-036).

| # | Region | Function (one phrase) | Structure (grid/stack/row) | Rank (DI-2) | Candidate components (≥2 if non-obvious) | Selected | Rationale + citation |
|---|--------|----------------------|---------------------------|-------------|------------------------------------------|----------|---------------------|
| 1 | <top bar> | identity + global nav | row, 3 zones | 3 | NavBar / Card+Row | `SDUI5NavBar` | <demo cited> |
| 2 | <KPI strip> | key numbers | grid 3-col | 1–2 | Stat / InfoCard row | `SDUI5Stat` | ... |
| 3 | ... | ... | ... | ... | ... | ... | ... |

**Dropped decorative regions**: <list + reason> (user confirmed: Y/N)
**Manifest status check**: every Selected component Demonstrated? <Y/N — list approvals>

---

## Sampled Palette → Channel Map (Stage 5)

| Sample (hex) | Region/role | Semantic? | Mapping | Channel (design-tokens §1.1) |
|---|---|---|---|---|
| `#F5F5F7` | page bg | no | `THEME_CORPORATE` base | theme approximation |
| `#007AFF` | primary CTA | yes — brand primary | theme CSS var override | custom theme |
| `#FF3B30` | destructive | yes | `.Color = "error"` | token |
| `#597BFC` | chart fill | no | `TrendChart.ShapeColor` | component color prop |
| <gradient stops> | hero band | no | `GradientColor1/2` + orientation | gradient props |
| ... | ... | ... | ... | ... |

**Theme decision**: `app.THEME_<X>` | custom theme `<name>` (CSS vars in app stylesheet)
**Prefer-theme check**: could the whole palette ride one theme? <Y/N — why not>

---

## Typography & Density (Stages 2, 5)

| Rank | Sample size/weight/casing | Mapping |
|---|---|---|
| 1 (dominant) | <e.g. ~48px extrabold uppercase> | `text-5xl font-extrabold uppercase` |
| 2 | ... | ... |
| metadata | ... | `text-xs opacity-70` |

- **Density tier** (DI-6): Hero / Comfortable / High — <evidence: spacing step ~Npx, chrome ratio>
- **Spacing step**: <4/8/16/24/32 rhythm observed>
- **Alignment**: single axis? <Y/N — if N, flag style tier>

## Effects Inventory (Stage 2 → Stage 5)

| Effect | Where | Channel |
|---|---|---|
| glass | <cards> | `.Classes = "glass"` |
| gradient | <nav bg> | `GradientActive` + orientation + hex stops |
| glow/aura | <primary CTA> | `SDUI5Aura` (TypeOf) — one per page |
| shadow style | <cards> | `shadow-*` utility |
| unsupported | <bevel/chrome> | ⛔ approximate via <theme/gradient>, declared |

---

## Declared Deviations (feeds contract Notes/Deviations)

| Reference has | We will do | Why | Tier impact |
|---|---|---|---|
| <exact font X> | `font-sans` approximation | no custom font channel needed | none |
| <skeuomorphic chrome> | flat theme + gradients | style tier ⛔ | ⛔→approx |

---

## Handoff Checklist

- [ ] Every region has a function statement (NEG-036)
- [ ] Every Selected component checked against `component-manifest.md`
- [ ] Palette mapped with explicit channels; `.Color` stays token-only
- [ ] Style tier declared; deviations listed
- [ ] Ready to fill `screen-contract.template.md` (Stage 6)
