---
name: SDUI5Progress
description: SithasoDaisy5 SDUI5Progress component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Progress

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Progress.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Progress.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgModal.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgModal.bas)
  - [`pgProgress.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgProgress.bas)
  - [`pgValidation.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgValidation.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Progress is a progress bar (linear). Use for showing progress. Value controls fill.
_SDUI5Progress is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `ProgressType` | String | normal | legend, normal, tooltip, normal-text | `setProgressType` | `getProgressType` |
| `Label` | String | Range | — | `setLabel` | `getLabel` |
| `LegendColor` | String | — | — | `setLegendColor` | `getLegendColor` |
| `Color` | String | none | accent, error, info, neutral, none, primary, secondary, success, warning | `setColor` | `getColor` |
| `ProgressBackgroundColor` | String | — | — | `setProgressBackgroundColor` | `getProgressBackgroundColor` |
| `Height` | String | — | — | `setHeight` | `getHeight` |
| `Width` | String | full | — | `setWidth` | `getWidth` |
| `Value` | Int | 0, MinRange: 0, MaxRange: 100 | — | `setValue` | `getValue` |
| `TextColor` | String | #ffffff | — | `setTextColor` | `getTextColor` |
| `TextSize` | String | xs | 2xl, 3xl, 4xl, 5xl, 6xl, 7xl, 8xl, 9xl, base, lg, md, none, sm, xl, xs | `setTextSize` | `getTextSize` |
| `TextVisible` | Boolean | False | — | `setTextVisible` | `getTextVisible` |
| `Size` | String | md | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `Indeterminate` | Boolean | False | — | `setIndeterminate` | `getIndeterminate` |
| `LeftIcon` | String | — | — | `setLeftIcon` | `getLeftIcon` |
| `LeftIconColor` | String | — | — | `setLeftIconColor` | `getLeftIconColor` |
| `MinValue` | Int | 0, MinRange: 0, MaxRange: 100 | — | `setMinValue` | `getMinValue` |
| `StepValue` | Int | 1, MinRange: 0, MaxRange: 100 | — | `setStepValue` | `getStepValue` |
| `MaxValue` | Int | 100, MinRange: 0, MaxRange: 100 | — | `setMaxValue` | `getMaxValue` |
| `RightIcon` | String | — | — | `setRightIcon` | `getRightIcon` |
| `RightIconColor` | String | — | — | `setRightIconColor` | `getRightIconColor` |
| `Ticks` | String | — | — | `setTicks` | `getTicks` |
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
_(none declared)_

Wire in parent: `Sub progress_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (5)
- `AddComponent()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `HintError(s As String)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Remove()` _(public)_

## Key Setters (43)
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBorder(b As Boolean)` _(public)_
- `setBorderColor(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setColor(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `SetEndValue(s As String)` _(public)_
- `setHeight(s As String)` _(public)_
- `setHint(s As String)` _(public)_
- `setIndeterminate(b As Boolean)` _(public)_
- `setLabel(s As String)` _(public)_
- `setLeftIcon(s As String)` _(public)_
- `setLeftIconColor(s As String)` _(public)_
- `setLegendColor(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setMaxValue(i As Int)` _(public)_
- `setMinValue(i As Int)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `setProgressBackgroundColor(s As String)` _(public)_
- `setProgressType(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRightIcon(s As String)` _(public)_
- `setRightIconColor(s As String)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `SetShowStartEnd(b As Boolean)` _(public)_
- `setSize(s As String)` _(public)_
- `SetStartValue(s As String)` _(public)_
- `setStepValue(i As Int)` _(public)_
- `setStyles(s As String)` _(public)_
- `setTextColor(s As String)` _(public)_
- `setTextSize(s As String)` _(public)_
- `setTextVisible(b As Boolean)` _(public)_
- `setTicks(s As String)` _(public)_
- `SetTooltip(s As String)` _(public)_
- `SetTooltipVisible(b As Boolean)` _(public)_
- `setValue(i As Int)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (40)
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getBorder()` _(public)_
- `getBorderColor()` _(public)_
- `getClasses()` _(public)_
- `getColor()` _(public)_
- `getEnabled()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getHint()` _(public)_
- `getID()` As String _(public)_
- `getIndeterminate()` _(public)_
- `getLabel()` _(public)_
- `getLeftIcon()` _(public)_
- `getLeftIconColor()` _(public)_
- `getLegendColor()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getMaxValue()` _(public)_
- `getMinValue()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` As String _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `getProgressBackgroundColor()` _(public)_
- `getProgressType()` _(public)_
- `GetProperties()` _(public)_
- `getRightIcon()` _(public)_
- `getRightIconColor()` _(public)_
- `getRoundedBox()` _(public)_
- `getShadow()` _(public)_
- `getSize()` _(public)_
- `getStepValue()` _(public)_
- `getStyles()` _(public)_
- `getTextColor()` _(public)_
- `getTextSize()` _(public)_
- `getTextVisible()` _(public)_
- `getTicks()` _(public)_
- `getValue()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_

## Private Methods (2)
- `SetDefaults()` _(private)_
- `UpdateTooltipTop()` _(private)_

## Verified Demo Usage

Real syntax from [`pgProgress.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgProgress.bas) (verified demo):

```b4j
Private progTip As SDUI5Progress		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim progress As SDUI5Progress
progress.Initialize(Me, "SDUI5Progress", "SDUI5Progress")
progress.ParentID = "placeholder"
BANano.Await(progress.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
