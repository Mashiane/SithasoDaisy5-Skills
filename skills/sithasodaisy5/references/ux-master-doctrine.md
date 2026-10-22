---
name: sithasodaisy5-ux-master-doctrine
description: Master UI/UX engineering doctrine for SithasoDaisy5 web apps. Quantitative design laws (Fitts, Hick, Miller), WCAG 2.2 AA accessibility, 4-state UI completeness, Definition of Done. Cited as RULE-DOCTRINE-* by rules-enforcer.
---

# SithasoDaisy5 — UX Master Doctrine

The authoritative UI/UX foundation for SithasoDaisy5 web apps. Every component and screen composition should be evaluated against these quantitative laws. Cited as `RULE-DOCTRINE-*` by `rules-enforcer.md` and `orchestrator` workflow.

---

## 1. The Four Quantitative Laws

### 1.1 Fitts's Law — Target Reachability

**Law**: The time to acquire a target is `a + b · log₂(1 + D/W)` where D = distance, W = width. **Larger or closer = faster.**

**Web application**:
- Interactive click/touch targets MUST have minimum **44×44 px** (Apple HIG) or **48×48 px** (Material Design 3, WCAG 2.5.5 AAA). Use 48px as the floor.
- Padding-around-icon fallback: if the visual icon is smaller, pad the click target to 48px via `padding` or wrap in a sized button.

**BAD**:
```html
<button class="btn btn-circle btn-xs">×</button>  <!-- ~24px, unreachable -->
```

**GOOD**:
```html
<button class="btn btn-circle btn-sm min-h-12 min-w-12">×</button>
<!-- or wrap in a sized container -->
```

---

### 1.2 Hick's Law — Choice Latency

**Law**: Decision time grows logarithmically with the number of choices: `a + b · log₂(n)`. **More choices = exponentially more friction.**

**Web application**:
- Top-level navigation (Navbar, Dock, Tabs, Drawer primary items): **≤ 5 visible items**. Hide the rest under a "More" menu.
- Long lists (Menus, Selects, Tabs): group into categories; do not flatten every option into one list.
- Modal action buttons: primary action + 1 secondary + 1 dismiss. Never more than 3.

**BAD**:
```html
<nav class="navbar">9 tabs in a row</nav>  <!-- cognitively paralyzing -->
```

**GOOD**:
```html
<nav class="navbar">5 tabs</nav>
<button class="btn btn-ghost">More…</button>  <!-- overflow behind a menu -->
```

---

### 1.3 Miller's Law — Working Memory

**Law**: Working memory holds ~7±2 items. Group content into chunks of **5–9** at any visible level.

**Web application**:
- Sidebars/Forms: chunk fieldsets with `SDUI5FieldSet` of 5–7 controls.
- Tables: paginate to ≤ 25 rows visible; consider virtualization for > 100 rows (`SDUI5List`).
- Wizards: 3–5 steps max. Beyond that, split into multiple wizards.

---

### 1.4 Jakob's Law — User Mental Model

**Law**: Users prefer your site to work the way other sites do. **Leverage conventions.**

**Web application**:
- Top-left = logo/home, top-right = account/settings/notifications.
- Submit button = bottom-right of forms (primary action position).
- Delete/irreversible = confirm modal before action.
- Destructive primary = bottom-left or behind a "More" menu.

---

## 2. WCAG 2.2 AA Accessibility (Hard Gates)

