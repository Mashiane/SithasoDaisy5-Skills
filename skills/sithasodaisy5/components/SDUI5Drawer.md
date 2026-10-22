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
## Public Methods (12)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `ClearMainContent()` _(public)_
- `ClearSideContent()` _(public)_
- `ClearActions()` _(public)_
- `ForceClose()` _(public)_
- `OpenDrawer(b As Boolean)` _(public)_
- `ToggleDrawer()` _(public)_
## Key Setters (28)
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
- `setRounded(s As String)` As 'ignoredeadcode _(public)_
- `setRoundedBottomLeft(s As String)` As 'ignoredeadcode _(public)_
- `setRoundedBottomRight(s As String)` As 'ignoredeadcode _(public)_
- `setRoundedTopLeft(s As String)` As 'ignoredeadcode _(public)_
- `setRoundedTopRight(s As String)` As 'ignoredeadcode _(public)_
- `setShadow(s As String)` As 'ignoredeadcode _(public)_
- `setMinHeight(s As String)` As 'ignoredeadcode _(public)_
- `setMinWidth(s As String)` As 'ignoredeadcode _(public)_
- `setBackgroundColor(s As String)` As 'ignoredeadcode _(public)_
- `setWidth(s As String)` As 'ignoredeadcode _(public)_
- `setHeight(s As String)` As 'ignoredeadcode _(public)_
- `setLgOpen(b As Boolean)` _(public)_
- `setMdOpen(b As Boolean)` _(public)_
- `setOpen(b As Boolean)` _(public)_
- `setOverlay(b As Boolean)` As 'ignoredeadcode _(public)_
- `setRightSide(b As Boolean)` _(public)_
- `setSmOpen(b As Boolean)` _(public)_
- `setXlOpen(b As Boolean)` _(public)_
## Getters (30)
- `getID()` As String _(public)_
- `getParentID()` As String _(public)_
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
- `getRounded()` As String _(public)_
- `getRoundedBottomLeft()` As String _(public)_
- `getRoundedBottomRight()` As String _(public)_
- `getRoundedTopLeft()` As String _(public)_
- `getRoundedTopRight()` As String _(public)_
- `getShadow()` As String _(public)_
- `getMinHeight()` As String _(public)_
- `getMinWidth()` As String _(public)_
- `getWidth()` As String _(public)_
- `getHeight()` As String _(public)_
- `getBackgroundColor()` As String _(public)_
- `getLgOpen()` As Boolean _(public)_
- `getMdOpen()` As Boolean _(public)_
- `getOpen()` As Boolean _(public)_
- `getOverlay()` As Boolean _(public)_
- `getRightSide()` As Boolean _(public)_
- `getSmOpen()` As Boolean _(public)_
- `getXlOpen()` As Boolean _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgIndex.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgIndex.bas) (verified demo). `appdrawer` = a SDUI5Drawer.

```b4j
	appdrawer.Initialize(Me, "appdrawer", "appdrawer")
	appdrawer.ParentID = App.Here
	appdrawer.MdOpen = True
	BANano.Await(appdrawer.AddComponent)
```

Composite structure — children mount into sub-regions: a `drawerNav` inside `appdrawer_sidecontent`:

```b4j
	drawerNav.Initialize(Me, "drawerNav", "drawerNav")
	drawerNav.ParentID = "appdrawer_sidecontent"
	drawerNav.BackgroundColor = "base-200"
	drawerNav.HasBurger = False
	drawerNav.LogoMask = "squircle"
	drawerNav.PaddingAXYTBLR = "a=2; x=?; y=?; t=?; b=?; l=?; r=?"
	drawerNav.Shadow = "lg"
	drawerNav.Title = "SithasoDaisy 5 Beta 11"
	drawerNav.Width = "full"
	BANano.Await(drawerNav.AddComponent)
```

Demo-wired events: `Opened` — handlers named `appdrawer_<Event>`.
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


