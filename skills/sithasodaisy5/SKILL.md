---
name: sithasodaisy5
description: SithasoDaisy5 — B4J/BANano component library (daisyUI + Tailwind) transpiled to JS. Use when building web apps/UIs with SithasoDaisy5 components in B4J/BANano, when you need a component's designer properties, events, setters, emitted daisyUI classes, or the app scaffold (SDUI5App), theme system, UsesX lazy-loaders, or the SDUI5Component skeleton contract. Produces B4J `.bas` code that calls the framework; never raw HTML.
metadata:
  category: domain
  triggers: sithasodaisy5, sdui5, sdui5 component, b4j component, banano, b4j web app, daisyui native, component recipe, sd5 theme, uses loader
---

# SithasoDaisy5

**Kind**: B4J/BANano UI framework (transpiles to JS) | **UI components**: 142 | **Support modules**: 20
**Source**: [SithasoDaisy5 GitHub repository](https://github.com/Mashiane/SithasoDaisy5) (local checkout: `C:\b4j\workspace\0SithasoDaisy5`) | **Last refreshed**: 2026-11-10

## How to Use This Skill

- **Without arguments** — load the core mental model + skeleton contract below.
- **With a component name** — ask `SDUI5Button` or `modal`; I read `components/<Name>.md` and answer props/events/setters/emitted-classes/usage.
- **With a goal** — "build a login form", "make a dashboard"; I compose components per `patterns.md`.
- **Browse** — "which components do X?" → I use the component index in [references/component-index.md](references/component-index.md).
- **Need one section of a large doc?** Run `python scripts/component_sections.py <Name> --list`, then `--get "<section>"`. The compact [component summary](references/component-summary.json) has status, counts, and descriptions.

For every new screen, or a screen whose visual direction is changing, consult:
1. **[Design Craft Guide](references/design-craft-guide.md)** — Mandatory typography pairings, surface elevation, glassmorphism, Bento grid composition, accent rarity, and micro-interactions.
2. **[Layout Mechanics](references/layout-mechanics.md)** — The 3 Golden Layout Rules (Anti-Scrollbar, Boundary Container, and Column-Child Override), Dual-Mode Ergonomics, and Bento Grids.
3. **[4-State UI Recipes](references/state-recipes.md)** — Copy-ready B4J patterns for Loading Skeletons, Populated, Illustrated Empty, and Error recovery states.
4. **[Scenario Blueprints](chapters/)** — Canonical B4J layout recipes:
   [dashboards](chapters/ch01-dashboards.md), [interactive forms](chapters/ch02-interactive-forms.md), [navigation](chapters/ch03-navigation.md),
   [feedback](chapters/ch04-feedback.md), [media cards](chapters/ch05-media-cards.md), [data display](chapters/ch06-data-display.md),
   [recipe crosswalk](chapters/ch07-recipes.md).
   The crosswalk adapts 20 DaisyUI MCP recipes into SDUI5 guidance with accessibility notes and provenance; it is not raw HTML.
5. **[Design Quality Playbook](references/design-quality-playbook.md)** — The Creative Brief and rendered quality bar (G6 release gate). API conformance alone is not a visual-quality pass.
6. **[Navigation & State](references/navigation-and-state.md)** — Page vs modal vs overlay, history and Back rules, state ownership by lifetime, and refresh behaviour. Consult whenever adding pages, dialogs, wizards, auth or onboarding flows.

When the task is to review, polish, or audit a screen that already exists, load **[Anti-Slop Review](references/anti-slop.md)** instead of the whole design stack. It caps findings at three, keeps audit separate from fixing, and blocks redesign disguised as polish.

When you ask about a component not in Core below, I read its `components/<Name>.md` before answering. Per-component files are **on-demand** — they don't cost tokens until loaded.

---

## Core Mental Model

SithasoDaisy5 is a **daisyUI + Tailwind** wrapper shipped as a B4J `.b4xlib`. You write B4J classes (`.bas`); BANano transpiles them to JS at build (`BANano.BuildAsB4xlib` in `SithasoDaisy5.b4j`). The runtime is the browser. **Output is B4J/BANano code that drives the framework — never raw HTML.**

### The Skeleton Contract (every component shares this)

```
Initialize(Callback, Name, EventName)   ' sets mCallBack/mName/mEventName, UI.Initialize(Me), SetDefaults
ParentID (property / setParentID)        ' attach point in the DOM
AddComponent                             ' resolves "#ParentID" then calls DesignerCreateView internally — THE app-facing mount call
DesignerCreateView(Target, Props)        ' INTERNAL — parse CustProps → push daisyUI classes via UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT → append [BANCLEAN]<tag id="{name}">… → UI.OnEvent. Never call from app code.
setX(value) / getX                       ' live DOM mutation via UI.*ByID("{name}_child")
Remove()                                 ' mElement.remove + BANano.SetMeToNull
```

**To use a component** (the only app pattern; every demo page does this):
```b4x
Dim x As SDUI5X
x.Initialize(Me, "x", "x")
x.ParentID = "host"
x.Text = "..."                 ' properties before AddComponent are baked in via CustProps
BANano.Await(x.AddComponent)   ' DesignerCreateView runs internally
```
Setters after `AddComponent` mutate the live DOM. Wire events as `Sub x_click(e As BANanoEvent)`
(handler = `${mEventName}_<event>`). Never call `DesignerCreateView` from app code.

### The Three Layers

1. **modSD5.bas** — static helpers (`CStr`, `CInt`, `CleanID`, `Val`, `PadRight`), `ColorMap`, `Months`/`Days`/`Countries`/`Languages`, global `#if css` (scrollbar-gutter, `.input-group`, `.flatpickr-wrapper`).
2. **UIShared (external, `C:\b4j\shared\UIShared`)** — the DOM engine every component holds as `Public UI As UIShared`. All `UI.AddClassDT/BuildExClass/SetColor/OnEvent/LoadAssetsOnDemand` route here. Single source of truth for class/style/attr assembly.
3. **SDUI5App.bas** — app shell: `#body`, loader, color/month/day maps, online/offline and dark-mode listeners, toasts, Swal wrappers, drawer helpers, and 35+ daisyUI theme constants.
   Theme application is host-owned: `html data-theme=` is set by the page/user, never by app code (RULE-THEME-001).
   `UsesX` lazy-loaders (`UsesPocketBase`, `UsesExcel`, `UsesQuill`, `UsesLeaflet`, `UsesDatePicker`, `UsesKanBan`, `UsesSignaturePad`, `UsesQRCode`, `UsesVideoAudioPlayer`, `UsesOfficeRibbon`, ...) call `UI.LoadAssetsOnDemand`.

### Styling Strategy

Output uses daisyUI component classes (`btn`, `card`, `modal`, `alert`, `tabs`, `menu`, `drawer`, `badge`, `stats`, `timeline`, `hero`, `navbar`, `carousel`, `skeleton`, `tooltip`, ...), Tailwind utilities, and responsive prefixes (`lg:`/`md:`/`sm:`/`xl:`).
All classes are generated from B4J designer properties and the `CustProps` map. No custom CSS.

#### Styling rules (canonical)

Use designer properties first; reserve `.Classes` for responsive, animation and flex/grid tokens.
Size and elevation values are suffix-only because the framework prepends the utility prefix.

| Property | Correct values | Never |
|---|---|---|
| `Width` | `"full"`, `"64"`, `"screen"` | `"w-full"` |
| `Height` | `"64"`, `"full"`, `"screen"` | `"h-64"` |
| `Shadow` | `"md"`, `"lg"`, `"shadow"` | `"shadow-md"` |
| `Rounded` | `"box"`, `"lg"`, `"rounded-full"` | `"rounded-box"` |

Full rule: [RULE-PROP-001 and RULE-PROP-002](references/rules-enforcer.md#rule-prop-001).
Assign `.Classes`, `.Styles`, `.Attributes` in B4J code (never `Raw*`).
Base spacing/positioning use compact DSL strings (`MarginAXYTBLR = "b=4"`, `Position = "t=0; r=0"`):
see [base-properties-dsl.md](references/base-properties-dsl.md).
Never call capital `Set*` methods; assign `.Property = value`.
`SDUI5Button` uses `.Shape`, not `.Rounded`.

### Theming

Theme selection is host-owned: the page or user sets `html data-theme=`. Apps must not activate a theme; use semantic tokens so the app works under any active theme.
Rule: [RULE-THEME-001](references/rules-enforcer.md#rule-theme-001). Theme constants (`THEME_*`) exist for reference only; do not apply one.
Colors: `COLOR_PRIMARY/SECONDARY/ACCENT/NEUTRAL/INFO/SUCCESS/WARNING/ERROR/GHOST` plus palette (`COLOR_EMERALD`, `COLOR_SKY`, `COLOR_ROSE`, …) with `INTENSITY_50…900`.
Color properties are component-specific; use the exact Designer Properties list and [color channel guide](references/design-tokens.md#11-color-channels) before assigning a value.

### Asset Registration

External JS/CSS lives in `Files/` (251 assets) and is registered in `SithasoDaisy5.b4j` via `BANano.Header.AddJavascriptFile[ForLater]` / `AddCSSFile[ForLater]`. "For later" = lazy via the matching `UsesX` call in SDUI5App at runtime.

### Icon & Image Asset References (STRICT)

Every icon/image property that points under `assets/` uses the full relative path with extension:
`./assets/<name>.svg`. Bare names and extension-only values are forbidden; `SVGRenderer` fetches the
literal string as a URL, so a missing prefix or extension produces a 404.

Applies to `LeftIcon`, `RightIcon`, `Image`, `RightImage`, and any asset-path property.
When no matching file exists, add one under `Files/` or pick an existing asset; never drop the prefix or extension.

Full rule: [RULE-ASSET-001](references/rules-enforcer.md#rule-asset-001).

### Verified Demo Usage and Source References

Every component skill carries a **Framework Source** link to its `.bas` implementation. That link is read-only:
apps consume the `.b4xlib`; do not add the raw framework `.bas` file to an app project.

Component skills also carry **Demo References** to B4J page modules where the type was detected,
plus verified code excerpts. A type match is a navigation aid, not proof of construction or behavior;
inspect the linked page before making a usage claim.

When the installed skill is not enough, open the Framework Source and the linked demo page.
For page reproduction, read the whole module and trace its helpers, shell, assets, and data.
Treat the repository as source evidence; keep the app-facing API grounded in the component skill.

- **Reproduce a component pattern:** use its code block and preserve the demonstrated setup order, `BANano.Await` boundaries, event signatures, and source-specific member names.
- **Create a new app:** use the app/page scaffold and compose from the component skills. Architecture diagrams express design intent; they are not copy-ready B4J or evidence that a demo implements the exact layout.
- A demo page name is evidence only when its source excerpt actually demonstrates the claimed usage. A type declaration or text match alone does not prove a property, event, or behavior.
- If the demo source depends on an unavailable helper module, keep that dependency explicit and do not claim the example builds independently.

### Sourcing Icons (Iconify, MIT/free only)

When an app needs an icon not already in `assets/`, source it from **Iconify** (https://iconify.design)
or **Iconstack** (https://iconstack.io), preferring the **Tabler** set (`tabler` prefix, MIT).
Iconstack aggregates 50,000+ icons from 21 MIT-licensed libraries and exposes a search API + MCP.
Workflow:
1. Search Iconify (e.g. `https://api.iconify.design/search?query=mail&prefix=tabler`) or Iconstack (https://iconstack.io) or browse the Tabler repo (https://github.com/tabler/tabler-icons/tree/master/icons).
2. **Check the collection's license before adding** — only use sets licensed **MIT** or otherwise completely free for commercial use (Tabler is MIT). Reject sets with restrictive/non-commercial licenses.
3. Download the SVG into the app's `Files/` folder (BANano publishes `Files/` → `assets/` at build time, so dropping it in `Files/` alone is enough; you may also copy it to the published `assets/` folder to verify), e.g. `https://api.iconify.design/tabler/mail.svg` → `Files/mail.svg`.
4. Reference the local file with its extension and the `./assets/` prefix in code: `LeftIcon = "./assets/mail.svg"`. Never hotlink the Iconify URL at runtime — always ship the SVG locally.

---

### Defaults (RULE-DEFAULTS-001)

`Initialize` applies `SetDefaults`; designer defaults are tuned for standalone canvas drops.
Before composing, audit [component-default-setters.md](references/component-default-setters.md) and explicitly override:

- width when a card or wizard sits in a column (`.Width = "full"`);
- border, surface color, and direction required by the prompt;
- placeholder options in `SDUI5Select` and `SDUI5RadioGroup`.

Full rule: [RULE-DEFAULTS-001](references/rules-enforcer.md#rule-defaults-001).
Silent text/structure defaults (Card "Card Content", Divider "Divider", Tabs "<Tab> Content", FieldSet 320px, Timeline joins off, soft alerts): [component-default-traps.md](references/component-default-traps.md).
Container-context overrides: [context-aware-defaults.md](references/context-aware-defaults.md).

## Component Index

The full inventory lives in [references/component-index.md](references/component-index.md):
142 UI classes, 20 support modules, and the prop-to-component topic index.
Load it only when discovering or comparing components; per-component API files stay on demand.

| Component | Props | Events | Typical use |
|---|---:|---:|---|
| SDUI5Container | 40 | 0 | page host, sections |
| SDUI5Row | 38 | 0 | 12-column grid |
| SDUI5Column | 44 | 0 | grid cell |
| SDUI5Card | 47 | 0 | content surface |
| SDUI5Button | 74 | 1 | actions |
| SDUI5Text | 46 | 6 | headings and copy |
| SDUI5TextBox | 66 | 7 | text input |
| SDUI5Select | 42 | 3 | option input |
| SDUI5Table | 96 | 50 | data grid |
| SDUI5Modal | 59 | 7 | dialogs |
| SDUI5NavBar | 50 | 9 | app chrome |
| SDUI5Hero | 31 | 0 | landing header |
| SDUI5Stat | 21 | 0 | KPI row |

Everything else: [component-index.md](references/component-index.md).

## Supporting Files

- [patterns.md](patterns.md) — composition patterns: AddComponent/parentID chain, event wiring, forms, drawers, tabs, lists, responsive sizing
- [cheatsheet.md](cheatsheet.md) — decision rules: pick component X when Y, color/size constants, theme list, asset registration
- [glossary.md](glossary.md) — UIShared API surface, BANano transpile terms, CustProps, DesignerProperty
- [references/component-index.md](references/component-index.md) — full inventory: 142 UI classes, 20 support modules, prop-to-component topic index (on demand)
- [references/base-properties-dsl.md](references/base-properties-dsl.md) — base designer properties (PositionStyle, Position, Margin/PaddingAXYTBLR, Classes, Styles, Attributes), compact DSL syntax, and Raw* code mapping
- [references/external-source-protocol.md](references/external-source-protocol.md) — upstream docs precedence, citations, and conflict rules
- [references/framework-drift.md](references/framework-drift.md) — detect, classify, and refresh registry/provenance drift
- [references/operating-principles.md](references/operating-principles.md) — canonical 7 truth-and-accuracy rules
- [references/app-scaffolds.md](references/app-scaffolds.md) — app shell templates (§1a `.b4j` + §1b Files bundle)
- [references/design-intelligence.md](references/design-intelligence.md) — framework-agnostic decision doctrine (DI-*): hierarchy, density, disclosure, ergonomics, anti-cargo-cult; shared-source with B4XDaisyUIKit-Skills
- [references/prompt-contracts.md](references/prompt-contracts.md) — 10 design prompt contracts (Sleek corpus) → Stage-0 screen contracts; style tiers + channel usage exemplars
- [references/design-tokens.md](references/design-tokens.md) — design token vocabulary and component-specific color contracts; §1.1 color channels, §6 themes, §14 Style Tiers
- [references/Files/](references/Files/) — 11-file asset bundle (sample images referenced by `.bas` source but NOT shipped in the b4xlib; canonical copy-source for new apps)
- [references/file-registry.b4j](references/file-registry.b4j) — matching `FileN=`/`FileGroupN=`/`NumberOfFiles` block
- [references/component-manifest.md](references/component-manifest.md) — generated inventory of registered UI/support modules + demo evidence (authority for demo-backed status)
- [references/component-provenance.json](references/component-provenance.json) — generated per-component provenance: source sha256, registry status, member lists, demo pages (authority for checksums/member lists; regen via `sd5-web-verify/scripts/generate_provenance.py`)
- [references/component-summary.json](references/component-summary.json) — compact per-component status, counts, emitted classes, demo pages, and Core Idea description (generated by `scripts/component_summary.py`).
- [references/banano-essentials.md](references/banano-essentials.md) — distilled BANano substrate facts (AppStart/BANano_Ready, ForLater assets, PWA) with page citations to `BANanoEssentialsV1.09.pdf`
- [references/framework-internals.md](references/framework-internals.md) — read-only wrapper mechanics: .b4xlib build, SDUI5Button-traced anatomy, UIShared engine, UsesX bundles, daisyUI upstream mapping, gap protocol
- [references/daisyui-mapping.md](references/daisyui-mapping.md) — study-to-wrapper record: name mapping, class-verification protocol with worked samples, upstream-skill observations

## Scope & Limits

This skill covers the 140 registered `SDUI5*` UI classes and indexes the 20 registered support modules documented under `components/`. It produces B4J/BANano `.bas` code that calls the framework, not raw HTML, React, or Vue.

**Unregistered source notes** live in `components/_unused/`. Do not call those classes from app code unless the framework project registers them in `ModuleN=`.

---

## Operating principles

Truth and accuracy rank above helpfulness. The canonical 7 rules live in
[operating-principles.md](references/operating-principles.md) and apply to every response.