| Criterion | Rule | Web implementation |
|---|---|---|
| **1.4.3 Contrast (Minimum)** | Text contrast ≥ 4.5:1 (normal) or ≥ 3:1 (large 18pt+ / 14pt+ bold) | Use semantic tokens (`base-content` on `base-100`, `primary-content` on `primary`); daisyUI themes ensure AA-compliant pairings. |
| **1.4.11 Non-text Contrast** | UI components & graphical objects ≥ 3:1 against adjacent | Borders, focus rings, icons must use semantic colors, not raw grey. |
| **2.1.1 Keyboard** | All functionality available via keyboard | Use semantic `<button>`, `<a>`, `<input>`; never `<div onclick>`. SDUI5 components emit these correctly. |
| **2.4.7 Focus Visible** | Keyboard focus indicator visible | daisyUI's `:focus-visible` ring is on by default; do not override it off. |
| **2.5.5 Target Size (AAA)** | Touch targets ≥ 44×44 px | See Fitts above. |
| **4.1.2 Name, Role, Value** | All UI components have accessible name | Use `aria-label` for icon-only buttons; SDUI5 sets these via `Text`/`Title` props. |

---

## 3. 4-State UI Completeness (Hard Gate for Data-Driven Views)

Every view that fetches, computes, or waits for data MUST explicitly implement all four states:

| State | When | SDUI5 Pattern |
|---|---|---|
| **Loading** | Initial fetch / computation | `SDUI5Loading` or `SDUI5Skeleton` |
| **Populated** | Data arrived | Component with `.Items`/`.Text` populated |
| **Empty** | Data arrived but zero rows | `SDUI5Text` empty-state message with an optional `SDUI5Button` action |
| **Error** | Fetch/recompute failed | `SDUI5Alert` (Color="error") with retry button or `app.ShowSwalError(...)` |

**Anti-pattern** (common mistake):
```b4j
' BAD: only renders the happy path
If data.Size > 0 Then
    table.SetItems(data)
End If
```

**GOOD**:
```b4j
If fetching Then
    loading1.Visible = True
    table1.Visible = False
    alert1.Visible = False
    empty1.Visible = False
Else If lastError <> "" Then
    loading1.Visible = False
    table1.Visible = False
    alert1.Visible = True
    alert1.Text = lastError
    empty1.Visible = False
Else If data.Size = 0 Then
    loading1.Visible = False
    table1.Visible = False
    alert1.Visible = False
    empty1.Visible = True
Else
    loading1.Visible = False
    table1.Visible = True
    alert1.Visible = False
    empty1.Visible = False
    table1.SetItems(data)
End If
```

---

## 4. Definition of Done (per screen)

A page is **DONE** when ALL of the following hold:

- [ ] Hierarchy established (`SDUI5Container1` → `SDUI5RowN` → `SDUI5ColumnN` → leaf components) before any `AddComponent`
- [ ] `BANano.Await(app.ClearPageView)` first in `Sub Show`
- [ ] `pgIndex.UpdateTitle("...")` last before `End Sub`
- [ ] Themed components use semantic tokens where their property contract supports them; custom CSS colors use a documented component/style channel
- [ ] Data-driven views: core 4 states implemented; extended states declared in contract (RULE-INTERACT-003)
- [ ] Touch targets ≥ 48px (Fitts)
- [ ] Top-level nav has ≤ 5 items (Hick)
- [ ] Forms grouped into fieldsets of ≤ 7 (Miller)
- [ ] Keyboard-navigable, focus ring visible (WCAG 2.1.1, 2.4.7)
- [ ] All `SDUI5*` classes used exist in `components/<Name>.md` (no invented APIs)
- [ ] Component used is **Demonstrated** (has a verified demo), or user approved a **Documented-only** use
- [ ] Page matches one of the `ARCH-*` patterns in `page-architectures.md` (or new pattern justified)
- [ ] `verify-conformance.ps1` passes (exit 0)
- [ ] `pre-scan.ps1` passes (exit 0)

---

## 4.1 Skill Coverage Contract — Non-Negotiable

**Rule**: Every component registered in `SithasoDaisy5.b4j` `ModuleN=` MUST have a corresponding `components/<Name>.md` skill file. This is **non-negotiable**.

