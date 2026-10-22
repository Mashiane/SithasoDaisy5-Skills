---
name: design-tokens
description: SithasoDaisy5 design token vocabulary — common semantic colors, sizes, shapes, themes, and component-specific color-channel guidance.
---

# SithasoDaisy5 Design Tokens

The vocabulary of common values for `SDUI5*` properties. Prefer semantic theme tokens for ordinary UI colors, but treat every color property as component-specific: inspect its Designer Properties list and source behavior before choosing a value. A property called `Color` is not a universal API contract.

---

## 1. Color Tokens (Semantic)

The common daisyUI semantic color tokens are:

| Token | daisyUI class | When to use |
|---|---|---|
| `primary` | `*-primary` | **Primary call-to-action** (one per screen — Submit, Confirm, Add) |
| `secondary` | `*-secondary` | Secondary actions; visually subordinated to primary |
| `accent` | `*-accent` | Tertiary emphasis; highlights without competing with primary |
| `neutral` | `*-neutral` | Neutral surfaces; low-emphasis actions; Cancel buttons |
| `info` | `*-info` | Informational feedback (alerts, badges, statuses) |
| `success` | `*-success` | Positive feedback (success alerts, confirmed status) |
| `warning` | `*-warning` | Cautionary feedback (warnings, attention-needed states) |
| `error` | `*-error` | Destructive / failure feedback (errors, delete actions) |
| `none` | _no class_ | Default component styling (no color override) |

**Content pair tokens** (text on color):
- `primary-content`, `secondary-content`, `accent-content`, `neutral-content`
- `info-content`, `success-content`, `warning-content`, `error-content`
- `base-content` (text on `base-100` surface)

Use semantic tokens for theme-aware UI. The property list in each component reference is the first authority; its setter and the rendered target determine what the value means.

### 1.1 Color Channels (property-specific)

| Channel | Meaning and value rule |
|---|---|---|
| `.Color` | Component-dependent. For designer properties with an explicit semantic `List` (e.g. `SDUI5Button.Color`), select only from that list; these values usually create a component variant class such as `btn-primary`. Other components use `.Color` differently (nested control, HTML `color` attribute, or CSS text color). Never assume hex/rgb or a semantic token is valid without checking that component's reference and setter. |
| `.BackgroundColor`, `.TextColor`, `.BorderColor` | On shared color-helper components, these become `bg-*`, `text-*`, and `border-*` classes through `UIShared.FixColor`. DaisyUI semantic tokens, base tokens, known `ColorMap` values, and `#hex` values are transformed according to that helper. Hex becomes an arbitrary-value class such as `bg-[#1a2b3c]`; ensure the project’s Tailwind runtime/build supports the generated class. |
| Other `*Color` properties | Component-specific. Some accept semantic tokens; others are literal CSS color strings, feed a JavaScript library, set an SVG/style value, or describe a chart/gradient channel. Follow the component reference and its implementation; do not generalize from the property name. |
| `.Classes` | Tailwind/daisyUI classes, including semantic classes and supported arbitrary values such as `bg-[#FF6B35]`. Prefer theme tokens where the color should follow theme changes. |
| `.Styles` / `.RawStyles` | Inline CSS declarations for one-off CSS values. Use this when the target property accepts CSS syntax and a component color helper cannot express the value. |
| `.Attributes` / `.RawAttributes` | HTML attributes, not a general-purpose CSS color channel. Use only when the target component/library reads that attribute. |
| Theme palettes | Use `THEME_*` constants for built-in themes; define a custom palette with daisyUI CSS variables in the stylesheet and apply it with `app.SetTheme("<custom>")`. This is the preferred home for brand hex so the app can re-theme as a whole. |

`UIShared.FixColor` has specific conversion behavior: semantic values receive the requested class prefix; `#hex` is wrapped as a Tailwind arbitrary-value class; palette names may be resolved through `ColorMap`. It does not turn CSS `rgb(...)`, `rgba(...)`, or `var(...)` strings into valid Tailwind arbitrary syntax. Use a component's documented raw CSS property or `.Styles` for those CSS values. `none` is a no-color sentinel only where that component documents it; an empty value is usually the safer way to leave an optional color unset.

Examples of distinct meanings:

```b4j
primaryButton.Color = "primary"       'SDUI5Button variant → btn-primary
statusAlert.Color = "error"            'SDUI5Alert variant → alert-error
surface.BackgroundColor = "base-100"   'shared color helper → bg-base-100
surface.TextColor = "base-content"     'shared color helper → text-base-content
surface.BorderColor = "base-300"       'shared color helper → border-base-300
chart.ShapeColor = "#1a2b3c"            'only when the chart property documents raw CSS colors
```

