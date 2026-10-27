---
name: SDUI5BottomNavigation
description: SithasoDaisy5 SDUI5BottomNavigation component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5BottomNavigation

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5BottomNavigation.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5BottomNavigation.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgBottomNav.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgBottomNav.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5BottomNavigation is a bottom nav bar (mobile). Children (nav items) mount via ParentID. Use for mobile app navigation.
_SDUI5BottomNavigation is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `ModelValue` | String | — | — | `setModelValue` | `getModelValue` |
| `ForegroundColor` | String | #42A5F5 | — | `setForegroundColor` | `getForegroundColor` |
| `BackgroundColor` | String | #FFFFFF | — | `setBackgroundColor` | `getBackgroundColor` |
| `BadgeColor` | String | #FBC02D | — | `setBadgeColor` | `getBadgeColor` |
| `IconColor` | String | #0000008A | — | `setIconColor` | `getIconColor` |
| `ReplaceRoute` | Boolean | False | — | `setReplaceRoute` | `getReplaceRoute` |
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

Wire in parent: `Sub bottomnavigation_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (11)
- `AddButton(id As String, icon As String, title As String, badge As String)` _(public)_
- `AddButtonItem(parentId As String, id As String, icon As String, title As String, badge As String)` _(public)_
- `AddComponent()` _(public)_
- `Clear()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Refresh()` _(public)_
- `Remove()` _(public)_
- `RemoveButton(buttonId As String)` As Boolean _(public)_
- `RemoveButtonItem(parentId As String, childId As String)` As Boolean _(public)_
- `UpdateBadge(id As String, badgeValue As Object)` As Boolean _(public)_

## Key Setters (21)
- `SetActive(id As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(c As String)` _(public)_
- `setBadgeColor(c As String)` _(public)_
- `SetButtonDisabled(id As String, disabled As Boolean)` _(public)_
- `SetButtonHidden(id As String, hidden As Boolean)` _(public)_
- `setClasses(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setForegroundColor(c As String)` _(public)_
- `setIconColor(c As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setModelValue(v As String)` _(public)_
- `SetOptions(OptionsList As List)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setReplaceRoute(b As Boolean)` _(public)_
- `setStyles(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_

## Getters (21)
- `GetActive()` As String _(public)_
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getBadgeColor()` _(public)_
- `getClasses()` _(public)_
- `getEnabled()` _(public)_
- `getForegroundColor()` _(public)_
- `GetHeight()` _(public)_
- `getHere()` As String _(public)_
- `getIconColor()` _(public)_
- `getID()` As String _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getModelValue()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` As String _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getReplaceRoute()` _(public)_
- `getStyles()` _(public)_
- `getVisible()` _(public)_

## Private Methods (2)
- `InternalChange(e As BANanoEvent)` _(private)_
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgBottomNav.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgBottomNav.bas) (verified demo):

```b4j
Private botNav As SDUI5BottomNavigation
botNav.Initialize(Me, "botNav", "botNav")
botNav.ParentID = app.PageView
BANano.Await(botNav.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim bottomnavigation As SDUI5BottomNavigation
bottomnavigation.Initialize(Me, "SDUI5BottomNavigation", "SDUI5BottomNavigation")
bottomnavigation.ParentID = "placeholder"
BANano.Await(bottomnavigation.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
