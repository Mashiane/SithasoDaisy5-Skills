---
name: ux-review
description: Design-critic review of generated screens - generate -> critique -> revise -> critique -> approve loop. Stage 9 of the orchestrator workflow. Four critique lenses, 10-tier UX quality hierarchy, 20-point pre-delivery polish checklist, and severity scoring; >=4 severity = ship blocker.
---

# SithasoDaisy5 - UX Review & Design Critic (v2)

Stage 9 is not a rubber stamp - it is the **critic** in the generation loop:

```text
GENERATE  ->  CRITIQUE  ->  REVISE  ->  CRITIQUE  ->  APPROVE
 (4-8)       (this file)   (edit)     (this file)   (verdict)
```

Run after Stage 8 (capture). For each screen, review desktop- and phone-width PNGs plus BUILD-WATCH evidence. Run the **2-second test**, the **four critique lenses**, the **10-tier UX quality hierarchy**, the **20-point polish checklist** (from [design-craft-guide.md](../../sithasodaisy5/references/design-craft-guide.md)), then the doctrine/severity gates. Every critique pass is logged; the remediation loop (cap 3) re-runs it. A missing viewport, unread screenshot, or unavailable browser evidence is `NOT RUN`, never `PASS`.

---

## 1. The 2-Second Test (design-intelligence.md DI-11)

Answer from the rendered screenshot, not the code:

1. **Primary task** - what is this screen for? (one sentence)
2. **Hierarchy** - which single element dominates?
3. **Next action** - what is the obvious thing to do?
4. **Recognition** - what must the user recognize rather than recall?

**2+ failures -> automatic revision loop**, regardless of severity table below.

---

## 2. Four Critique Lenses & 10-Tier UX Quality Hierarchy

### Lens A - UX (DI-1..DI-5)
- Is the primary user task visually dominant?
- Can the user understand the screen in 2-3 seconds?
- Is the next action obvious? Are secondary actions competing with it?
- Progressive disclosure: is anything visible that belongs behind collapse/drawer/detail?
- Cognitive load: > 5 simultaneous choices? > 7 controls per form group?
- Same semantic -> same component -> same position (Jakob)?

### Lens B - Visual & Surface Craft (DI-2, DI-6, DI-7 & design-craft-guide.md)
- Hierarchy expressed via size/weight/color/space - or is everything emphasized?
- Density Dial (1-10) calibration respected (e.g. compact p-4 for dashboard vs spacious p-8 for showcase)?
- Surface elevation: hairline borders (`border-base-200/80` or `border-white/10`) rather than thick default borders?
- Accent Rarity: is the primary button color used **strictly once** per viewport?
- Bento composition: does the layout use modern asymmetric splits (8/4 or 7/5) rather than boring identical cards?
- Typography: curated Google Font injected? Tight tracking (`tracking-tight`) on headings?
- Zero placeholder pollution: are default strings (`"Card Title"`, `"Card Content"`, `"Lorem Ipsum"`) completely absent?

### Lens C - Interaction & Micro-Polish (DI-8, DI-9, DI-10)
- Touch targets >= 48px; primary action in the natural scan-end / thumb zone?
- Button active feedback: click depression (`active:scale-95`) present?
- Card hover elevation: subtle lift (`hover:-translate-y-0.5 hover:shadow-lg`) on interactive cards?
- Live indicators: active breathing pulse dot (`animate-ping`) on operational metrics?
- Destructive actions separated + confirmed (`app.ShowSwalConfirm`)?
- Does the page survive browser back + refresh?

### Lens D - Accessibility & Contrast (WCAG 2.2 AA)
- Contrast (1.4.3, 1.4.11): >= 4.5:1 text contrast on cards; >= 3:1 on UI controls.
- Keyboard reachability (2.1.1), focus visible (2.4.7).
- No raw emojis used for critical UI status - use crisp vector icons or semantic badges.
- Target size (2.5.5), text scaling at 200% zoom.

---

## 3. Severity Scale

| Severity | Meaning | Action |
|---|---|---|
| 0 | Trivial / informational | Note only |
| 1 | Cosmetic (spacing, color) | Fix if cheap |
| 2 | UX friction (suboptimal pattern) | Fix in next iteration |
| 3 | Notable issue (wrong component, missing state) | Fix before release |
| 4 | Ship blocker (Fitts fail, no error state, a11y violation) | Must fix this run |
| 5 | Critical (app unusable) | Stop, escalate |

**Ship gate**: any finding >= 4 fails the release bundle. 2-second-test failure counts as severity 4.

---

## 3a. Design Quality Score (required)

Score every contracted screen separately at desktop and phone widths using the five 0-4 dimensions in the [Design Quality Playbook](../../sithasodaisy5/references/design-quality-playbook.md): task clarity and hierarchy; system coherence; product fit and distinction; layout and responsive craft; interaction and finish. Cite visible screenshot evidence for any score below 4.

**Ship gate:** every dimension >= 3, average >= 3.5, no severity-4/5 UX or accessibility finding, and no broken/missing asset, clipping, unexpected page-level horizontal scroll, or unresolved critical console/resource error. New product screens should target >= 4 for product fit and distinction. Record `NOT RUN` when the evidence is unavailable. Any failed gate triggers revision and a fresh capture within the existing three-pass limit.

