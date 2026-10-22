---
name: creative-director
description: Pre-build design reasoning for SithasoDaisy5 web apps. Brand mood, density selection, palette assignment, 4-state coverage, and Definition-of-Design-Done. Cite the chosen theme + density + primary CTA in your reasoning trace.
---

# SithasoDaisy5 Creative Director

The **Stage 3** of the agentic workflow. Before you write any component, commit to a design direction by answering the questions below. Cite your answers in the reasoning trace so the orchestrator can audit.

---

## 1. The 5 Design Decisions

Every screen needs an answer to each of these:

1. **What is the user trying to do here?** (one sentence)
2. **What is the density?** (Comfortable / High / Hero)
3. **Which theme + primary CTA color?** (one token each)
4. **What's the 4-state story?** (Loading / Populated / Empty / Error — at least one explicit treatment)
5. **What page model from `page-architectures.md` does this map to?** (ARCH-01 through ARCH-N)

Skip any and the orchestrator flags it.

---

## 2. User Intent → Density

Match density to the task, not to aesthetics:

| User intent | Density | Why |
|---|---|---|
| **Form input** (login, settings, checkout, data entry) | **Comfortable** | Generous spacing reduces input errors |
| **Dashboard / data browsing** (analytics, KPI grid, lists) | **High** | More rows visible = more insight per scroll |
| **Landing / marketing** (hero, features, pricing) | **Hero** | Big visuals, big CTAs, big whitespace |
| **Documentation / help** | **Comfortable** | Reading flow benefits from whitespace |
| **Chat / messaging** | **High** | Thread density = context density |

### Density token mapping

**Comfortable**:
- Padding: `p-6`, `p-8`, `gap-6`
- Component size: `md` (default), `lg` for primary CTAs
- Type scale: `text-base` body, `text-xl`/`text-2xl` headings
- Vertical rhythm: section breaks via `SDUI5Divider` with `py-8`

**High**:
- Padding: `p-3`, `p-4`, `gap-2`, `gap-3`
- Component size: `sm` for rows, `md` for CTAs
- Type scale: `text-sm` body, `text-lg`/`text-xl` headings
- Row height: ~32-40px (daisyUI `table` / `list` defaults)

**Hero**:
- Padding: `p-12`, `py-24`, `gap-12`
- Component size: `xl` for primary CTA, `lg` for secondary
- Type scale: `text-2xl`+ body, `text-5xl`+ hero title
- Generous whitespace, single primary focus per viewport

---

## 3. Theme + Primary Color Selection

Pick a theme first, then assign semantic roles:

### Step A: Pick the theme mood

| Mood | Theme candidates |
|---|---|
| **Professional / serious** | `THEME_LIGHT`, `THEME_CORPORATE`, `THEME_BUSINESS` |
| **Friendly / approachable** | `THEME_CUPCAKE`, `THEME_PASTEL`, `THEME_LEMONADE`, `THEME_WINTER` |
| **Techy / developer** | `THEME_DARK`, `THEME_NIGHT`, `THEME_SYNTHWAVE`, `THEME_DRACULA` |
| **Energetic / youthful** | `THEME_VALENTINE`, `THEME_HALLOWEEN`, `THEME_CARNIVAL`, `THEME_CMYK` |
| **Calm / focused** | `THEME_NORD`, `THEME_DIM`, `THEME_COFFEE`, `THEME_LOFI` |
| **Premium / luxe** | `THEME_LUXURY`, `THEME_ABYSS`, `THEME_SILK` |

Default to **light** unless the user explicitly wants dark. Use `THEME_CORPORATE` if unsure.
### Step B: Confirm primary CTA color

DaisyUI's default primary works for most themes. Override only if:

- The brand has a specific color identity → **author a custom theme**: define the palette with daisyUI CSS vars in the app stylesheet and activate with `app.SetTheme("<custom>")` (see `design-tokens.md` §6). Do NOT inject the brand hex onto each component.
- Hex for accents/decorative elements only → `.Classes`/`.Styles`/component color props (never `.Color`).
- You want to use a non-default accent (e.g., emerald in healthcare UI).

**Verify with the theme first**. Most themes are designed with their own color palette; overriding `primary` fights the theme.

### Step C: Apply the theme

```b4j
Sub BANano_Ready
    app.Initialize(Me)
    app.SetTheme(app.THEME_NORD)   ' one line, applies everywhere
End Sub
```

Provide a theme-switcher in settings if you want to demonstrate multi-theme support.

---

## 4. The 4-State Story (Mandatory for Data-Driven Screens)

Every screen that fetches, computes, or waits for data **MUST** implement all four states explicitly:

| State | Component pattern | Example trigger |
|---|---|---|
| **Loading** | `SDUI5Loading` (spinner) or `SDUI5Skeleton` (shimmer) | Initial page load, fetch in progress |
| **Populated** | Real content | Data arrived, non-empty |
| **Empty** | `SDUI5Text` empty-state message with an optional `SDUI5Button` action | Data arrived, zero rows |
| **Error** | `SDUI5Alert` (Color="error") with retry button OR `app.ShowSwalError(...)` | Fetch failed, exception caught |

State machine in code:

