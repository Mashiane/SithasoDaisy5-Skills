---
name: sd5-primer
description: SithasoDaisy5 + BANano + daisyUI/Tailwind primer for agents new to the stack. Language syntax, app shell, build pipeline, asset registration. Read this before generating B4J code.
---

# SithasoDaisy5 Language & Stack Primer

A condensed orientation for AI agents that need to write B4J/BANano code that drives the SithasoDaisy5 framework. If you've never written B4X before, start here.

---

## 1. What Is SithasoDaisy5?

- **Type**: B4J/BANano component library, compiled into a `.b4xlib` and shipped as a single file.
- **Output**: B4J `.bas` files that call `SDUI5*` components. BANano transpiles the `.bas` → JS → runs in the browser.
- **Styling**: daisyUI component classes (`btn`, `card`, `modal`, `alert`, `tabs`, `menu`, `drawer`, `badge`, `avatar`, `collapse`, `join`, `dock`, `stats`, `timeline`, `hero`, `footer`, `navbar`, `carousel`, `diff`, `kbd`, `progress`, `radial-progress`, `skeleton`, `tooltip`, `swap`, `countdown`, `divider`, `indicator`, `stack`, `mockup-*`) + Tailwind utilities + responsive prefixes (`lg:`/`md:`/`sm:`/`xl:`).
- **No HTML emitted by your code** — the framework injects `[BANCLEAN]<tag class="...">` nodes. You drive it via property setters.

---

## 2. The Build Pipeline

```
┌─────────────────────────────────┐
│ B4J source (.bas)               │
│   - SDUI5App.bas (shell)        │
│   - pgIndex.bas (page registry) │
│   - pg*.bas (page modules)      │
└─────────────────────────────────┘
                ↓
┌─────────────────────────────────┐
│ BANano.BuildAsB4xlib            │
│ - Reads each .bas               │
│ - Transpiles to JS              │
│ - Emits SithasoDaisy5.b4xlib   │
└─────────────────────────────────┘
                ↓
┌─────────────────────────────────┐
│ SithasoDaisy5.b4xlib           │
│ - Imported by app projects     │
│ - Provides SDUI5* classes      │
└─────────────────────────────────┘
                ↓
┌─────────────────────────────────┐
│ Demo app (e.g.               │
│ 0SithasoDaisy5DemoCode)        │
│ - Uses SithasoDaisy5.b4xlib    │
│ - Own pg*.bas pages             │
│ - Builds to pb_public/count/    │
│   or pb_public/stock/ for SPA   │
└─────────────────────────────────┘
```

You write `.bas` that **calls** `SDUI5*` classes. You don't ship `.bas` as user-facing output — they compile to JS the browser executes.

---

## 3. App Shell (`SDUI5App`)

The single root object every page holds as `app`. Initialized once in `BANano_Ready`:

```b4j
Sub BANano_Ready
    app.Initialize(Me)
    app.SetTheme(app.THEME_NORD)
    ' lazy-load what you need
    Banano.Await(app.UsesDatePicker)
    Banano.Await(app.UsesQuill)
    Banano.Await(app.UsesPocketBase)
End Sub
```

`SDUI5App` owns:
- `#body` initialization + loader
- Color / month / day maps
- `online` / `offline` window listeners → fires `ConnectionChange`
- `prefers-color-scheme: dark` media listener → fires `DarkTheme`
- `SDUI5MDToast` (internal)
- `ShowSwalSuccess / ShowSwalError / ShowSwalInfo / ShowSwalConfirm / ShowSwalWarn` wrappers
- Drawer helpers
- Theme application (`html data-theme=`)
- `UsesX` lazy-asset loaders

**Constants** (use these instead of hardcoded strings):
- **Themes**: `THEME_LIGHT`, `THEME_DARK`, `THEME_CUPCAKE`, `THEME_SYNTHWAVE`, `THEME_DRACULA`, `THEME_NORD`, `THEME_ABYSS`, `THEME_SILK`, … (35+ total)
- **Colors**: `COLOR_PRIMARY`, `COLOR_SECONDARY`, `COLOR_ACCENT`, `COLOR_NEUTRAL`, `COLOR_INFO`, `COLOR_SUCCESS`, `COLOR_WARNING`, `COLOR_ERROR`, `COLOR_GHOST`
- **Palette**: `COLOR_EMERALD`, `COLOR_SKY`, `COLOR_ROSE`, … (with intensities `INTENSITY_50`–`INTENSITY_900`)

---

## 4. The Skeleton Contract (every component)

Every component shares this shape:

```b4j
Dim x As SDUI5X
x.Initialize(Me, "x", "x")                  ' sets mCallBack, mName, mEventName; UI.Initialize(Me); SetDefaults
x.ParentID = "host_id"                      ' DOM attach point
BANano.Await(x.AddComponent)                ' resolves "#host_id" and calls DesignerCreateView internally
                                            ' (parses CustProps, pushes daisyUI classes via UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT, appends [BANCLEAN]<tag id="{name}">, wires UI.OnEvent)
x.setColor("primary")                       ' live DOM mutation via UI.*ByID("{name}_child")
x.setText("Click me")                       ' setter updates the rendered DOM in place
```