---

## 4. Review Template (per screen)

```text
Screen: pgXxx.bas
Desktop capture: ux-review/screens/desktop/<PageId>.png
Phone capture: ux-review/screens/phone/<PageId>.png
Build-Watch: ux-review/BUILD-WATCH-<date>.md
Critique pass #: <1 | 2 | 3 (remediation loops)>
Reviewed by: <agent>
Date: <date>

=== 2-Second Test (DI-11) ===
Primary task visible:    YES / NO
Hierarchy dominant:      <element> / UNCLEAR
Next action obvious:     YES / NO
Recognition over recall: YES / NO
-> 2-second verdict: PASS (0-1 fail) / FAIL (2+ fails -> revision loop)

=== 3 Design Dials Verification ===
Declared Archetype:      <Fintech | B2B SaaS | Command Center | E-Commerce | Healthcare | Creative>
Visual Density (1-10):   Declared <n> vs Rendered <n> -> PASS / FAIL
Design Variance (1-10):  Declared <n> vs Rendered <n> -> PASS / FAIL
Motion Intensity (1-10): Declared <n> vs Rendered <n> -> PASS / FAIL

=== 10-Tier UX Quality Hierarchy ===
Tier 1: Accessibility & Contrast (>= 4.5:1, visible focus): PASS / FAIL
Tier 2: Touch Targets (>= 44px, >= 8px gap):               PASS / FAIL
Tier 3: Loading States & Perceived Performance:            PASS / FAIL
Tier 4: Style Uniformity & Accent Rarity (1 primary CTA):  PASS / FAIL
Tier 5: Responsive Resilience (390px, 0 overflow):         PASS / FAIL
Tier 6: Typography Scale & Font Injection:                 PASS / FAIL
Tier 7: Surface Craft & Hairline Borders:                  PASS / FAIL
Tier 8: Form Usability & Inline Error Guidance:            PASS / FAIL
Tier 9: Navigation & Wayfinding Indicators:                PASS / FAIL
Tier 10: Rich Empty State (Icon + Copy + CTA):             PASS / FAIL

=== Lens A - UX ===
Primary task dominant:     PASS / WARN: <finding>
Secondary not competing:   PASS / WARN / FAIL
Progressive disclosure:    PASS / WARN / FAIL
Choices <= 5 / fields <= 7: PASS / WARN / FAIL

=== Lens B - Visual & Craft ===
Hierarchy instruments:     PASS / WARN / FAIL
Spacing + alignment:       PASS / WARN / FAIL
Density matches contract:  PASS / FAIL
Card overuse (NEG-036):    PASS / WARN
Placeholder clean (0 slop): PASS / FAIL

=== Lens C - Interaction ===
Touch targets >= 48px:     PASS / FAIL
Primary in thumb/scan-end: PASS / WARN / FAIL
Destructive confirmed:     PASS / FAIL / N/A
Back/refresh survival:     PASS / FAIL / N/A

=== Lens D - Accessibility (WCAG 2.2 AA) ===
1.4.3 Contrast:            PASS / FAIL: <pair, ratio>
1.4.11 Non-text contrast:  PASS / FAIL
2.1.1 Keyboard:            PASS / FAIL
2.4.7 Focus visible:       PASS / FAIL
2.5.5 Target size:         PASS / FAIL
4.1.2 Name/role/value:     PASS / FAIL

=== State Coverage (contract) ===
Core 4:  Loading VISIBLE/MISSING | Populated VISIBLE/MISSING | Empty VISIBLE/MISSING | Error VISIBLE/MISSING
Extended (contract-declared): Offline <OK/N-A/FAIL> | Permission <OK/N-A/FAIL> | Validation <OK/N-A/FAIL> | Partial <OK/N-A/FAIL> | First-use <OK/N-A/FAIL>

=== Doctrine Gates ===
Fitts: PASS/WARN/FAIL | Hick (advisory): PASS/WARN | Miller: PASS/WARN/FAIL | Jakob: PASS/WARN/FAIL
DoD (ux-master-doctrine.md Section 4): <items above plus lifecycle, tokens, APIs, ARCH match>
Build-Watch: crashes NONE/<list> | resource errors NONE/<list>

=== Findings ===
| Sev | Rule / DI | Finding | Fix Ticket |
|-----|-----------|---------|------------|
| 3   | NEG-012   | Touch target 36px on settings icon | draft: <how to fix> |
| 4   | RULE-INTERACT-003 | No Empty state on products table | draft: <how to fix> |

=== Design Quality Score (0-4; cite screenshot evidence) ===
| Dimension | Desktop | Phone | Evidence / fix when below 4 |
|---|---:|---:|---|
| Task clarity and hierarchy | <0-4> | <0-4> | <region and observation> |
| System coherence | <0-4> | <0-4> | <region and observation> |
| Product fit and distinction | <0-4> | <0-4> | <region and observation> |
| Layout and responsive craft | <0-4> | <0-4> | <region and observation> |
| Interaction and finish | <0-4> | <0-4> | <region and observation> |
Desktop average: <n>/4 | Phone average: <n>/4 | Gate: PASS / FAIL / NOT RUN | Broken asset / clipping / page overflow: NONE / <finding>

=== Verdict ===
REVISE (severity >= 4, 2-second FAIL, or design score gate FAIL) / READY WITH FIXES (sev 3 and design gate PASS) / APPROVED (<= 2 and design gate PASS)
Critique passes used: <n> / 3
```

