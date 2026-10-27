---
name: SDUI5Steps
description: SithasoDaisy5 SDUI5Steps component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Steps

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Steps.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Steps.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgSteps.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgSteps.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Steps is a step indicator (wizard progress). Step items (SDUI5StepsItem) mount via `ParentID = stepsName`. Use for multi-step flows. Set simple step labels via `.Steps` (NOT `.RawSteps`). For colored or customized steps, mount `SDUI5StepsItem` children with `.Color` and `.Text`.
_SDUI5Steps is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `Direction` | String | horizontal | horizontal, vertical | `setDirection` | `getDirection` |
| `TextSize` | String | sm | 2xl, 3xl, 4xl, 5xl, 6xl, 7xl, 8xl, 9xl, base, lg, md, none, sm, xl, xs | `setTextSize` | `getTextSize` |
| `RawSteps` | String | Register;Choose Plan;Purchase;Receive Product | — | `setSteps` | `getSteps` |
| `ActiveStep` | String | 1 | — | `setActiveStep` | `getActiveStep` |
| `StepsColor` | String | primary | accent, error, info, neutral, none, primary, secondary, success, warning | `setStepsColor` | `getStepsColor` |
| `SMDirection` | String | none | horizontal, none, vertical | `setSMDirection` | `getSMDirection` |
| `MDDirection` | String | none | horizontal, none, vertical | `setMDDirection` | `getMDDirection` |
| `LGDirection` | String | none | horizontal, none, vertical | `setLGDirection` | `getLGDirection` |
| `XLDirection` | String | none | horizontal, none, vertical | `setXLDirection` | `getXLDirection` |
| `Rounded` | String | none | 2xl, 3xl, full, lg, md, none, rounded, sm, xl, 0 | `setRounded` | `getRounded` |
| `RoundedBox` | Boolean | False | — | `setRoundedBox` | `getRoundedBox` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `OverflowXAuto` | Boolean | False | — | `setOverflowXAuto` | `getOverflowXAuto` |
| `Height` | String | — | — | `setHeight` | `getHeight` |
| `Width` | String | full | — | `setWidth` | `getWidth` |
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

Wire in parent: `Sub steps_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (6)
- `AddComponent()` _(public)_
- `AddStep(stepName As String)` _(public)_
- `Clear()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Remove()` _(public)_

## Key Setters (26)
- `setActiveStep(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setDirection(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setLGDirection(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setMDDirection(s As String)` _(public)_
- `setOverflowXAuto(b As Boolean)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRounded(s As String)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setSMDirection(s As String)` _(public)_
- `setSteps(s As String)` _(public)_
- `setStepsColor(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setTextSize(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_
- `setXLDirection(s As String)` _(public)_

## Getters (28)
- `getActiveStep()` _(public)_
- `getAttributes()` _(public)_
- `getClasses()` _(public)_
- `getDirection()` _(public)_
- `getEnabled()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getLGDirection()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getMDDirection()` _(public)_
- `getOverflowXAuto()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRounded()` _(public)_
- `getRoundedBox()` _(public)_
- `getShadow()` _(public)_
- `getSMDirection()` _(public)_
- `getSteps()` _(public)_
- `getStepsColor()` _(public)_
- `getStyles()` _(public)_
- `getTextSize()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_
- `getXLDirection()` _(public)_

## Private Methods (2)
- `ChangeStep(e As BANanoEvent)` _(private)_
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgSteps.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgSteps.bas) (verified demo):

```b4j
Private SDUI5Steps6 As SDUI5Steps		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `rounded-box`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim steps As SDUI5Steps
steps.Initialize(Me, "SDUI5Steps", "SDUI5Steps")
steps.ParentID = "placeholder"
BANano.Await(steps.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
