---
name: SDUI5ContextMenu
description: SithasoDaisy5 SDUI5ContextMenu component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5ContextMenu

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5ContextMenu.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5ContextMenu.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgTreeView.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTreeView.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5ContextMenu is a right-click context menu. Menu items mount via `ParentID = menuName`. Use for contextual actions.
_SDUI5ContextMenu is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `Target` | String | — | — | `setTarget` | `getTarget` |
| `Size` | String | md | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `Width` | String | 56 | — | `setWidth` | `getWidth` |
| `BackgroundColor` | String | base-200 | — | `setBackgroundColor` | `getBackgroundColor` |
| `Horizontal` | Boolean | False | — | `setHorizontal` | `getHorizontal` |
| `IconHeight` | String | 16px | — | `setIconHeight` | `getIconHeight` |
| `IconWidth` | String | 16px | — | `setIconWidth` | `getIconWidth` |
| `ItemActiveColor` | String | — | — | `setItemActiveColor` | `getItemActiveColor` |
| `ItemColor` | String | primary | — | `setItemColor` | `getItemColor` |
| `ItemFocusColor` | String | — | — | `setItemFocusColor` | `getItemFocusColor` |
| `ItemHoverColor` | String | — | — | `setItemHoverColor` | `getItemHoverColor` |
| `RoundedBox` | Boolean | True | — | `setRoundedBox` | `getRoundedBox` |
| `Shadow` | String | lg | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |
| `Enabled` | Boolean | True | — | `setEnabled` | `getEnabled` |
| `MarginAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | `setMarginAXYTBLR` | `getMarginAXYTBLR` |
| `PaddingAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | `setPaddingAXYTBLR` | `getPaddingAXYTBLR` |
| `RawClasses` | String | — | — | `setClasses` | `getClasses` |
| `RawStyles` | String | — | — | `setStyles` | `getStyles` |
| `RawAttributes` | String | — | — | `setAttributes` | `getAttributes` |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
Where a designer key and method name differ, the method names shown are the source-verified mapping.
## Events
`ItemClick`

Wire in parent: `Sub contextmenu_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (9)
- `AddComponent()` _(public)_
- `AddItem(parentId As String, nodeId As String, iconUrl As String, label As String)` _(public)_
- `Clear()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `Refresh()` _(public)_
- `Remove()` _(public)_
- `UpdateSettings()` _(public)_

## Key Setters (22)
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setHorizontal(b As Boolean)` _(public)_
- `setIconHeight(s As String)` _(public)_
- `setIconWidth(s As String)` _(public)_
- `setItemActiveColor(s As String)` _(public)_
- `setItemColor(s As String)` _(public)_
- `setItemFocusColor(s As String)` _(public)_
- `setItemHoverColor(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setSize(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setTarget(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (24)
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getClasses()` _(public)_
- `getEnabled()` _(public)_
- `getHere()` As String _(public)_
- `getHorizontal()` _(public)_
- `getIconHeight()` _(public)_
- `getIconWidth()` _(public)_
- `getID()` As String _(public)_
- `getItemActiveColor()` _(public)_
- `getItemColor()` _(public)_
- `getItemFocusColor()` _(public)_
- `getItemHoverColor()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `GetProperties()` _(public)_
- `getRoundedBox()` _(public)_
- `getShadow()` _(public)_
- `getSize()` _(public)_
- `getStyles()` _(public)_
- `getTarget()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgTreeView.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTreeView.bas) (verified demo):

```b4j
Private cmenu1 As SDUI5ContextMenu		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim contextmenu As SDUI5ContextMenu
contextmenu.Initialize(Me, "SDUI5ContextMenu", "SDUI5ContextMenu")
contextmenu.ParentID = "placeholder"
BANano.Await(contextmenu.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
