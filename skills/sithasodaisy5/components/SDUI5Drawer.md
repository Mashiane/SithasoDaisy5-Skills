---
name: SDUI5Drawer
description: SithasoDaisy5 SDUI5Drawer component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Drawer

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Drawer.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Drawer.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgIndex.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgIndex.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Drawer is a slide-in drawer (side panel). Content/children mount via `ParentID = drawerName`. Use for side navigation or detail panels. Show/Close control visibility.
_SDUI5Drawer is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `ReadMe` | String | Child Items _content, _side, _sidecontent, actions | — | — | — |
| `ParentID` | String | — | — | `setParentID` | `getParentID` |
| `Open` | Boolean | False | — | `setOpen` | `getOpen` |
| `SmOpen` | Boolean | False | — | `setSmOpen` | `getSmOpen` |
| `MdOpen` | Boolean | False | — | `setMdOpen` | `getMdOpen` |
| `LgOpen` | Boolean | False | — | `setLgOpen` | `getLgOpen` |
| `XlOpen` | Boolean | False | — | `setXlOpen` | `getXlOpen` |
| `Overlay` | Boolean | True | — | `setOverlay` | `getOverlay` |
| `BackgroundColor` | String | base-100 | — | `setBackgroundColor` | `getBackgroundColor` |
| `Height` | String | — | — | `setHeight` | `getHeight` |
| `MinHeight` | String | screen | — | `setMinHeight` | `getMinHeight` |
| `Width` | String | 80 | — | `setWidth` | `getWidth` |
| `MinWidth` | String | — | — | `setMinWidth` | `getMinWidth` |
| `RightSide` | Boolean | False | — | `setRightSide` | `getRightSide` |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |
| `Enabled` | Boolean | True | — | `setEnabled` | `getEnabled` |
| `Rounded` | String | none | 0, 2xl, 3xl, full, lg, md, none, rounded, sm, xl | `setRounded` | `getRounded` |
| `RoundedTopLeft` | String | — | none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 | `setRoundedTopLeft` | `getRoundedTopLeft` |
| `RoundedTopRight` | String | — | none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 | `setRoundedTopRight` | `getRoundedTopRight` |
| `RoundedBottomLeft` | String | — | none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 | `setRoundedBottomLeft` | `getRoundedBottomLeft` |
| `RoundedBottomRight` | String | — | none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 | `setRoundedBottomRight` | `getRoundedBottomRight` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
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
`Opened`

Wire in parent: `Sub drawer_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (10)
- `AddComponent()` _(public)_
- `ClearActions()` _(public)_
- `ClearMainContent()` _(public)_
- `ClearSideContent()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `ForceClose()` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `OpenDrawer(b As Boolean)` _(public)_
- `Remove()` _(public)_
- `ToggleDrawer()` _(public)_

## Key Setters (29)
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setLgOpen(b As Boolean)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setMdOpen(b As Boolean)` _(public)_
- `setMinHeight(s As String)` _(public)_
- `setMinWidth(s As String)` _(public)_
- `setOpen(b As Boolean)` _(public)_
- `setOverlay(b As Boolean)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRightSide(b As Boolean)` _(public)_
- `setRounded(s As String)` _(public)_
- `setRoundedBottomLeft(s As String)` _(public)_
- `setRoundedBottomRight(s As String)` _(public)_
- `setRoundedTopLeft(s As String)` _(public)_
- `setRoundedTopRight(s As String)` _(public)_
- `setShadow(s As String)` _(public)_
- `setSmOpen(b As Boolean)` _(public)_
- `setStyles(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_
- `setXlOpen(b As Boolean)` _(public)_

## Getters (31)
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getClasses()` _(public)_
- `getEnabled()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getLgOpen()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getMdOpen()` _(public)_
- `getMinHeight()` _(public)_
- `getMinWidth()` _(public)_
- `getOpen()` _(public)_
- `getOverlay()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRightSide()` _(public)_
- `getRounded()` _(public)_
- `getRoundedBottomLeft()` _(public)_
- `getRoundedBottomRight()` _(public)_
- `getRoundedTopLeft()` _(public)_
- `getRoundedTopRight()` _(public)_
- `getShadow()` _(public)_
- `getSmOpen()` _(public)_
- `getStyles()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_
- `getXlOpen()` _(public)_

## Private Methods (2)
- `DrawerToggle(e As BANanoEvent)` _(private)_
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgIndex.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgIndex.bas) (verified demo):

```b4j
Private appdrawer As SDUI5Drawer		'ignore
appdrawer.Initialize(Me, "appdrawer", "appdrawer")
appdrawer.ParentID = App.Here
appdrawer.MdOpen = True
BANano.Await(appdrawer.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `drawer`, `lg:drawer-open`, `md:drawer-open`, `drawer-open`, `drawer-end`, `sm:drawer-open`, `xl:drawer-open`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim drawer As SDUI5Drawer
drawer.Initialize(Me, "SDUI5Drawer", "SDUI5Drawer")
drawer.ParentID = "placeholder"
BANano.Await(drawer.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