The **3-step standard** is `Initialize` → `ParentID` → `BANano.Await(AddComponent)`. **Never call `DesignerCreateView` explicitly from app code** — it is internal mount logic and no demo page calls it. **Container-style** components (`SDUI5Stat`, `SDUI5Dock`, `SDUI5Carousel`, `SDUI5Timeline`, `SDUI5Accordion`, `SDUI5SweetAlert`) deviate — see `component-creation-patterns.md` for the exact sequence per component.

---

## 5. Page Module (`pg*.bas`)

Each page is a `Sub Show` that mounts components:

```b4j
Sub Show
    app = pgIndex.App                                     ' get the singleton
    BANano.Await(app.ClearPageView)                       ' RULE-LIFECYCLE-001: first line
    SDUI5Container1.Initialize(Me, "SDUI5Container1", "SDUI5Container1")
    SDUI5Container1.ParentID = app.PageView               ' mount to app's page view
    SDUI5Container1.Classes = "mx-auto"
    BANano.Await(SDUI5Container1.AddComponent)            ' RULE-LIFECYCLE-002: AddComponent before children

    SDUI5Row4.Initialize(Me, "SDUI5Row4", "SDUI5Row4")
    SDUI5Row4.ParentID = "SDUI5Container1"               ' parent must exist in DOM
    SDUI5Row4.GridColsMd = "3"                            ' responsive
    SDUI5Row4.GridColsSm = "1"
    BANano.Await(SDUI5Row4.AddComponent)

    SDUI5Alert5.Initialize(Me, "SDUI5Alert5", "SDUI5Alert5")
    SDUI5Alert5.ParentID = "SDUI5Row4"
    SDUI5Alert5.Color = "error"                           ' listed SDUI5Alert variant token
    SDUI5Alert5.Text = "12 unread messages"
    BANano.Await(SDUI5Alert5.AddComponent)

    pgIndex.UpdateTitle("SD")")                              ' RULE-LIFECYCLE-003: last line
End Sub
```

**Mandatory pattern**:
1. `app = pgIndex.App`
2. `BANano.Await(app.ClearPageView)` ← first
3. Container → Row → Column → leaf components (parent before child, AddComponent before next sibling)
4. `pgIndex.UpdateTitle("...")` ← last before `End Sub`

**Event handler naming**: `${mEventName}_<event>`. If your `mEventName` is `"SDUI5Alert5"` and the event is `Click`, the handler is:

SubSub `SDUI5Alert5_Click(e As BANanoEvent)`

---

## 6. Variable Naming & Hungarian-ish Prefixes (B4J convention)

B4J doesn't enforce Hungarian, but the codebase uses prefix conventions:

| Prefix | Meaning | Example |
|---|---|---|
| `s` | String | `sTitle = "Hello"` |
| `i` | Int | `iLeft = 10` |
| `b` | Boolean | `bVisible = True` |
| `d` | Double | `dWidth = 100.5` |
| `lst` | List | `lstItems` |
| `m` | Map | `mProps` |
| `pg` | Page module | `pgIndex`, `pgButton` |
| `app` | SDUI5App singleton | `app.SetTheme(...)` |

Follow these. Don't invent new prefixes.

---

## 7. daisyUI / Tailwind Cheat-Sheet (web agent must-know)

You don't write the daisyUI classes — the framework injects them from your `CustProps` map. But you need to know the **vocabulary** so your choice of `Color`, `Size`, `Style` etc. maps to real classes.

### Color tokens (use the per-component property contract)
- `primary`, `secondary`, `accent`, `neutral`
- `info`, `success`, `warning`, `error`
- `base-100`, `base-200`, `base-300`, `base-content` (surface + text pairs)
- A semantic `.Color` list is specific to its component. Other color-named properties may expect a theme token, Tailwind class value, raw CSS value, or a library-specific value; do not infer from the property name. See `design-tokens.md` §1.1 before assigning colors. `UIShared.FixColor` converts `#hex` to an arbitrary class, but does not convert `rgb(...)`/`rgba(...)` into valid arbitrary-class syntax.

### Size tokens
- `xs`, `sm`, `md`, `lg`, `xl` (component-specific)

### Style modifiers (component-specific)
- `outline`, `dash`, `soft`, `ghost`, `link` (buttons)
- `border`, `side`, `full`, `compact` (cards)
- `glass` (navbar)

### Responsive prefixes (you write these in `Classes` strings)
- `lg:`, `md:`, `sm:`, `xl:` for breakpoints