The framework audit found 367 color-named designer properties across 95 of 140 `SDUI5*.bas` component modules. Not every `*Color` key is a string color; for example, `SDUI5Avatar.AvatarColor` is Boolean. Of the 35 exact `.Color` properties, many use semantic variant lists, but exceptions include raw `color` attributes (`SDUI5AdvancedCheckGroup`, `SDUI5NoUISlider`), nested or child color behavior (`SDUI5Fab`, `SDUI5Indicator`, `SDUI5Label`), CSS color text (`SDUI5Svg`), and stored-only `SDUI5Page.Color` in the inspected source. Check each component file before using a color property, especially where its list is blank or the default is a literal hex value.

Source-checked `.Color` behavior that differs from a simple root variant setter:

| Component(s) | What `Color` targets |
|---|---|
| `SDUI5AdvancedCheckGroup`, `SDUI5NoUISlider` | Writes a `color` HTML attribute; the component/library interprets it. |
| `SDUI5ChatBubble`, `SDUI5Fab`, `SDUI5Filter`, `SDUI5Indicator`, `SDUI5Label`, `SDUI5SpeedDial`, `SDUI5FileInput` | Targets an internal bubble, button, option, indicator, input, or file action; some behavior depends on component mode/type. |
| `SDUI5CheckBoxGroup`, `SDUI5RadioGroup`, `SDUI5Rating` | Applies the value when generating/updating child controls or rating items. |
| `SDUI5Loading`, `SDUI5Textrotate` | Sets a text-color class. |
| `SDUI5RadialProgress` | Sets a background-color class. |
| `SDUI5Svg` | Sets inline CSS `color` and uses `currentColor` for the SVG fill. |
| `SDUI5Page` | The current setter stores the value, but the inspected source does not apply it to the rendered page. Do not rely on it for visible color. |

For other `.Color` properties, verify the component's own designer list and setter before assuming they generate a same-named component variant.

The B4J demo pages commonly use semantic variants for controls and `base-*` tokens for themed surfaces. They also include literal hex values in selected `BackgroundColor`, `TextColor`, icon, chart, gradient, and other component-specific channels. Treat a demo assignment as evidence for that same component/property only; it does not establish that another property accepts the same value.

Gradients are first-class: `GradientActive` + `Gradient` (8 orientations: `bl_tr`, `bottom_top`, `br_tl`, `left_right`, `right_left`, `tl_br`, `top_bottom`, `tr_bl`) + `GradientColor1`/`GradientColor2` on `SDUI5BankCard`, `SDUI5BasicLabel`, `SDUI5Container`, `SDUI5NavBar`, `SDUI5Page`.

---

## 2. Surface Tokens (Background)

For page-level surfaces and containers:

| Token | When to use |
|---|---|
| `base-100` | Default page background |
| `base-200` | Slightly recessed surfaces (cards on a card) |
| `base-300` | More recessed (modal backdrops, dividers) |
| `base-content` | Default text on base surfaces |

**Hierarchy**: `base-100` > `base-200` > `base-300` (each level is more recessed/lower contrast).

---

## 3. Size Tokens

Available on most components via `.Size`:

| Token | Typical use |
|---|---|
| `xs` | Extra small — inline labels, badges, status dots |
| `sm` | Compact — toolbar buttons, dense table rows, secondary CTAs |
| `md` | **Default** — primary UI, body inputs, standard buttons |
| `lg` | Prominent — page-level primary CTAs, hero buttons |
| `xl` | Maximum — marketing pages, login submit, hero |

**Default policy**: start at `md`. Only deviate when the design context demands it.

---

## 4. Style Modifiers (Component-Specific)

### Buttons (`SDUI5Button`)
| Token | Effect |
|---|---|
| `solid` (default) | Filled background |
| `outline` | Border only, transparent fill |
| `dash` | Dashed border |
| `soft` | Soft tint background (less aggressive than solid) |
| `ghost` | No visible styling until hover |
| `link` | Renders as a text link |

### Buttons — Shape
| Token | Effect |
|---|---|
| `wide` | Extra horizontal padding |
| `block` | Full-width of parent |
| `square` | Square aspect ratio |
| `circle` | Circular (icon-only buttons) |

### Cards (`SDUI5Card`)
| Token | Effect |
|---|---|
| `border` | Border around card |
| `dash` | Dashed border |
| `side` | Image on the side, content on the other |
| `image-full` | Image as full background |
| `compact` | Reduced padding |

Official daisyUI 5 card classes only — **`glass` is NOT a card class**. Frosted-glass = component-agnostic `glass` utility via `.Classes = "glass"` (works on any element).