- **Source of truth**: `C:\b4j\workspace\0SithasoDaisy5\SithasoDaisy5.b4j` — the `ModuleN=<Name>` entries. **The manifest wins.** On-disk `.bas` count, `DesignerCreateView` flag, and demo count are secondary.
- **Scope**: 159 module names are currently registered: 139 `SDUI5*` UI classes and 20 support modules. Skill folder `components/` MUST contain exactly 159 top-level `.md` files (one per normalized `ModuleN=` name, matching registry spelling). Path-qualified entries use their final module-name segment; `_unused/` notes are excluded.
- **Orphans**: `.bas` files that exist on disk but are **not** in `ModuleN=` belong in `components/_unused/`. They are not part of the buildable framework.
- **Naming**: `<ModuleN value>` casing is authoritative. If the manifest says `SDUI5CountDown`, the file is `components/SDUI5CountDown.md` (CamelCase), not `components/SDUI5Countdown.md`.
- **Enforcement**: `verify-conformance.ps1` MUST fail (exit 1) if any registered module lacks a skill file. The check is part of every orchestrator run.
- **Drift response**: any `ModuleN=` add/ rename/ remove in the B4J manifest triggers a corresponding skill change in the same Mode-4 fold-in cycle. Out-of-sync = broken contract.

---

## 5. Anti-Patterns (Red Flags)

If you catch yourself thinking any of these, **STOP**. You are rationalizing.

| Thought | Reality |
|---|---|
| "I'll just set `.Width = N` direct pixels" | Banned. Use the component's `.Width` setter or `AddComponent` with the parent's computed dims. |
| "I'll add a `setRequired` setter that doesn't exist" | It does not exist. Use `.Required = True` (direct property) — never invent setter names. |
| "This setter probably exists" | If it is not in `components/<Name>.md`, it does not exist. You are inventing it. |
| "One missing state — Empty — is fine, users won't hit it" | They will. Build all 4. |
| "I'll skip `BANano.Await(app.ClearPageView)` — re-renders fine without it" | Causes stale views and duplicate child stacking on resize. Always first. |
| "I'll use a static `Width = "100%"` on the Table" | Use `.Width = "full"` — the only valid string token. |
| "Five toolbar icons is fine, users will learn" | Hick's Law. Cap at 5. Overflow goes behind "More". |
| "Color `#3b82f6` matches our brand" | For the brand's primary action: configure a daisyUI theme token, then use `.Color = "primary"` only when the component lists it as a variant. Use hex only through a documented CSS-color property or `.Styles`; do not assume any `.Color` property accepts it. |
| "Sub-pages don't need ModuleN= wiring" | They do. Unwired pages are silently omitted from the build. |

---

## 6. When to Reach for What

This is the practitioner-level "use X when Y" map. For the full decision matrix see `cheatsheet.md`. Quick version:

- **One primary action per screen** — `SDUI5Button` with `.Color = "primary"`, secondary uses `"neutral"` or `"ghost"`
- **Data tables** — `SDUI5Table` (paged, sortable) for ≤ 25 rows visible; `SDUI5List` for virtualized
- **Long scrolling content** — host inside `SDUI5Page` → nested `SDUI5Row` → `SDUI5Column`
- **Modal forms** — `SDUI5Form` + `SDUI5TextBox`/`SDUI5Select`/`SDUI5TextArea` → wrap in `SDUI5Modal` with Yes/No/Cancel
- **Top-level nav** — `SDUI5NavBar` (≤ 5 items) or `SDUI5Dock` (≤ 5 tabs)
- **Confirmation** — `app.ShowSwalConfirm(message)` async, never roll your own dialog
- **Toast feedback** — `app.ShowSwalSuccess / ShowSwalError / ShowSwalInfo`

---

## 7. References

- `references/rules-enforcer.md` — concrete L1–L5 rules citing this doctrine
- `references/design-tokens.md` — the available semantic tokens
- `references/creative-director.md` — how to choose theme/palette per project
- `references/component-manifest.md` — every component + status (Demonstrated / Documented-only) + verified demos
- `references/page-architectures.md` — proven page composition patterns
- `references/negative-knowledge.md` — anti-hallucination rules
