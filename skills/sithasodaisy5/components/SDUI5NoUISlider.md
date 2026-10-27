---
name: SDUI5NoUISlider
description: SithasoDaisy5 SDUI5NoUISlider component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5NoUISlider

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5NoUISlider.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5NoUISlider.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgNoUISlider.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgNoUISlider.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5NoUISlider is a no-UI range slider (noUISlider). Use for range selection without visible track.
_SDUI5NoUISlider is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `SliderType` | String | default | default, legend | `setSliderType` | `getSliderType` |
| `Label` | String | NoUISlider | — | `setLabel` | `getLabel` |
| `LegendColor` | String | — | — | `setLegendColor` | `getLegendColor` |
| `Hint` | String | — | — | `setHint` | `getHint` |
| `BackgroundColor` | String | base-200 | — | `setBackgroundColor` | `getBackgroundColor` |
| `Border` | Boolean | True | — | `setBorder` | `getBorder` |
| `BorderColor` | String | base-300 | — | `setBorderColor` | `getBorderColor` |
| `RoundedBox` | Boolean | True | — | `setRoundedBox` | `getRoundedBox` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `StartValues` | String | 20,80 | — | `setStartValues` | `getStartValues` |
| `RangeMin` | String | 0 | — | `setRangeMin` | `getRangeMin` |
| `RangeMax` | String | 100 | — | `setRangeMax` | `getRangeMax` |
| `StepValue` | String | 1 | — | `setStepValue` | `getStepValue` |
| `Connect` | String | true | — | `setConnect` | `getConnect` |
| `Margin` | String | 0 | — | `setMargin` | `getMargin` |
| `Limit` | String | 0 | — | `setLimit` | `getLimit` |
| `Padding` | String | — | — | `setPadding` | `getPadding` |
| `Tooltips` | Boolean | False | — | `setTooltips` | `getTooltips` |
| `PipsMode` | String | — | , range, steps, positions, count, values | `setPipsMode` | `getPipsMode` |
| `PipsValues` | String | — | — | `setPipsValues` | `getPipsValues` |
| `PipsDensity` | String | — | — | `setPipsDensity` | `getPipsDensity` |
| `PipsStepped` | Boolean | False | — | `setPipsStepped` | `getPipsStepped` |
| `ClickablePips` | Boolean | False | — | `setClickablePips` | `getClickablePips` |
| `Snap` | Boolean | False | — | `setSnap` | `getSnap` |
| `FormatterPrefix` | String | — | — | `setFormatterPrefix` | `getFormatterPrefix` |
| `FormatterSuffix` | String | — | — | `setFormatterSuffix` | `getFormatterSuffix` |
| `FormatterDecimals` | Int | 0 | — | `setFormatterDecimals` | `getFormatterDecimals` |
| `FormatterThousand` | String | — | — | `setFormatterThousand` | `getFormatterThousand` |
| `FormatterMark` | String | . | — | `setFormatterMark` | `getFormatterMark` |
| `FormatterNegative` | String | — | — | `setFormatterNegative` | `getFormatterNegative` |
| `FormatterNegativeBefore` | String | — | — | `setFormatterNegativeBefore` | `getFormatterNegativeBefore` |
| `FormatterEncoder` | String | — | — | `setFormatterEncoder` | `getFormatterEncoder` |
| `FormatterDecoder` | String | — | — | `setFormatterDecoder` | `getFormatterDecoder` |
| `FormatterEdit` | String | — | — | `setFormatterEdit` | `getFormatterEdit` |
| `FormatterUndo` | String | — | — | `setFormatterUndo` | `getFormatterUndo` |
| `Color` | String | primary | accent, error, info, neutral, none, primary, secondary, success, warning | `setColor` | `getColor` |
| `Size` | String | md | xs, sm, md, lg, xl, none | `setSize` | `getSize` |
| `TooltipColor` | String | none | accent, error, info, neutral, none, primary, secondary, success, warning | `setTooltipColor` | `getTooltipColor` |
| `Width` | String | full | — | `setWidth` | `getWidth` |
| `Height` | String | — | — | `setHeight` | `getHeight` |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |
| `Enabled` | Boolean | True | — | `setEnabled` | `getEnabled` |
| `PositionStyle` | String | none | absolute, fixed, none, relative, static, sticky | `setPositionStyle` | `getPositionStyle` |
| `Position` | String | t=?; b=?; r=?; l=? | — | `setPosition` | `getPosition` |
| `MarginAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | `setMarginAXYTBLR` | `getMarginAXYTBLR` |
| `PaddingAXYTBLR` | String | a=4; x=?; y=?; t=?; b=?; l=?; r=? | — | `setPaddingAXYTBLR` | `getPaddingAXYTBLR` |
| `RawClasses` | String | — | — | `setClasses` | `getClasses` |
| `RawStyles` | String | — | — | `setStyles` | `getStyles` |
| `RawAttributes` | String | — | — | `setAttributes` | `getAttributes` |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
Where a designer key and method name differ, the method names shown are the source-verified mapping.
## Events
`Change`, `Slide`, `Update`

Wire in parent: `Sub nouislider_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (13)
- `AddComponent()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Destroy()` _(public)_
- `DisableSlider()` _(public)_
- `EnableSlider()` _(public)_
- `HintError(s As String)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Rebuild()` _(public)_
- `Remove()` _(public)_
- `Reset()` _(public)_
- `StepDown(iSteps As Int)` _(public)_
- `StepUp(iSteps As Int)` _(public)_
- `UpdateOptions(sOptions As String)` _(public)_