### Modifiers (component-agnostic)
| Token | Effect |
|---|---|
| `glass` | Frosted-glass blur background |
| `sticky` | Sticky positioning (navbar/dock) |

---

## 5. Width / Height Tokens

| Token | Effect |
|---|---|
| `full` | Spans parent's available width/height |
| `auto` | Natural component size (default for most) |
| `xs`, `sm`, `md`, `lg`, `xl` | Component-specific dimension presets |

**BAD**: numeric pixel values (`.Width = 320`)
**GOOD**: `.Width = "full"` or compute from the parent

If you need a specific pixel size, use the **Tailwind utility class** via `.Classes`:

```b4j
btn.Classes = "w-80 max-w-sm min-w-32"  ' 320px / max-content-24rem / min-128px
```

---

## 6. Theme Tokens (35+ available)

Themes are global; switching one updates `html data-theme=` and re-themes every component.

```b4j
app.SetTheme(app.THEME_NORD)   ' apply theme
```

Available constants (from `SDUI5App`):

| Category | Themes |
|---|---|
| **Light** | `THEME_LIGHT`, `THEME_CUPCAKE`, `THEME_BUMBLEBEE`, `THEME_EMERALD`, `THEME_CORPORATE`, `THEME_WINTER`, `THEME_CARAMELLATTE` |
| **Dark** | `THEME_DARK`, `THEME_SYNTHWAVE`, `THEME_DRACULA`, `THEME_NIGHT`, `THEME_COFFEE`, `THEME_DIM`, `THEME_NORD`, `THEME_ABYSS` |
| **Colorful** | `THEME_LUXURY`, `THEME_CMYK`, `THEME_VALENTINE`, `THEME_HALLOWEEN`, `THEME_GARDEN`, `THEME_FOREST`, `THEME_AQUA`, `THEME_LOFI`, `THEME_PASTEL`, `THEME_FANTASY`, `THEME_WIREFRAME`, `THEME_BLACK`, `THEME_BUSINESS`, `THEME_ACID`, `THEME_LEMONADE`, `THEME_RETRO`, `THEME_CYBERPUNK`, `THEME_AUTUMN`, `THEME_SUNSET`, `THEME_WINTER` |
| **Functional** | `THEME_SILK` |

Source of truth: `SDUI5App.bas` `THEME_*` constants (34 — the full daisyUI 5 built-in set). **No GHOSTWIRE/CARNIVAL in the framework** — earlier skill drafts invented them; do not use. `app.SetTheme(s)` sets `html data-theme` and accepts **any** daisyUI theme string defined in the stylesheet — including a custom one. Class-based theming also exists: `app.AddTheme(themeName, classes)` + `app.ApplyTheme(themeName, items)` add Tailwind/daisy classes to named elements.

**Anti-pattern**: do not commit a project to one theme. Plan for **theme switching** — the entire app should re-theme cleanly when `app.SetTheme(...)` is called.

---

## 7. Palette Tokens (extended)

For components that need a wider color range beyond the 8 semantic tokens:

- `COLOR_EMERALD`, `COLOR_SKY`, `COLOR_ROSE`, … (palette colors)
- With intensities: `INTENSITY_50`, `INTENSITY_100`, … `INTENSITY_900`

Use these only when the 8 semantic tokens genuinely don't express the design. Most apps don't need them.

---

## 8. Variant / State Combinations

Some components accept compound values:

### Alert
- `.Color` × `.Soft` (rounded corners) × `.Outline` (border) × `.Dash` (dashed)
- 4 colors × 3 modifiers = ~12 verified variants

### Badge
- `.Color` × `.Size` × `.Style` (outline/dash/ghost) × `.Soft`

### Button
- `.Color` × `.Size` × `.Shape` × `.Style` × `.Icon` × `.Image`

When picking, **start at default** (no modifier) and only add modifiers that earn their complexity.

---

## 9. Icon Tokens

Icons are SVG files in the app's `/assets/` folder. The `.Icon` property takes the asset path:

```b4j
btn.Icon = "./assets/check.svg"   ' relative to app root
```

**Rules**:
- Asset file MUST exist in the project; runtime error or missing image otherwise.
- Use semantic iconography (not decorative-only).
- Pair icon + label for clarity; icon-only buttons need WCAG `aria-label` (set via `.Text` or via custom attr).

Common icon sets used in SithasoDaisy5 demos:
- FontAwesome (`./assets/fontawesome/...`)
- DaisyUI built-ins (`check.svg`, `info.svg`, `alert.svg`)
- Custom SVG in app `/assets/`

---

## 10. Spacing Tokens (Tailwind utilities)

You don't have raw spacing tokens — use Tailwind utilities via `.Classes`:

| Token | Size | When |
|---|---|---|
| `p-0`, `p-1`, `p-2`, `p-4`, `p-6`, `p-8`, … | 0, 4, 8, 16, 24, 32, … px | Component padding |
| `m-2`, `m-4`, `mx-auto`, `my-4`, `mt-2` | Same scale | Component margin |
| `gap-2`, `gap-4`, `gap-6` | Gap between flex/grid children |
| `w-full`, `w-1/2`, `w-1/3`, `w-2/3` | Width fractions |
| `h-screen`, `h-12`, `min-h-screen`, `min-h-12` | Height |
| `space-y-2`, `space-x-4` | Auto-spacing between siblings |

Responsive variants: `sm:p-4`, `md:p-6`, `lg:p-8` (mobile-first).

---

## 11. Typography

Available via `.TextSize` or via `.Classes`:

| Tailwind | Size |
|---|---|
| `text-xs` | 12px |
| `text-sm` | 14px |
| `text-base` | 16px (default body) |
| `text-lg` | 18px |
| `text-xl` | 20px |
| `text-2xl` … `text-9xl` | 24px – 144px |

Weight: `font-thin`, `font-light`, `font-normal`, `font-medium`, `font-semibold`, `font-bold`, `font-extrabold`.

Alignment: `text-left`, `text-center`, `text-right`.

Families: `font-sans`, `font-serif`, `font-mono` (Tailwind defaults). For custom brand fonts, load the font CSS once at app start via `UI.LoadAssetsOnDemand(key, items)` (the framework's own asset-CSS channel — used for FontAwesome), then target it with `.Classes` or `.Styles` (`font-family: ...`). Global stylesheet-level rules (fonts, keyframes, custom daisyUI themes) belong in the app stylesheet, not per-page code.

---

## 12. Anti-Patterns

| Anti-pattern | Why |
|---|---|
| `.Color = "#FF3B82F6"` without checking the component | `.Color` has component-specific behavior. On a semantic variant property such as `SDUI5Button.Color`, hex does not name a daisyUI variant. Use a listed token there; use hex only through a documented CSS-color channel. |
| `.Width = 320` | Numeric pixels not supported. Use `.Width = "full"` or Tailwind utility in `.Classes`. |
| `.Size = "MD"` | Casing matters. Token is lowercase `"md"`. |
| Hex on themed components via `.Classes` while ignoring tokens | Breaks theme switching — component stops following `data-theme`. Prefer tokens; hex for brand accents/decorative surfaces |
| Adding a new color via Tailwind config | Not supported. Use theme CSS vars (daisyUI @plugin theme) + `app.SetTheme("<custom>")` |

---

## 13. Quick Decision Tree

```
Need a color?
  → Read that component's color property table and setter semantics first
  → Does the property list semantic daisyUI variants? → choose one of its listed tokens
  → Is it a surface/text/border on a shared color-helper component? → use base-100/200/300/content or semantic tokens
  → Is it a component/library CSS color channel? → use only the CSS values documented for that property
  → Does it need an unthemed custom color? → use the component's raw CSS channel or Styles; avoid guessing

Need a size?
  → default to md
  → promote to lg/xl for hero/primary CTA
  → demote to sm/xs for inline/labels

Need a width?
  → "full" to span parent
  → otherwise leave at default (auto) and let flex/grid handle layout

Need a theme?
   → app.SetTheme(app.THEME_NORD)  ' pick one that matches your brand mood
   → design for theme-switching from day 1
```

---

## 14. Style Tiers (aesthetic styles)

When a design prompt names an aesthetic, classify it before building and state the tier in the reasoning trace:

### ✅ Sanctioned — build directly
`glass` cards, flat/minimal/Swiss-ish (`THEME_LOFI`), light fintech (`THEME_CORPORATE`), dark sleek (`THEME_DARK`/`THEME_NIGHT`), pastel (`THEME_PASTEL`), luxury (`THEME_LUXURY`), retro 90s (`THEME_RETRO`), cyberpunk/Y2K-adjacent (`THEME_CYBERPUNK`), gradients, brand hex via channels.

### 🧪 Experimental — build with declared trade-offs
Brutalist-lite (thick borders `border-2 border-black`, hard shadows `shadow-xl`, mono/sans mix, rotate/offset via `.Classes`). Track: WCAG contrast must still pass; note broken-hierarchy intent in trace.

### ⛔ Unsupported — say so, propose the sanctioned approximation
Dense skeuomorphic chrome (glossy bevels, embossed textures), overlapping chaos layouts, clashing broken fonts. Approximate: nearest `THEME_*` + gradients + bold typography; document the approximation as a deviation in the trace.