---

## 5. Common Findings (Fix Ticket format)

### Severity 4 - Ship Blocker

| Symptom | Rule | Fix |
|---|---|---|
| Touch target < 48px | `RULE-INTERACT-001` / `NEG-012` | Add `.Classes = "min-h-12 min-w-12"` or wrap icon in sized button |
| No Empty state | `RULE-INTERACT-003` / `NEG-010` | Mount `SDUI5Empty` or dashed card with icon + CTA; set `.Visible = True` on zero-data branch |
| No Error state | `RULE-INTERACT-003` / `NEG-010` | Mount `SDUI5Alert(.Color="error")`; surface fetch exception |
| No Loading skeleton | `RULE-INTERACT-003` / `NEG-024` | Mount `SDUI5Skeleton` during fetch |
| Tab order broken | `RULE-XLATE-002` / `NEG-015` | Replace `<div onclick>` with `SDUI5Button` |
| Contrast fail on text | WCAG 1.4.3 / `NEG-027` | Switch to `*-content` pair; verify ratio >= 4.5:1 |
| Page renders blank | `RULE-LAYOUT-001` / `NEG-009` | Add the missing hierarchy level |
| Documented-only component without approval | `RULE-MOUNT-003` | Ask user, document approval, or pick alternative |
| Missing ModuleN= | `RULE-SETUP-003` / `NEG-029` | Add `ModuleN=pgXxx` + bump count |
| 2-second test fails (2+ items) | DI-11 | Revise per Lens A/B findings, re-capture |

### Severity 3 - Notable

| Symptom | Rule | Fix |
|---|---|---|
| Two primary CTAs | `NEG-013` | Demote one to `secondary`/`neutral`/`ghost` per Accent Rarity |
| Destructive without confirm | `RULE-INTERACT-004` / `NEG-014` | `app.ShowSwalConfirm(...)` async |
| No retry on error state | `NEG-035` | `SDUI5Button` re-invoking the load sub |
| Multiple jarring Loading states | `NEG-024` | One skeleton, hide other data |
| Hex on themed component breaks switching | `NEG-025` | Move brand color to theme CSS vars |
| Extended state undeclared but relevant | `RULE-INTERACT-003` | Declare in contract or implement |

### Severity 2 - UX Friction

| Symptom | Fix |
|---|---|
| Primary CTA below the fold / out of thumb zone | Reposition to scan-end |
| Form submit not last field | Reorder (RULE-INTERACT-005) |
| Tab order mismatches visual order | Fix component mount order |
| Loading flash on cached data | Skeleton min display time |

### Severity 1 - Cosmetic

| Symptom | Fix |
|---|---|
| Inconsistent spacing between similar elements | Same `gap-N` step |
| Color slightly off-theme | Re-check token assignment |
| Icon size inconsistent | One `Size` value across app |

---

## 6b. Optional Performance Gate (Lighthouse / Core Web Vitals)

If browser tooling is available, run a Lighthouse audit and record:
- LCP <= 2.5s, INP <= 200ms, CLS <= 0.1
- Performance score >= 90, Accessibility >= 100 (automated), Best Practices >= 95, SEO >= 95

These are advisory unless the contract declares performance requirements.

## 6. The Revision Loop

```text
CRITIQUE pass N
  |-- 2-second FAIL, design score gate FAIL, or severity >= 4 -> REVISE
  |     -> apply client-side fixes (re-edit pg*.bas; never lib .bas)
  |     -> re-run gates 5-8 -> RE-CAPTURE -> CRITIQUE pass N+1
  |-- severity 3 only -> READY WITH FIXES (tickets opened)
  \-- severity <= 2    -> APPROVED
After 3 failed passes -> human escalation, do not ship.
```

Each pass writes `UX-REVIEW-<date>.md` with pass number; the verdict block records passes used.

---

## References

- `design-intelligence.md` - DI-* decision doctrine + 2-second test
- `design-craft-guide.md` - 3 Design Dials, 10-Tier UX Quality Hierarchy, 6 Industry Archetypes, Bento grids, and 20-Point Polish Checklist
- `chapters/` - Canonical scenario blueprints (ch01 to ch06)
- `ux-master-doctrine.md` - quantitative laws + state coverage + DoD
- `rules-enforcer.md` - every rule with severity rationale
- `negative-knowledge.md` - anti-pattern catalog (NEG-*)
- `page-architectures.md` - what "right" looks like per screen type
- `daisyui-compatibility.md` - semantic selection + web -> SDUI5 translation
- `screen-contract.template.md` - the contract this review audits against
