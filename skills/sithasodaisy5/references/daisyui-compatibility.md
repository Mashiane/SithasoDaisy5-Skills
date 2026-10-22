---
name: daisyui-compatibility
description: DaisyUI / Tailwind web concept → SDUI5* component mapping. Use when translating web mockups or web-trained intuition into SithasoDaisy5 B4J code. Reports partial mappings — never fabricates.
---

# DaisyUI ↔ SithasoDaisy5 Compatibility Map

When you encounter a DaisyUI web concept, here's the corresponding SDUI5* component (or a clear "no direct equivalent — report partial" note).

**Reading rule**: this table is **opinionated and source-of-truth**. If a mapping isn't here, the framework doesn't have a direct equivalent. **Don't invent a one-to-one mapping in code; report partial.**

---

## 0. Styling Channels (web-grade, all sanctioned)

When a web mockup needs expressiveness beyond tokens, use these framework channels — none require raw HTML:

| Web concept | Channel |
|---|---|
| Inline style (any CSS) | `.Styles = "background: linear-gradient(...)"` — base-class channel, never blocked |
| Tailwind arbitrary values | `.Classes = "bg-[#FF6B35] text-[12px] shadow-[0_0_20px_rgba(0,0,0,.3)]"` |
| Gradient surface | `GradientActive` + `Gradient` (8 orientations) + `GradientColor1/2` on `SDUI5BankCard`, `SDUI5BasicLabel`, `SDUI5Container`, `SDUI5NavBar`, `SDUI5Page` |
| Chart colors / decorative fills | Component CSS-string color props: `SDUI5TrendChart.ShapeColor`, `.AreaColor`, `.ShapeColorX`, etc. |
| Custom brand theme | daisyUI CSS vars in app stylesheet + `app.SetTheme("<custom>")`; class-based theming via `app.AddTheme` / `app.ApplyTheme` |
| Fonts / global CSS | App stylesheet, or `UI.LoadAssetsOnDemand(key, items)` at app start |
| Frosted glass | `.Style = "glass"` on `SDUI5Card`, or component-agnostic `glass` modifier |

Prefer tokens on themed components (theme switching keeps working); use these channels for brand hex, accents, and expressive styles.

---

## 0.1 Component Discovery Protocol (always, before Stage 4)

1. **Identify function, behavior, and layout** in the request — not just the exact words ("deletion needs a confirm" may never say the word modal).
2. **Shortlist candidates** from this map + the semantic selection layer below (§0.2).
3. **Read the guides** — `components/<Name>.md` for each shortlisted component.
4. **Compare** description, behavior, API, and rules of each candidate against the request.
5. **Select** the best component or combination; obey all its constraints.
6. **Match the meaning even when the words differ.** A component with a different name can still be the best match.

If the user names a component and its guide exists, read that guide first.

## 0.2 Semantic Selection Layer (intent → pattern → role → component)

Translate user intent into an interaction pattern, then a semantic UI role, then the component. Never map request nouns directly to component names.

| User intent | Interaction pattern | Semantic role | SDUI5 component(s) |
|---|---|---|---|
| "User must confirm deletion" | Destructive confirmation | Modal confirm | `app.ShowSwalConfirm` / `SDUI5Swal` |
| "Switch between 3 major sections" | Persistent top-level nav | Bottom navigation | `SDUI5Dock` |
| "Show progress of a multi-step task" | Sequence indicator | Steps | `SDUI5Steps` |
| "Browse a large collection" | Paged/virtualized data grid | Data list | `SDUI5Table` / `SDUI5List` |
| "User must pick one of ≤5 options" | Exclusive choice | Radio group / segment | `SDUI5RadioGroup` / `SDUI5Segment` |
| "User must pick one of many" | Selection from set | Select | `SDUI5Select` / `SDUI5MultiSelect` |
| "Notify without interrupting" | Transient feedback | Toast | `app.ShowSwalSuccess/Info/...` |
| "Show detail for a selected row" | Master-detail | List + detail page | ARCH-05, `SDUI5List` + detail page |
| "Collect 6+ related inputs" | Grouped form | Form sections | `SDUI5Form` + `SDUI5FieldSet` (≤7/group) |
| "Highlight one key number" | KPI display | Stat | `SDUI5Stat` + `SDUI5StatItem` |
| "Show status of a record" | State badge | Status chip | `SDUI5Badge` / `SDUI5Status` |
| "Route through the day's events" | Chronological list | Timeline | `SDUI5Timeline` + `SDUI5TimelineItem` |
| "Promote one primary action on mobile" | Floating persistent action | FAB | `SDUI5Fab` / `SDUI5SpeedDial` |
| "Swap two states in place" | Toggle content | Swap | `SDUI5Swap` / `SDUI5Toggle` |
| "Compare two versions" | Side-by-side diff | Diff viewer | `SDUI5Diff` |

