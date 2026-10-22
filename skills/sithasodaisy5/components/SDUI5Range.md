---
name: SDUI5Range
description: SithasoDaisy5 SDUI5Range component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Range

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Range.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Range.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgModal.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgModal.bas)
  - [`pgRange.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgRange.bas)
  - [`pgValidation.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgValidation.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Range is a range slider. Use for numeric range selection. Value/Min/Max control.
_SDUI5Range is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `RangeType` | String | normal | legend, normal, tooltip | `setRangeType` | `getRangeType` |
| `Label` | String | Range | — | `setLabel` | `getLabel` |
| `LegendColor` | String | — | — | `setLegendColor` | `getLegendColor` |
| `Value` | String | 10 | — | `setValue` | `getValue` |
| `MinValue` | String | 0 | — | `setMinValue` | `getMinValue` |
| `StepValue` | String | 1 | — | `setStepValue` | `getStepValue` |
| `MaxValue` | String | 100 | — | `setMaxValue` | `getMaxValue` |
| `Measure` | Boolean | False | — | `setMeasure` | `getMeasure` |
| `Color` | String | none | accent, error, info, neutral, none, primary, secondary, success, warning | `setColor` | `getColor` |
| `TextColor` | String | — | — | `setTextColor` | `getTextColor` |
| `ThumbColor` | String | — | — | `setThumbColor` | `getThumbColor` |
| `RangeBackgroundColor` | String | — | — | `setRangeBackgroundColor` | `getRangeBackgroundColor` |
| `Height` | String | — | — | `setHeight` | `getHeight` |
| `Width` | String | full | — | `setWidth` | `getWidth` |
| `Size` | String | none | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `Hint` | String | — | — | `setHint` | `getHint` |
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

Wire in parent: `Sub range_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (15)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Focus()` _(public)_
- `SetEndValue(s As String)` _(public)_
- `SetShowStartEnd(b As Boolean)` _(public)_
- `SetStartValue(s As String)` _(public)_
- `SetTooltip(s As String)` _(public)_
- `SetTooltipVisible(b As Boolean)` _(public)_
- `HintError(s As String)` As 'ignoredeadcode _(public)_
- `IsBlank()` As Boolean _(public)_
- `ResetValidation()` _(public)_
## Key Setters (31)
- `setParentID(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setLegendColor(s As String)` As 'ignoredeadcode _(public)_
- `setEnabled(b As Boolean)` As 'ignoredeadcode _(public)_
- `setPositionStyle(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setBackgroundColor(s As String)` As 'ignoredeadcode _(public)_
- `setBorder(b As Boolean)` As 'ignoredeadcode _(public)_
- `setBorderColor(s As String)` As 'ignoredeadcode _(public)_
- `setRoundedBox(b As Boolean)` As 'ignoredeadcode _(public)_
- `setShadow(s As String)` As 'ignoredeadcode _(public)_
- `setWidth(s As String)` As 'ignoredeadcode _(public)_
- `setHeight(s As String)` As 'ignoredeadcode _(public)_
- `setRangeType(s As String)` _(public)_
- `setRangeBackgroundColor(s As String)` As 'ignoredeadcode _(public)_
- `setColor(s As String)` As 'ignoredeadcode _(public)_
- `setHint(s As String)` _(public)_
- `setLabel(s As String)` _(public)_
- `setMaxValue(s As String)` As 'ignoredeadcode _(public)_
- `setMeasure(b As Boolean)` _(public)_
- `setMinValue(s As String)` As 'ignoredeadcode _(public)_
- `setSize(s As String)` As 'ignoredeadcode _(public)_
- `setStepValue(s As String)` As 'ignoredeadcode _(public)_
- `setTextColor(s As String)` _(public)_
- `setThumbColor(s As String)` _(public)_
- `setValue(s As String)` As 'ignoredeadcode _(public)_
## Getters (33)
- `getID()` As String _(public)_
- `getParentID()` As String _(public)_
- `getHere()` As String _(public)_
- `getLegendColor()` As String _(public)_
- `getVisible()` As Boolean _(public)_
- `getEnabled()` As Boolean _(public)_
- `getPositionStyle()` As String _(public)_
- `getPosition()` As String _(public)_
- `getAttributes()` As String _(public)_
- `getStyles()` As String _(public)_
- `getClasses()` As String _(public)_
- `getPaddingAXYTBLR()` As String _(public)_
- `getMarginAXYTBLR()` As String _(public)_
- `getBackgroundColor()` As String _(public)_
- `getBorder()` As Boolean _(public)_
- `getBorderColor()` As String _(public)_
- `getRoundedBox()` As Boolean _(public)_
- `getShadow()` As String _(public)_
- `getWidth()` As String _(public)_
- `getHeight()` As String _(public)_
- `getRangeType()` As String _(public)_
- `getRangeBackgroundColor()` As String _(public)_
- `getColor()` As String _(public)_
- `getHint()` As String _(public)_
- `getLabel()` As String _(public)_
- `getMaxValue()` As String _(public)_
- `getMeasure()` As Boolean _(public)_
- `getMinValue()` As String _(public)_
- `getSize()` As String _(public)_
- `getStepValue()` As String _(public)_
- `getTextColor()` As String _(public)_
- `getThumbColor()` As String _(public)_
- `getValue()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgModal.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgModal.bas) (verified demo). `rgSalary` = a SDUI5Range.

```b4j
	rgSalary.Initialize(Me, "rgSalary", "rgSalary")
	rgSalary.ParentID = "SDUI5Column9"
	rgSalary.Color = "neutral"
	rgSalary.Label = "What is your Salary?"
	rgSalary.MaxValue = "1000"
	rgSalary.PaddingAXYTBLR = "a=4; x=?; y=?; t=?; b=?; l=?; r=?"
	rgSalary.RangeType = "legend"
	rgSalary.RoundedBox = True
	rgSalary.Shadow = "lg"
	rgSalary.StepValue = "100"
	rgSalary.Value = "100"
	BANano.Await(rgSalary.AddComponent)
```

Demo-wired events: `Change` — handlers named `rgSalary_<Event>`.

Also used in: `pgRange`, `pgValidation`
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim range As SDUI5Range
range.Initialize(Me, "SDUI5Range", "SDUI5Range")
range.ParentID = "placeholder"
BANano.Await(range.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


