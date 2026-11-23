---
name: base-properties-dsl
description: Authoritative guide to the 7 base designer properties shared by all SDUI5 components — PositionStyle, Position, MarginAXYTBLR, PaddingAXYTBLR, RawClasses, RawStyles, and RawAttributes. Covers compact DSL syntax, runtime parsing in UIShared, and the Raw* code property mapping.
---

# SithasoDaisy5 Base Designer Properties & DSL Guide

Every `SDUI5*` component inherits a common set of 7 base layout, spacing, and styling properties declared in `#DesignerProperty` headers and managed at runtime by `UIShared.bas`.

This guide documents their exact syntax, compact DSL formatting, runtime behavior, and the critical `Raw*` property name mapping in B4J code.

---

## 1. Summary of the 7 Base Properties

| Designer Key | Display Name | B4J Code Property | Setter / Getter | Output Mechanism |
|---|---|---|---|---|
| `PositionStyle` | `Position Style` | `.PositionStyle = "..."` | `setPositionStyle` / `getPositionStyle` | Inline CSS: `position: ...;` |
| `Position` | `Position Locations` | `.Position = "..."` | `setPosition` / `getPosition` | Inline CSS: `top`, `bottom`, `left`, `right` |
| `MarginAXYTBLR` | `Margins` | `.MarginAXYTBLR = "..."` | `setMarginAXYTBLR` / `getMarginAXYTBLR` | Tailwind classes: `m-*`, `mx-*`, `my-*`, `mt-*`, `mb-*`, `ml-*`, `mr-*` |
| `PaddingAXYTBLR` | `Paddings` | `.PaddingAXYTBLR = "..."` | `setPaddingAXYTBLR` / `getPaddingAXYTBLR` | Tailwind classes: `p-*`, `px-*`, `py-*`, `pt-*`, `pb-*`, `pl-*`, `pr-*` |
| `RawClasses` | `Classes (;)` | **`.Classes = "..."`** | `setClasses` / `getClasses` | HTML `class` attribute (Tailwind/daisyUI) |
| `RawStyles` | `Styles (JSON)` | **`.Styles = "..."`** | `setStyles` / `getStyles` | HTML `style` attribute (inline CSS) |
| `RawAttributes` | `Attributes (JSON)` | **`.Attributes = "..."`** | `setAttributes` / `getAttributes` | HTML attributes (DOM `SetAttr`) |

---

## 2. The `Raw*` Property Name Rule (Mandatory)

> [!CAUTION]
> **Never write `.RawClasses`, `.RawStyles`, or `.RawAttributes` in B4J code.**  
> In `#DesignerProperty` headers, the keys are named `RawClasses`, `RawStyles`, and `RawAttributes` for the Abstract Designer. However, the B4J class setters are named `setClasses`, `setStyles`, and `setAttributes`.  
> Writing `comp.RawClasses = "..."` results in a B4J compilation failure (`Field not found`). Always assign `.Classes`, `.Styles`, and `.Attributes`.

```b4j
' CORRECT:
btn.Classes = "overflow-hidden hover:shadow-lg"
card.Styles = "min-height=300px; z-index=20"
card.Attributes = "data-aos=fade-up; data-aos-duration=800"

' WRONG (compilation error in B4J):
btn.RawClasses = "overflow-hidden"     ' Error: Property does not exist
card.RawStyles = "min-height=300px"    ' Error: Property does not exist
card.RawAttributes = "data-aos=fade"   ' Error: Property does not exist
```

---

## 3. Spacing DSL: `MarginAXYTBLR` & `PaddingAXYTBLR`

- **Designer Key**: `MarginAXYTBLR` / `PaddingAXYTBLR`
- **Default in Designer**: `a=?; x=?; y=?; t=?; b=?; l=?; r=?`
- **Runtime Engine**: Parsed by `UIShared.GetMarginPaddingMap` and assembled into Tailwind classes by `UIShared.MarginPaddingToList`.

### DSL Keys:
- `a` = All sides (`m-{v}` / `p-{v}`)
- `x` = Horizontal: Left & Right (`mx-{v}` / `px-{v}`); accepts `"x=auto"` (`mx-auto`)
- `y` = Vertical: Top & Bottom (`my-{v}` / `py-{v}`)
- `t` = Top (`mt-{v}` / `pt-{v}`)
- `b` = Bottom (`mb-{v}` / `pb-{v}`)
- `l` = Left (`ml-{v}` / `pl-{v}`)
- `r` = Right (`mr-{v}` / `pr-{v}`)
- `n` prefix = Negative value (`"b=n4"` $\rightarrow$ `-mb-4`, `"t=n2"` $\rightarrow$ `-mt-2`)

### Clean Compact Syntax (Best Practice):
You do **not** need to include unassigned keys with `?`. The framework parser ignores missing keys. Write only the active sides:

```b4j
' Recommended compact syntax:
heroCard.MarginAXYTBLR = "b=8"                ' Emits: mb-8
contentCard.MarginAXYTBLR = "x=auto; b=6"     ' Emits: mx-auto mb-6
container.PaddingAXYTBLR = "x=6; y=12"        ' Emits: px-6 py-12
column.PaddingAXYTBLR = "a=4"                 ' Emits: p-4

' Overlapping negative margin:
overlapCard.MarginAXYTBLR = "t=n12; b=6"      ' Emits: -mt-12 mb-6
```

---

## 4. Positioning DSL: `PositionStyle` & `Position`

- **Designer Keys**: `PositionStyle` and `Position`
- **Default `Position`**: `t=?; b=?; r=?; l=?`
- **Runtime Engine**: Parsed by `UIShared.GetPositionMap` and emitted as **inline CSS** via `UI.BuildExStyle` / `UI.AddStyleMap`.

### A. `PositionStyle`
- **Values**: `"relative"`, `"absolute"`, `"fixed"`, `"sticky"`, `"static"`, `"none"`.
- If set to `"none"` or `""`, no position style is emitted.
- Emits inline CSS: `style="position: absolute;"`.

### B. `Position`
- **Keys**: `t` (top), `b` (bottom), `r` (right), `l` (left).
- **Values**: Must be valid CSS units or lengths (`"0"`, `"10px"`, `"1rem"`, `"50%"`). Do **not** use Tailwind classes here.
- Write only the active directions without `?` placeholders:

```b4j
' Position badge in top-right corner of card:
badge.PositionStyle = "absolute"
badge.Position = "t=0; r=0"                  ' Emits: top: 0; right: 0;

' Centered floating element:
modalBox.PositionStyle = "fixed"
modalBox.Position = "t=50%; l=50%"           ' Emits: top: 50%; left: 50%;
```

---

## 5. Raw Override Properties: `.Classes`, `.Styles`, `.Attributes`

### A. `.Classes` (HTML `class` attribute)
- Accepts space- or semicolon-delimited Tailwind and daisyUI classes.
- **Strict Reservation**: Reserve `.Classes` for responsive variants (`md:`, `lg:`), hover/active states (`hover:shadow-lg`), animations (`transition-transform`), and flex/grid child layout tokens (`flex-1`, `grow`).
- **Never put base layout props here**: Do not put static `w-*`, `h-*`, `p-*`, `m-*`, `rounded-*`, or `shadow-*` into `.Classes` if the component exposes dedicated properties (`Width`, `Height`, `MarginAXYTBLR`, `PaddingAXYTBLR`, `Rounded`, `Shadow`).

```b4j
btn.Classes = "motion-safe:hover:-translate-y-0.5 hover:shadow-xl transition-all"
```

### B. `.Styles` (HTML `style` attribute)
- Injects custom inline CSS styles into the DOM element.
- Parsed by `UIShared.GetKeyValues` (supports `key=value;` or standard CSS `key: value;`):

```b4j
panel.Styles = "z-index=50; min-height=400px; backdrop-filter: blur(12px)"
```

### C. `.Attributes` (HTML DOM attributes)
- Injects arbitrary HTML attributes onto the rendered DOM element via `mElement.SetAttr`.
- Automatically routes `class` values to `AddClass` and `style` values to `SetStyles`:

```b4j
' Declarative Animate On Scroll attributes:
card.Attributes = "data-aos=fade-up; data-aos-duration=800; data-aos-offset=100"

' Link target and rel attributes:
externalLink.Attributes = "target=_blank; rel=noopener noreferrer"
```

---

## 6. Prohibited Practices & Antipatterns

1. **Never call capitalized `Set*` methods for designer properties**:
   - `comp.SetMarginAXYTBLR(...)` $\rightarrow$ **FORBIDDEN**; use `comp.MarginAXYTBLR = "..."`
   - `comp.SetPosition(...)` $\rightarrow$ **FORBIDDEN**; use `comp.Position = "..."`
   - `comp.SetPositionStyle(...)` $\rightarrow$ **FORBIDDEN**; use `comp.PositionStyle = "..."`
2. **Never write verbose `?` strings**:
   - `comp.MarginAXYTBLR = "a=?; x=?; y=?; t=?; b=4; l=?; r=?"` $\rightarrow$ **AVOID**; write `comp.MarginAXYTBLR = "b=4"`
3. **Never use `Raw*` prefix in B4J code**:
   - `comp.RawClasses = "..."` $\rightarrow$ **B4J COMPILE ERROR**; use `comp.Classes = "..."`
   - `comp.RawStyles = "..."` $\rightarrow$ **B4J COMPILE ERROR**; use `comp.Styles = "..."`
   - `comp.RawAttributes = "..."` $\rightarrow$ **B4J COMPILE ERROR**; use `comp.Attributes = "..."`