Add rows as new intents appear; a row here plus a demo beats an invented API (RULE-MOUNT-002).

---

## 1. Layout Primitives

| Web concept | daisyUI class | SDUI5 component | Notes |
|---|---|---|---|
| Page root | `<body>` + daisyUI theme | `SDUI5Container1` + `app.PageView` | Framework owns `<body>` |
| Top-level container | `<div class="container">` | `SDUI5Container` | One per page |
| Flex row | `<div class="flex">` | `SDUI5Row` | Use `.GridCols` for grid instead |
| Grid (column layout) | `<div class="grid grid-cols-3">` | `SDUI5Row` with `.GridColsMd="3"` | Built-in responsive grid |
| Grid column | `<div class="col-span-6">` | `SDUI5Column` with `.SizeMd="6"` | Children of `SDUI5Row` |
| Center vertically/horizontally | `flex items-center justify-center` | `.Classes = "flex items-center justify-center min-h-screen"` | On container or row |
| Spacer | `<div class="h-12">` | `SDUI5Spacing` with `.Size="3rem"` | Component-form spacer |
| Divider | `<hr>` or `<div class="divider">` | `SDUI5Divider` | Component with `.Dash`/`.DoubleDash` props |

---

## 2. Navigation

| Web concept | daisyUI class | SDUI5 component |
|---|---|---|
| Top navbar | `<div class="navbar">` | `SDUI5NavBar` (with `.Title`, `.BurgerClick`, `.Back`, etc.) |
| Bottom dock (mobile) | `<div class="dock">` | `SDUI5Dock` (with `.AddHomeTab`, `.AddSearchTab`, `.ActiveTab`) |
| Bottom nav tabs | `<div class="btm-nav">` | `SDUI5BottomNavigation` (`.Change` event) |
| Side drawer | `<div class="drawer">` | `SDUI5Drawer` (`.Opened` event) |
| Side menu | `<ul class="menu">` | `SDUI5Menu` (`.ItemClick`, `.Change`) |
| Breadcrumbs | `<div class="breadcrumbs">` | `SDUI5BreadCrumbs` |
| Tabs (content switcher) | `<div class="tabs">` | `SDUI5Tabs` (`.Change`) |
| Segmented control | `<div class="tabs tabs-box">` | `SDUI5Segment` |
| Steps / wizard | `<ul class="steps">` | `SDUI5Steps` (`.Change`) |
| Pagination | `<div class="join">` + buttons | no dedicated component — build with `SDUI5Join` + `SDUI5Button`s |

**Rule of thumb** (Hick): top-level nav ≤ 5 items. Overflow goes in a `SDUI5Menu`.

---

## 3. Data Display

| Web concept | daisyUI class | SDUI5 component |
|---|---|---|
| Card | `<div class="card">` | `SDUI5Card` |
| Card with image | `<div class="card image-full">` | `SDUI5Card` with `.ImageFull=True` |
| Stat tile | `<div class="stats">` | `SDUI5Stat` (with `SDUI5StatItem` children) |
| Table | `<table class="table">` | `SDUI5Table` (paged, sortable) |
| Virtual list | `<ul class="list">` (long) | `SDUI5List` (virtualized) |
| List item | `<li>` in `.list` | `SDUI5ListItem` |
| Description list | `<dl>` | `SDUI5DescriptionList` (if exists) — else build with `SDUI5Card` + `SDUI5Text` |
| Accordion | `<div class="collapse">` | `SDUI5Collapse` |
| Accordion (multiple) | `<div class="join join-vertical">` with multiple collapses | `SDUI5Accordion` |
| Timeline | `<ul class="timeline">` | `SDUI5Timeline` + `SDUI5TimelineItem` |
| Tree view | (no daisyUI equivalent) | `SDUI5TreeView` |

