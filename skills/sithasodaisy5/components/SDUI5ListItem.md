---
name: SDUI5ListItem
description: SithasoDaisy5 SDUI5ListItem component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5ListItem

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5ListItem.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5ListItem.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgLIst.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgLIst.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5ListItem is a single list row container. Holds text directly via `.Text`, or hosts child components (`SDUI5Image`, `SDUI5Text`, `SDUI5Button`) for rich multi-element list rows. It does NOT have `.Title`, `.SubTitle`, `.Color`, or `.Active` properties.
_SDUI5ListItem is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `BackgroundColor` | String | — | — | `setBackgroundColor` | `getBackgroundColor` |
| `CursorPointer` | Boolean | True | — | `setCursorPointer` | `getCursorPointer` |
| `ListRow` | Boolean | True | — | `setListRow` | `getListRow` |
| `Opacity` | Int | 100, MinRange: 0, MaxRange: 100 | — | `setOpacity` | `getOpacity` |
| `TextColor` | String | none | accent, error, info, neutral, none, primary, secondary, success, warning | `setTextColor` | `getTextColor` |
| `TextSize` | String | none | lg, md, none, sm, xl, xs | `setTextSize` | `getTextSize` |
| `Tracking` | String | none | none, normal, tight, tighter, wide, wider, widest | `setTracking` | `getTracking` |
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

Wire in parent: `Sub listitem_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (5)
- `AddComponent()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `OnEvent(event As String, MethodName As String)` _(public)_
- `Remove()` _(public)_

## Key Setters (19)
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setCursorPointer(b As Boolean)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setListRow(b As Boolean)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setOpacity(i As Int)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setStyles(s As String)` _(public)_
- `setText(s As String)` _(public)_
- `setTextColor(s As String)` _(public)_
- `setTextSize(s As String)` _(public)_
- `setTracking(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_

## Getters (21)
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getClasses()` _(public)_
- `getCursorPointer()` _(public)_
- `getEnabled()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getListRow()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getOpacity()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getStyles()` _(public)_
- `getText()` _(public)_
- `getTextColor()` _(public)_
- `getTextSize()` _(public)_
- `getTracking()` _(public)_
- `getVisible()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgLIst.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgLIst.bas) (verified demo):

```b4j
Private SDUI5ListItem1 As SDUI5ListItem		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `cursor-pointer`, `list-row`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim listitem As SDUI5ListItem
listitem.Initialize(Me, "SDUI5ListItem", "SDUI5ListItem")
listitem.ParentID = "placeholder"
BANano.Await(listitem.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