## Key Setters (53)
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBorder(b As Boolean)` _(public)_
- `setBorderColor(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setClickablePips(b As Boolean)` _(public)_
- `setColor(s As String)` _(public)_
- `setConnect(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setFormatterDecimals(i As Int)` _(public)_
- `setFormatterDecoder(s As String)` _(public)_
- `setFormatterEdit(s As String)` _(public)_
- `setFormatterEncoder(s As String)` _(public)_
- `setFormatterMark(s As String)` _(public)_
- `setFormatterNegative(s As String)` _(public)_
- `setFormatterNegativeBefore(s As String)` _(public)_
- `setFormatterPrefix(s As String)` _(public)_
- `setFormatterSuffix(s As String)` _(public)_
- `setFormatterThousand(s As String)` _(public)_
- `setFormatterUndo(s As String)` _(public)_
- `SetHandle(iHandle As Int, dValue As Double)` _(public)_
- `setHeight(s As String)` _(public)_
- `setHint(s As String)` _(public)_
- `setLabel(s As String)` _(public)_
- `setLegendColor(s As String)` _(public)_
- `setLimit(s As String)` _(public)_
- `setMargin(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setPadding(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPipsDensity(s As String)` _(public)_
- `setPipsMode(s As String)` _(public)_
- `setPipsStepped(b As Boolean)` _(public)_
- `setPipsValues(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRangeMax(s As String)` _(public)_
- `setRangeMin(s As String)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setSize(s As String)` _(public)_
- `setSliderType(s As String)` _(public)_
- `setSnap(b As Boolean)` _(public)_
- `setStartValues(s As String)` _(public)_
- `setStepValue(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setTooltipColor(s As String)` _(public)_
- `setTooltips(b As Boolean)` _(public)_
- `SetValues(sValues As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (56)
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getBorder()` _(public)_
- `getBorderColor()` _(public)_
- `getClasses()` _(public)_
- `getClickablePips()` _(public)_
- `getColor()` _(public)_
- `getConnect()` _(public)_
- `getEnabled()` _(public)_
- `getFormatterDecimals()` _(public)_
- `getFormatterDecoder()` _(public)_
- `getFormatterEdit()` _(public)_
- `getFormatterEncoder()` _(public)_
- `getFormatterMark()` _(public)_
- `getFormatterNegative()` _(public)_
- `getFormatterNegativeBefore()` _(public)_
- `getFormatterPrefix()` _(public)_
- `getFormatterSuffix()` _(public)_
- `getFormatterThousand()` _(public)_
- `getFormatterUndo()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getHint()` _(public)_
- `getID()` As String _(public)_
- `getLabel()` _(public)_
- `getLegendColor()` _(public)_
- `getLimit()` _(public)_
- `getMargin()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getPadding()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPipsDensity()` _(public)_
- `getPipsMode()` _(public)_
- `getPipsStepped()` _(public)_
- `getPipsValues()` _(public)_
- `getPosition()` _(public)_
- `GetPositions()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRangeMax()` _(public)_
- `getRangeMin()` _(public)_
- `GetRawValues()` _(public)_
- `getRoundedBox()` _(public)_
- `getShadow()` _(public)_
- `getSize()` _(public)_
- `getSliderType()` _(public)_
- `getSnap()` _(public)_
- `getStartValues()` _(public)_
- `getStepValue()` _(public)_
- `getStyles()` _(public)_
- `getTooltipColor()` _(public)_
- `getTooltips()` _(public)_
- `GetValues()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_

## Private Methods (6)
- `BuildPips()` _(private)_
- `ChangeEvent(e As BANanoEvent)` _(private)_
- `SetDefaults()` _(private)_
- `SlideEvent(e As BANanoEvent)` _(private)_
- `UpdateEvent(e As BANanoEvent)` _(private)_
- `UpdateValueSpans(values As Object, formatted As Object)` _(private)_

## Verified Demo Usage

Real syntax from [`pgNoUISlider.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgNoUISlider.bas) (verified demo):

```b4j
Private nosPrimary As SDUI5NoUISlider		'ignore
BANano.Await(cont.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim nouislider As SDUI5NoUISlider
nouislider.Initialize(Me, "SDUI5NoUISlider", "SDUI5NoUISlider")
nouislider.ParentID = "placeholder"
BANano.Await(nouislider.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