---

## 4. Forms

| Web concept | daisyUI class | SDUI5 component |
|---|---|---|
| Text input | `<input class="input">` | `SDUI5TextBox` |
| Textarea | `<textarea class="textarea">` | `SDUI5TextBox` or `SDUI5TextArea` |
| Select | `<select class="select">` | `SDUI5Select` (single) or `SDUI5MultiSelect` (multi) |
| Checkbox | `<input type="checkbox">` | `SDUI5CheckBox` |
| Radio | `<input type="radio">` | `SDUI5Radio` (use `SDUI5RadioGroup` for multiple in one group) |
| Toggle/switch | `<input type="checkbox" class="toggle">` | `SDUI5Toggle` |
| Range slider | `<input type="range" class="range">` | `SDUI5Range` (or `SDUI5NoUISlider` for advanced) |
| File input | `<input type="file" class="file-input">` | `SDUI5FileInput` |
| Color picker | `<input type="color">` | `SDUI5FAIconPicker` (FontAwesome-based) or no direct equivalent |
| Date input | `<input type="date">` | `SDUI5DatePickerTimeLine` |
| Time input | `<input type="time">` | `SDUI5DatePickerTimeLine` |
| OTP / PIN | (no daisyUI equivalent — custom) | `SDUI5OTP` |
| Rating | (no daisyUI equivalent) | `SDUI5Rating` |
| Form group | `<fieldset class="fieldset">` | `SDUI5FieldSet` (with `.Legend`, `.Items`, `.Checked`) |
| Form wrapper | `<form class="form">` | `SDUI5Form` (with `.Submit` event) |
| Label | `<label class="label">` | `SDUI5Label` / `SDUI5BasicLabel` (registered variants) |

---

## 5. Feedback & Overlays

| Web concept | daisyUI class | SDUI5 component |
|---|---|---|
| Modal | `<dialog class="modal">` | `SDUI5Modal` (`.Yes_Click`, `.No_Click`, `.Cancel_Click`) |
| Bottom sheet | `<dialog class="modal modal-bottom">` | `SDUI5BottomDrawer` |
| Drawer modal | `<dialog class="drawer">` | `SDUI5BottomDrawer` |
| SweetAlert (confirm) | `sweetalert2` | `app.ShowSwalConfirm(message)` — async |
| SweetAlert (input) | `sweetalert2 input` | `app.ShowSwalInput(...)` — async |
| Alert banner | `<div class="alert">` | `SDUI5Alert` (`.Color`, `.Soft`, `.Outline`, `.Dash`) |
| Toast | `<div class="toast">` | `app.ShowSwalSuccess / ShowSwalError / ShowSwalInfo / ShowSwalWarn` |
| Tooltip | `<div class="tooltip">` | `SDUI5ToolTip` (`.Placement`, `.Trigger`, `.AlwaysVisible`) |
| Popover | `<div class="popover">` | `SDUI5ToolTip` + `.Trigger="focus"` (closest equivalent) |
| Skeleton | `<div class="skeleton">` | `SDUI5Skeleton` |
| Loading spinner | `<span class="loading loading-spinner">` | `SDUI5Loading` |
| Empty state | (no daisyUI equivalent) | `SDUI5Text` with optional `SDUI5Button` action; use only properties listed in those component references |

---

## 6. Buttons

| Web concept | daisyUI class | SDUI5 component |
|---|---|---|
| Primary button | `<button class="btn btn-primary">` | `SDUI5Button` with `.Color="primary"` |
| Secondary button | `<button class="btn btn-secondary">` | `SDUI5Button` with `.Color="secondary"` |
| Accent | `<button class="btn btn-accent">` | `SDUI5Button` with `.Color="accent"` |
| Ghost | `<button class="btn btn-ghost">` | `SDUI5Button` with `.Style="ghost"` |
| Outline | `<button class="btn btn-outline">` | `SDUI5Button` with `.Style="outline"` |
| Soft | `<button class="btn btn-soft">` | `SDUI5Button` with `.Style="soft"` |
| Dash | `<button class="btn btn-dash">` | `SDUI5Button` with `.Style="dash"` |
| Icon-only circle | `<button class="btn btn-circle">` | `SDUI5Button` with `.Shape="circle"`, `.ButtonIcon=True` |
| Block / full-width | `<button class="btn btn-block">` | `SDUI5Button` with `.Block=True` |
| Floating action | `<button class="btn btn-circle btn-primary fixed bottom-4 right-4">` | `SDUI5FAB` |
| Speed dial (radial menu) | (no daisyUI equivalent) | `SDUI5SpeedDial` |
| Square button | `<button class="btn btn-square">` | `SDUI5Button` with `.Shape="square"` |