### Spacing (Tailwind utilities)
- `p-2`, `p-4`, `p-6` (padding)
- `m-2`, `m-4`, `mx-auto`, `mt-4` (margin)
- `gap-2`, `gap-4` (flex/grid gap)
- `w-full`, `w-1/2`, `max-w-md`, `min-w-12`, `min-h-12` (sizing)

### Layout
- `flex`, `grid` (display)
- `grid-cols-1`, `sm:grid-cols-2`, `lg:grid-cols-3` (grid cols)
- `items-center`, `justify-center`, `justify-between` (alignment)
- `hidden`, `block`, `inline-block` (visibility)

---

## 8. Common Pitfalls for Web Agents

You're a web agent by training. SithasoDaisy5 looks like web, isn't. Here's the disorientation table:

| Web instinct | SithasoDaisy5 reality |
|---|---|
| "I'll write `<button class="btn">`" | You write `.Color = "primary"` on a `SDUI5Button` instance. Framework emits the `<button class="btn btn-primary">`. |
| "I'll add `style={{...}}` for custom CSS" | Banned. Use semantic tokens + component props. No inline styles. |
| "I'll use `addEventListener` in JS" | You write `Sub SDUI5Button1_Click(e As BANanoEvent)`. B4J's event pattern, not JS. |
| "I'll fetch data with `fetch()` then `setState`" | You call `app.UsesPocketBase` then write a B4J Sub that takes the result and mutates `SDUI5*` setters. |
| "I'll use React state hooks" | No state machinery. Components are objects with `.X = Y` setters that mutate the live DOM via `UI.*ByID("{name}_child")`. |
| "I'll wire routing with `react-router`" | Calling the target page's `Show` (e.g. `BANano.Await(pgXxx.Show)`) switches pages. |
| "I'll use `localStorage`" | `app.LocalStorageGet/Set` wrapper. |
| "I'll use Tailwind config to add custom colors" | No config. Use the 8 semantic colors daisyUI ships with. |

---

## 9. Asset Registration

External JS/CSS lives in `Files/` (252 assets). Three registration paths:

1. **Always-on assets** (e.g., core daisyUI CSS): registered in `SithasoDaisy5.b4j` via `BANano.Header.AddCSSFile[ForLater]`. Loaded on app start.

2. **Lazy assets via `UsesX`**: `app.UsesPocketBase`, `app.UsesExcel`, `app.UsesQuill`, `app.UsesLeaflet`, `app.UsesDatePicker`, `app.UsesKanBan`, `app.UsesSignaturePad`, `app.UsesQRCode`, `app.UsesVideoAudioPlayer`, `app.UsesOfficeRibbon`, etc. Each maps to a `ForLater` registration. Call `BANano.Await(app.UsesX)` before using the matching component.

3. **Custom assets** in your app: add to your app's `Files/`, declare `FileN=<name>` + `FileGroupN=Default Group` in your app's `.b4j`. Missing `FileGroupN` causes build crash (RULE-SETUP-006).

---

## 10. Quick-Reference: First B4J Page

```b4j
'=== pgHello.bas ===
Sub Process_Globals
    Private BANano As BANano
    Private app As SDUI5App
End Sub

Sub Show
    app = pgIndex.App
    BANano.Await(app.ClearPageView)
    
    SDUI5Container1.Initialize(Me, "SDUI5Container1", "SDUI5Container1")
    SDUI5Container1.ParentID = app.PageView
    SDUI5Container1.Classes = "mx-auto"
    BANano.Await(SDUI5Container1.AddComponent)
    
    SDUI5Row1.Initialize(Me, "SDUI5Row1", "SDUI5Row1")
    SDUI5Row1.ParentID = "SDUI5Container1"
    SDUI5Row1.Classes = "grid place-items-center min-h-screen"
    BANano.Await(SDUI5Row1.AddComponent)
    
    SDUI5Button1.Initialize(Me, "SDUI5Button1", "SDUI5Button1")
    SDUI5Button1.ParentID = "SDUI5Row1"
    SDUI5Button1.Color = "primary"
    SDUI5Button1.Size = "lg"
    SDUI5Button1.Text = "Click me"
    BANano.Await(SDUI5Button1.AddComponent)
    
    pgIndex.UpdateTitle("Hello")
End Sub

Sub SDUI5Button1_Click(e As BANanoEvent)
    app.ShowSwalSuccess("It works!")
End Sub
```

This page compiles, mounts a primary CTA in a centered row, and shows a success toast on click. **Always start from this template.**

---

## 11. References

- `ux-master-doctrine.md` — quantitative design laws + DoD
- `design-tokens.md` — semantic color / theme / sizing vocabulary
- `component-manifest.md` — every component + status + verified demos
- `component-creation-patterns.md` — standard 3-step + container deviations
- `page-architectures.md` — proven page composition patterns
- `negative-knowledge.md` — anti-hallucination rules
- `app-scaffolds.md` — full app shell + page registry template
