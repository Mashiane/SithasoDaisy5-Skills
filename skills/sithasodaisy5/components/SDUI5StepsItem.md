---
name: SDUI5StepsItem
description: SithasoDaisy5 SDUI5StepsItem component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5StepsItem

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5StepsItem.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5StepsItem.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgSteps.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgSteps.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5StepsItem is a single step in SDUI5Steps. Mount into steps via `ParentID = stepsName`. Holds label/content/color.
_SDUI5StepsItem is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `Text` | String | Text | — | `setText` | `getText` |
| `Color` | String | none | accent, error, info, neutral, none, primary, secondary, success, warning | `setColor` | `getColor` |
| `DataContent` | String | — | — | `setDataContent` | `getDataContent` |
| `Icon` | String | — | — | `setIcon` | `getIcon` |
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

Wire in parent: `Sub stepsitem_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (4)
- `AddComponent()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Remove()` _(public)_

## Key Setters (15)
- `setAttributes(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setColor(s As String)` _(public)_
- `setDataContent(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setIcon(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setStyles(s As String)` _(public)_
- `setText(text As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_

## Getters (17)
- `getAttributes()` _(public)_
- `getClasses()` _(public)_
- `getColor()` _(public)_
- `getDataContent()` _(public)_
- `getEnabled()` _(public)_
- `getHere()` As String _(public)_
- `getIcon()` _(public)_
- `getID()` As String _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getStyles()` _(public)_
- `getText()` _(public)_
- `getVisible()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgSteps.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgSteps.bas) (verified demo):

```b4j
Private SDUI5StepsItem1 As SDUI5StepsItem		'ignore
Private SDUI5StepsItem10 As SDUI5StepsItem		'ignore
Private SDUI5StepsItem11 As SDUI5StepsItem		'ignore
Private SDUI5StepsItem12 As SDUI5StepsItem		'ignore
Private SDUI5StepsItem13 As SDUI5StepsItem		'ignore
Private SDUI5StepsItem14 As SDUI5StepsItem		'ignore
Private SDUI5StepsItem15 As SDUI5StepsItem		'ignore
Private SDUI5StepsItem16 As SDUI5StepsItem		'ignore
Private SDUI5StepsItem17 As SDUI5StepsItem		'ignore
Private SDUI5StepsItem18 As SDUI5StepsItem		'ignore
Private SDUI5StepsItem19 As SDUI5StepsItem		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `step`
**Colors**: `step:sColor`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim stepsitem As SDUI5StepsItem
stepsitem.Initialize(Me, "SDUI5StepsItem", "SDUI5StepsItem")
stepsitem.ParentID = "placeholder"
BANano.Await(stepsitem.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