---

## 7. Avatars & Identity

| Web concept | daisyUI class | SDUI5 component |
|---|---|---|
| Avatar | `<div class="avatar">` | `SDUI5Avatar` |
| Avatar shape (mask) | `<div class="avatar mask mask-squircle">` | `SDUI5Avatar` with `.Mask="squircle"` |
| Avatar with status | `<div class="avatar online">` | `SDUI5Avatar` with `.Status="online"` |
| Avatar group | `<div class="avatar-group">` | `SDUI5AvatarGroup` |
| Badge / chip | `<span class="badge">` | `SDUI5Badge` |
| Indicator (notification dot) | `<span class="indicator-item badge">` | `SDUI5Indicator` |
| Swap (theme toggle) | `<label class="swap">` | `SDUI5Swap` |

---

## 8. Charts & Media

| Web concept | SDUI5 component |
|---|---|
| Chart (any kind) | `SDUI5ToastChart` (toast-sized), `SDUI5TrendChart` (sparkline), `SDUI5GenderChart` (demographic) |
| Hero section | `SDUI5Hero` |
| Carousel/slider | `SDUI5Swiper` + `SDUI5SwiperSlide` |
| Image gallery (hover) | `SDUI5HoverGallery` |
| Image (responsive) | `SDUI5Image` |
| Glow/aura effect | `SDUI5Aura` |
| 3D hover card | `SDUI5Hover3D` |
| Browser mockup | `SDUI5Browser` |
| Phone mockup | `SDUI5Phone` |
| Window mockup | `SDUI5Window` |
| Code block with copy | `SDUI5Code` |
| Lottie animation | `SDUI5LottiePlayer` |
| Video player | `SDUI5VideoPlayer` |
| PDF viewer | `SDUI5PDFViewer` |
| QR code | `SDUI5QRCode` |
| Barcode | `SDUI5BarCode` |
| Barcode reader (camera) | `SDUI5BarcodeReader` |
| Leaflet map | `SDUI5Leaflet` |
| Signature pad | `SDUI5SignaturePad` |
| Google ads | `SDUI5GoogleAdSense` |

---

## 9. Special-Purpose Components (no direct web equivalent)

