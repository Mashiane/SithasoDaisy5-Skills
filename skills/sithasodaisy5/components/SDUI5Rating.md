---
name: SDUI5Rating
description: SithasoDaisy5 SDUI5Rating component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Rating

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Rating.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Rating.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgModal.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgModal.bas)
  - [`pgRating.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgRating.bas)
  - [`pgValidation.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgValidation.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Rating is a daisyUI star rating input (1–N stars) with hover, half-stars, color, size, and validation. **InputType controls label rendering: `normal` renders a bare rating (no label), `legend` renders the `Label` above the rating.** Set `InputType = "legend"` for the label to display. Use GetValue/SetValue and Validate/IsValid for form handling.
_SDUI5Rating is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
## Skeleton Contract
Every SithasoDaisy5 component follows the same shape (see SDUI5Component base):
1. `Initialize(Callback, Name, EventName)` — sets `mCallBack`, `mName`, `mEventName`, calls `SetDefaults`.
2. `ParentID` (property / `setParentID(id)`) — attach point in the DOM.
3. `DesignerCreateView(Target, Props)` — INTERNAL (called by `AddComponent`, never from app code); reads `CustProps`, pushes daisyUI classes via `UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT`, appends `[BANCLEAN]<tag id="{name}">`, wires `UI.OnEvent`.
4. Live setters mutate the DOM via `UI.*ByID("{name}_child")`.

**Init signature**: `Initialize(Callback As Object, Name As String, EventName As String)` | **Has DesignerCreateView**: Yes
## Designer Properties
| Key | Type | Default | List | Setter | Getter |
|---|---|---|---|---|---|
| `ParentID` | String | — | — | `setParentID` | `getParentID` |
| `InputType` | String | normal | normal, legend | `setInputType` | `getInputType` |
| `Label` | String | Rating | — | `setLabel` | `getLabel` |
| `LegendColor` | String | — | — | `setLegendColor` | `getLegendColor` |
| `Mask` | String | star | circle, decagon, diamond, heart, hexagon, hexagon-2, pentagon, rounded, rounded-2xl, rounded-3xl, rounded-lg, rounded-md, rounded-sm, rounded-xl, square, squircle, star, star-2, triangle, triangle-2, triangle-3, triangle-4 | `setMask` | `getMask` |
| `Color` | String | primary | accent, error, info, neutral, primary, secondary, success, warning, none | `setColor` | `getColor` |
| `RatingBackgroundColor` | String | — | — | `setRatingBackgroundColor` | `getRatingBackgroundColor` |
| `Size` | String | md | lg, md, sm, xl, xs | `setSize` | `getSize` |
| `Count` | Int | 5, MinRange: 0, MaxRange: 10 | — | `setCount` | `getCount` |
| `Value` | String | 2 | — | `setValue` | `getValue` |
| `FirstHidden` | Boolean | True | — | `setFirstHidden` | `getFirstHidden` |
| `Gap` | String | 2 | — | `setGap` | `getGap` |
| `Half` | Boolean | False | — | `setHalf` | `getHalf` |
| `Hint` | String | — | — | `setHint` | `getHint` |
| `Required` | Boolean | False | — | `setRequired` | `getRequired` |
| `ReadOnly` | Boolean | False | — | `setReadOnly` | `getReadOnly` |
| `BackgroundColor` | String | base-200 | — | `setBackgroundColor` | `getBackgroundColor` |
| `Border` | Boolean | True | — | `setBorder` | `getBorder` |
| `BorderColor` | String | base-300 | — | `setBorderColor` | `getBorderColor` |
| `RoundedBox` | Boolean | False | — | `setRoundedBox` | `getRoundedBox` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |
| `Enabled` | Boolean | True | — | `setEnabled` | `getEnabled` |
| `PositionStyle` | String | none | absolute, fixed, none, relative, static, sticky | `setPositionStyle` | `getPositionStyle` |
| `Position` | String | t=?; b=?; r=?; l=? | — | `setPosition` | `getPosition` |
| `MarginAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | `setMarginAXYTBLR` | `getMarginAXYTBLR` |
| `PaddingAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | `setPaddingAXYTBLR` | `getPaddingAXYTBLR` |
| `RawClasses` | String | — | — | `setClasses` | `getClasses` |
| `RawStyles` | String | — | — | `setStyles` | `getStyles` |
| `RawAttributes` | String | — | — | `setAttributes` | `getAttributes` |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
Where a designer key and method name differ, the method names shown are the source-verified mapping.
## Events
`Change`

Wire in parent: `Sub rating_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (10)
- `AddComponent()` _(public)_
- `Clear()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Focus()` _(public)_
- `HintError(s As String)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `IsBlank()` _(public)_
- `Refresh()` _(public)_
- `Remove()` _(public)_
- `ResetValidation()` _(public)_

## Key Setters (32)
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBorder(b As Boolean)` _(public)_
- `setBorderColor(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setColor(s As String)` _(public)_
- `setCount(s As Int)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setFirstHidden(b As Boolean)` _(public)_
- `setGap(s As String)` _(public)_
- `setHalf(b As Boolean)` _(public)_
- `setHint(s As String)` _(public)_
- `setInputType(s As String)` _(public)_
- `setLabel(s As String)` _(public)_
- `setLegendColor(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setMask(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRangeBackgroundColor(s As String)` _(public)_
- `setRatingBackgroundColor(s As String)` _(public)_
- `setReadOnly(b As Boolean)` _(public)_
- `setRequired(b As Boolean)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setSize(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setValue(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_

## Getters (33)
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getBorder()` _(public)_
- `getBorderColor()` _(public)_
- `getClasses()` _(public)_
- `getColor()` _(public)_
- `getCount()` _(public)_
- `getEnabled()` _(public)_
- `getFirstHidden()` _(public)_
- `getGap()` _(public)_
- `getHalf()` _(public)_
- `getHere()` As String _(public)_
- `getHint()` _(public)_
- `getID()` As String _(public)_
- `getInputType()` _(public)_
- `getLabel()` _(public)_
- `getLegendColor()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getMask()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRatingBackgroundColor()` _(public)_
- `getReadOnly()` _(public)_
- `getRequired()` _(public)_
- `getRoundedBox()` _(public)_
- `getShadow()` _(public)_
- `getSize()` _(public)_
- `getStyles()` _(public)_
- `getValue()` _(public)_
- `getVisible()` _(public)_

## Private Methods (2)
- `changed(e As BANanoEvent)` _(private)_
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgRating.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgRating.bas) (verified demo):

```b4j
Private SDUI5Rating1 As SDUI5Rating		'ignore
Private SDUI5Rating17 As SDUI5Rating		'ignore
Private SDUI5Rating16 As SDUI5Rating		'ignore
Private SDUI5Rating10 As SDUI5Rating		'ignore
Private SDUI5Rating11 As SDUI5Rating		'ignore
Private SDUI5Rating12 As SDUI5Rating		'ignore
Private SDUI5Rating13 As SDUI5Rating		'ignore
Private SDUI5Rating14 As SDUI5Rating		'ignore
Private SDUI5Rating15 As SDUI5Rating		'ignore
Private SDUI5Rating18 As SDUI5Rating		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim rating As SDUI5Rating
rating.Initialize(Me, "SDUI5Rating", "SDUI5Rating")
rating.ParentID = "placeholder"
BANano.Await(rating.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Shared helpers: Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/TextSize/BackgroundImage. Dimensions are component-specific: this component exposes neither Width nor Height; use `Classes` utilities for sizing when needed.
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
