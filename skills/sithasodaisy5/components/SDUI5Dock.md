---
name: SDUI5Dock
description: SithasoDaisy5 SDUI5Dock component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Dock

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Dock.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Dock.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgDock.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgDock.bas)
  - [`pgDockColor.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgDockColor.bas)
  - [`pgDockXS.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgDockXS.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Dock is a bottom dock (macOS-style) of icons/buttons. Children (buttons/icons) mount into the dock via `ParentID = dockName`. Use for app-style bottom navigation.
_SDUI5Dock is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `Size` | String | none | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `TextColor` | String | — | — | `setTextColor` | `getTextColor` |
| `BackgroundColor` | String | — | — | `setBackgroundColor` | `getBackgroundColor` |
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

Wire in parent: `Sub dock_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (5)
- `AddComponent()` _(public)_
- `Clear()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Remove()` _(public)_

## Key Setters (14)
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setSize(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setTextColor(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_

## Getters (16)
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getClasses()` _(public)_
- `getEnabled()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getSize()` _(public)_
- `getStyles()` _(public)_
- `getTextColor()` _(public)_
- `getVisible()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgDock.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgDock.bas) (verified demo):

```b4j
Private SDUI5Dock1 As SDUI5Dock		'ignore
SDUI5Dock1.Initialize(Me, "SDUI5Dock1", "SDUI5Dock1")
SDUI5Dock1.ParentID = app.PageView
BANano.Await(SDUI5Dock1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `dock`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim dock As SDUI5Dock
dock.Initialize(Me, "SDUI5Dock", "SDUI5Dock")
dock.ParentID = "placeholder"
BANano.Await(dock.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
