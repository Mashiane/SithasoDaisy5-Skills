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
## Public Methods (12)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `HintError(s As String)` As 'ignoredeadcode _(public)_
- `SetEndValue(s As String)` _(public)_
- `SetShowStartEnd(b As Boolean)` _(public)_
- `SetStartValue(s As String)` _(public)_
- `SetTooltip(s As String)` _(public)_
- `SetTooltipVisible(b As Boolean)` _(public)_
## Key Setters (37)
- `setLegendColor(s As String)` As 'ignoredeadcode _(public)_
- `setParentID(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setValue(i As Int)` As 'ignoredeadcode _(public)_
- `setWidth(s As String)` As 'ignoredeadcode _(public)_
- `setTextColor(s As String)` As 'ignoredeadcode _(public)_
- `setTextSize(s As String)` As 'ignoredeadcode _(public)_
- `setTextVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setBackgroundColor(s As String)` As 'ignoredeadcode _(public)_
- `setBorder(b As Boolean)` As 'ignoredeadcode _(public)_
- `setBorderColor(s As String)` As 'ignoredeadcode _(public)_
- `setRoundedBox(b As Boolean)` As 'ignoredeadcode _(public)_
- `setShadow(s As String)` As 'ignoredeadcode _(public)_
- `setSize(s As String)` As 'ignoredeadcode _(public)_
- `setHint(s As String)` _(public)_
- `setLabel(s As String)` _(public)_
- `setProgressType(s As String)` _(public)_
- `setProgressBackgroundColor(s As String)` _(public)_
- `setColor(s As String)` _(public)_
- `setHeight(s As String)` As 'ignoredeadcode _(public)_
- `setIndeterminate(b As Boolean)` As 'ignoredeadcode _(public)_
- `setLeftIcon(s As String)` _(public)_
- `setLeftIconColor(s As String)` _(public)_
- `setMaxValue(i As Int)` _(public)_
- `setMinValue(i As Int)` _(public)_
- `setRightIcon(s As String)` _(public)_
- `setRightIconColor(s As String)` _(public)_
- `setStepValue(i As Int)` _(public)_
- `setTicks(s As String)` _(public)_
## Getters (38)
- `getID()` As String _(public)_
- `getLegendColor()` As String _(public)_
- `getHere()` As String _(public)_
- `getVisible()` As Boolean _(public)_
- `getEnabled()` As Boolean _(public)_
- `getPositionStyle()` As String _(public)_
- `getPosition()` As String _(public)_
- `getAttributes()` As String _(public)_
- `getStyles()` As String _(public)_
- `getClasses()` As String _(public)_
- `getPaddingAXYTBLR()` As String _(public)_
- `getMarginAXYTBLR()` As String _(public)_
- `getValue()` As Int _(public)_
- `getTextColor()` As String _(public)_
- `getTextSize()` As String _(public)_
- `getTextVisible()` As Boolean _(public)_
- `getBackgroundColor()` As String _(public)_
- `getBorder()` As Boolean _(public)_
- `getBorderColor()` As String _(public)_
- `getRoundedBox()` As Boolean _(public)_
- `getShadow()` As String _(public)_
- `getSize()` As String _(public)_
- `getWidth()` As String _(public)_
- `getHint()` As String _(public)_
- `getLabel()` As String _(public)_
- `getProgressType()` As String _(public)_
- `getProgressBackgroundColor()` As String _(public)_
- `getColor()` As String _(public)_
- `getHeight()` As String _(public)_
- `getIndeterminate()` As Boolean _(public)_
- `getLeftIcon()` As String _(public)_
- `getLeftIconColor()` As String _(public)_
- `getMaxValue()` As Int _(public)_
- `getMinValue()` As Int _(public)_
- `getRightIcon()` As String _(public)_
- `getRightIconColor()` As String _(public)_
- `getStepValue()` As Int _(public)_
- `getTicks()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgModal.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgModal.bas) (verified demo). `pgTasks` = a SDUI5Progress.

```b4j
	pgTasks.Initialize(Me, "pgTasks", "pgTasks")
	pgTasks.ParentID = "SDUI5Column12"
	pgTasks.Color = "success"
	pgTasks.Label = "Tasks Completed"
	pgTasks.PaddingAXYTBLR = "a=4; x=?; y=?; t=?; b=?; l=?; r=?"
	pgTasks.ProgressType = "legend"
	pgTasks.RoundedBox = True
	pgTasks.Shadow = "lg"
	pgTasks.TextColor = "#000000"
	pgTasks.TextSize = "sm"
	pgTasks.TextVisible = True
	pgTasks.Value = 20
	BANano.Await(pgTasks.AddComponent)
```

Also used in: `pgProgress`, `pgValidation`
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