| Component | What it does |
|---|---|
| `SDUI5App` | Singleton app shell (themes, listeners, helpers) |
| `SDUI5Component` | Base class (don't use directly) |
| `SDUI5Container` | Page-level container |
| `SDUI5Column` | Grid column child of `SDUI5Row` |
| `SDUI5Text` | Multi-property text view |
| `SDUI5BasicLabel` | Simple label |
| `SDUI5ModalHTML` | Modal that embeds raw HTML (use sparingly) |
| `SDUI5MenuItem` | Child of `SDUI5Menu` |
| `SDUI5ListItem` | List children |
| `SDUI5CarouselItem` / `SDUI5SwiperSlide` | Carousel children |
| `SDUI5TimelineItem` / `SDUI5StepsItem` / `SDUI5StatItem` | Corresponding child classes |
| `SDUI5Form` | Form with Yes/No/Cancel actions |
| `SDUI5FAB` | Floating action button |
| `SDUI5SpeedDial` | Radial FAB menu |
| `SDUI5Diff` | Before/after image diff |
| `SDUI5Drawer` | Side drawer |
| `SDUI5DrawerUser` | User-row component for drawer |
| `SDUI5Dock` | Bottom dock |
| `SDUI5ContextMenu` | Right-click menu |
| `SDUI5Conversation` | Chat thread |
| `SDUI5ChatBubble` / `SDUI5ChatItem` | Chat primitives |
| `SDUI5Countdown` | Countdown timer |
| `SDUI5OfficeRibbon` | Office-style ribbon toolbar |
| `SDUI5Pivot` | Pivot tab control |
| `SDUI5Preferences` | Settings panel |
| `SDUI5MegaMenu` | Mega menu |
| `SDUI5Segment` | Segmented control |
| `SDUI5Sitemap` | Sitemap viewer |
| `SDUI5BottomDrawer` | Bottom drawer |
| `SDUI5BottomNavigation` | Bottom nav tabs |
| `SDUI5JsonTree` | JSON tree viewer |
| `SDUI5JsonEditor` | Full JSON editor |
| `SDUI5KanBan` | Kanban board |
| `SDUI5TreeSpider` | Tree visualization |
| `SDUI5NoUISlider` | Advanced range slider |
| `SDUI5Range` | Range slider |
| `SDUI5Rating` | Star rating |
| `SDUI5Toast` / `SDUI5MDToast` | Toast notification |
| `SDUI5Swal` | SweetAlert wrapper |
| `SDUI5FullCalendar` | Calendar with events |
| `SDUI5Pagination` | Pagination control |
| `SDUI5OTP` | OTP input |
| `SDUI5EmojiMart` / `SDUI5EmojiMart1` | Emoji picker |
| `SDUI5FAIconPicker` | FontAwesome icon picker |
| `SDUI5Link` | Link button |
| `SDUI5SVG` | SVG renderer |
| `SDUI5TextRotate` | Text rotation |
| `SDUI5Indicator` | Indicator overlay |
| `SDUI5DockColor` / `SDUI5DockXS` | Dock variants |
| `SDUI5ExcelReport` | Excel report generator |
| `SDUI5Pagination` | Pagination |
| `SDUI5SDUI5RDG` / `SDUI5RDG` | (if exists) Data grid variants |
| `SDUI5DrawerUser` | Drawer user row |
| `SDUI5Pivot` | Pivot tab |

---

## 10. Conversions Web Agents Often Get Wrong

| Web assumption | SithasoDaisy5 reality |
|---|---|
| `<button onclick="fn()">` | `SDUI5Button` with `.Click` event → `Sub SDUI5Button1_Click(e As BANanoEvent)` |
| `addEventListener('input', fn)` | `SDUI5TextBox` with `.Change` event |
| `class="btn btn-primary"` on raw `<button>` | `SDUI5Button` with `.Color = "primary"` — framework emits the `<button class="btn btn-primary">` |
| Custom CSS in `<style>` block | Banned — use semantic tokens + `.Classes` for Tailwind utilities |
| Tailwind config edits | Banned — stick to the 8 semantic tokens + d35 themes |
| Inline `style={{...}}` | Banned — use `.Classes` |
| `<input type="number">` | `SDUI5TextBox` with `.Type = "number"` |
| `<input type="email">` | `SDUI5TextBox` with `.Type = "email"` |
| `localStorage.getItem('k')` | `app.LocalStorageGet('k', defaultValue)` |
| `fetch('/api/x').then(r => r.json())` | B4J `HttpJob` wrapped via `app.HttpGet(...)` async pattern |
| `useState` / `useReducer` | No state machinery — components have live setters; you call them imperatively |
| `useEffect` | `Sub Show` + event handlers; lifecycle is page-bound |
| React Router `<Route path="...">` | Call the target page's `Show` directly (e.g. `BANano.Await(pgXxx.Show)`) |
| `<form onSubmit={...}>` | `SDUI5Form` with `.Submit` event → `Sub SDUI5Form1_Submit(e As BANanoEvent)` |
| `<select onChange={...}>` | `SDUI5Select` with `.Change` event |
| `<input type="file">` | `SDUI5FileInput` |
| WebSocket | `app.UsesPocketBase` for real-time; `app.WebSocket` wrapper if needed |

---

## 11. Partial Mappings (report, don't fabricate)

These web concepts have **no direct SDUI5* equivalent**. Don't pretend they do:

- **CSS animations / transitions** — use `SDUI5Animation` for declarative; otherwise accept that B4J can't do arbitrary CSS
- **WebGL / Canvas drawing** — no direct equivalent; use `SDUI5ToastChart` for chart-like rendering
- **Service workers / PWA install prompts** — managed at app shell level, not per-component
- **Drag-and-drop file uploads** — `SDUI5DropZone` is closest; some advanced cases need custom handler
- **Voice / audio capture** — no direct equivalent
- **Geolocation** — `SDUI5Leaflet` for maps, but geolocation API needs custom wiring
- **Clipboard API** — framework provides helpers; check `app` methods
- **IndexedDB** — use `app.LocalStorageX` or wired PocketBase collection
- **Web push notifications** — outside framework scope; wire to your backend
- **Theming at runtime per-component** — themes are global; per-component overrides need `.Classes` only
- **CSS pseudo-classes (`:hover`, `:focus-visible`)** — framework emits these via daisyUI; don't override

When you encounter one of these, **state explicitly** in your reasoning: *"No direct SDUI5* equivalent. Will need [approach X]."*

---

## 12. Where to Verify

Before using any mapping in code, confirm by:

1. Reading `components/<ComponentName>.md` — props table confirms `.Color` / `.Soft` etc. are real
2. Checking `component-manifest.md` for the **Demonstrated** flag (verified `pg*.bas` exists)
3. If **Documented-only**, ask user before using

If your reading contradicts this table, **trust the `.md` file** — it was generated from the `.bas` source.

---

## 13. Documented Gaps (daisyUI 5.7 components without SDUI5 equivalent)

Cross-reference of daisyUI 5.7 against the registered SithasoDaisy5 UI surface (139 `SDUI5*` classes at the last registry audit, 2026-10-10). Unregistered source notes do not count as available wrappers. Concepts without a registered component are **honest gaps** — do not fabricate an equivalent; explain the gap and use a supported composition only when its behavior is verified.

> **Note**: The `mask` utility class (`mask-squircle`, `mask-hexagon`, `mask-star`, etc.) is a styling capability exposed by `.Mask` on `SDUI5Avatar`, `SDUI5Rating`, and `SDUI5Image`; it is not a standalone widget. The framework emits `mask mask-{shape}` classes directly.

| DaisyUI concept | What it does | Why no SDUI5* equivalent | Workaround |
|---|---|---|---|
| **mockup-code** | Box styled like a code editor (terminal chrome) | `SDUI5Code` is for displaying code blocks; it doesn't ship the mockup window chrome (terminal prompt, line numbers). | Build with `SDUI5Window` (mockup-window equivalent) + a `SDUI5Text` inside. |
| **calendar** | Calendar-style date selection surface | `SDUI5Calendar` source exists but is not registered in `SithasoDaisy5.b4j`; no buildable direct calendar widget is documented. `SDUI5FullCalendar` is a separate event calendar. | Use a registered date component when its interaction matches the request; if a month-grid picker is required, state that no registered direct equivalent is verified. |
| **pagination** | Page navigation control for a list of results | No standalone pagination component is registered. `SDUI5Table` has table-specific paging behavior, not a generic pagination widget. | Use `SDUI5Table` for tabular data; for other collections, describe and verify a composition before claiming equivalence. |
| **theme-controller** | A `<input class="theme-controller" value="dark">` that sets the page theme when checked. Pure daisyUI utility — no component behind it. | daisyUI's theme system is class-based on `<html data-theme>`. SithasoDaisy5's theme switching is `app.SetTheme(...)` (a programmatic method, not a UI control). | Build a `SDUI5Select` populated with theme names (from `SDUI5App.THEME_*` constants) and call `app.SetTheme(value)` on `Change`. |
| **validator** | `class="validator"` on `input`/`select`/`textarea` — shows success/error color based on `pattern`/`required`/etc. | SithasoDaisy5's input validation is per-component (`.Required`, `.Validator`, `IsValid()` methods on `SDUI5TextBox`/etc.) — not a CSS class. | Use the per-component `.Validator` property and show errors via `SDUI5Alert(.Color="error")` or `app.ShowSwalError(...)`. See `component-manifest.md` for the per-component validator methods. |

### Honest reporting rule

If a request involves one of these, **state explicitly in your reasoning**: *"daisyUI has X, but SithasoDaisy5 has no direct equivalent. The closest workaround is Y. No direct component exists."* Do not invent a setter or class.

---

## 14. Cross-Reference Audit

Run `py -3 skills/sd5-web-verify/scripts/crossref_daisyui.py` to regenerate the mapping. Check each result against the active component manifest before treating it as an available API; previous cross-reference snapshots were based on an older registry.

The cross-reference is regenerated whenever `SithasoDaisy5.b4j` `ModuleN=` changes or daisyUI releases a new minor version.