```b4j
Sub Show
    app = pgIndex.App
    BANano.Await(app.ClearPageView)
    ' ...mount container + rows + columns...
    
    loading1.Visible = True
    table1.Visible = False
    alert1.Visible = False
    empty1.Visible = False
    
    pgIndex.UpdateTitle("...")
    LoadData
End Sub

Sub LoadData
    Try
        Dim data As List = app.PBCollection("products").GetList()
        If data.Size = 0 Then
            loading1.Visible = False
            empty1.Visible = True
            Return
        End If
        loading1.Visible = False
        table1.Visible = True
        table1.SetItems(data)
    Catch
        loading1.Visible = False
        alert1.Visible = True
        alert1.Text = LastException.Message
    End Try
End Sub
```

**L4 hard gate**: any data-driven view missing the Empty or Error state fails `verify-conformance.ps1`.

---

## 5. Page Model Selection

Pick one from `page-architectures.md` before composing. Default decision tree:

```
Is the screen primarily data display (tables, lists, KPIs)?
  → ARCH-03 Dashboard / ARCH-05 List-Detail
Does the screen have form fields?
  → ARCH-04 Form (or ARCH-02 Auth if it's login/signup)
Is the screen a marketing landing?
  → ARCH-01 Landing
Is the screen multi-step input?
  → ARCH-07 Wizard
Is the screen real-time / chat?
  → ARCH-08 Chat
Is the screen settings / preferences?
  → ARCH-09 Settings
```

If your screen doesn't fit any, justify the new pattern in the reasoning trace.

---

## 6. Component Selection Cheat

For common UI patterns:

| Need | Use | Avoid |
|---|---|---|
| Single primary action | `SDUI5Button` with `.Color = "primary"`, `.Size = "lg"` | Multiple primary CTAs on one screen |
| Secondary action | `SDUI5Button` with `.Color = "neutral"` or `"ghost"` | Yet another primary |
| Text input | `SDUI5TextBox` (single line) or `SDUI5TextArea` (multi-line) | Custom-styled raw inputs |
| Choice between options | `SDUI5Radio` group or `SDUI5Select` (≥ 5 options) or `SDUI5Toggle` (boolean) | Multiple `SDUI5CheckBox` where one answer is required |
| Confirmation dialog | `app.ShowSwalConfirm(message)` async | Custom modal for one yes/no |
| Toast feedback | `app.ShowSwalSuccess(...)` etc. | `SDUI5Alert` for transient feedback (use it for in-page persistent alerts) |
| Long content list | `SDUI5List` (virtualized) | Unbounded `SDUI5Card` stacking |
| Data table | `SDUI5Table` (≤ 25 visible rows, with pagination) | Custom grid layout |

---

## 7. Layout Direction (LTR / RTL)

daisyUI supports RTL. If your app needs RTL:

```b4j
SDUI5Container1.Classes = "mx-auto"  ' LTR auto-center
SDUI5Container1.Classes = "mr-auto"  ' RTL right-align
```

Or set `<html dir="rtl">` to flip everything. The framework respects it.

---

## 8. Accessibility Decisions (Web-Specific)

- Every interactive element needs keyboard nav (use `<button>` / `<input>` not `<div onclick>` — SDUI5 emits these).
- Focus rings: leave daisyUI's `:focus-visible` ring on; don't override it.
- Icons paired with text: still need `aria-label` for screen readers.
- Color contrast: semantic token pairings are AA-compliant by default. Custom overrides need verification (use a contrast checker).

---

## 9. Anti-Patterns (Creative Director Red Flags)

| Thought | Reality |
|---|---|
| "This app needs a custom color: `#FF6B35`" | Choose the channel by property contract: brand-wide primary → define a daisyUI theme token; a semantic variant property → use its listed token; a decorative or library color → use the documented CSS-color property or `.Styles`. Never assume a hex value works in every `.Color` property. |
| "I'll use the same color (`primary`) for success and info" | Pick `success` for confirmed, `info` for informational — different semantics. |
| "Buttons should all be the same size for consistency" | No. Primary CTA = `lg`. Secondary = `md`. Tertiary = `sm`. Size communicates priority. |
| "I'll add a header with the company logo, then another with section title, then a sub-header..." | One navbar, one page title (in `pgIndex.UpdateTitle`), no more. |
| "Let me add a card with a card inside a card inside a card" | One level of nesting visible to the user. Group internally with `<fieldset>` (`SDUI5FieldSet`). |
| "This screen needs all 35 themes available as a dropdown" | No. Pick one theme for the app. Show the theme picker in settings at most. |

---

## 10. Reasoning Trace Template (paste into your thinking)

```
Intent: <one-sentence user goal>
Density: Comfortable | High | Hero
Theme: app.THEME_<X>
Primary CTA color: "primary" | custom
Semantic roles:
  primary = <reason>
  error = <reason>
  ... etc
Page model: ARCH-<N> from page-architectures.md
4-state plan: Loading=<comp>, Populated=<comp>, Empty=<comp>, Error=<comp>
Components used: <list with status: Demonstrated | Documented-only>
DaisyUI/Tailwind classes: <list>
Use copyable, verified excerpts and source links in the relevant component skills as code evidence; do not cite placeholder page names or line numbers.
```
