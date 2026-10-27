---
name: SDUI5JsonTree
description: SithasoDaisy5 SDUI5JsonTree component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5JsonTree

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5JsonTree.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5JsonTree.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgJsonTree.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgJsonTree.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5JsonTree displays JSON as a collapsible tree. Use for inspecting JSON data.
_SDUI5JsonTree is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `ArrowColor` | String | #475872 | — | `setArrowColor` | `getArrowColor` |
| `FontSize` | Int | 12 | — | `setFontSize` | `getFontSize` |
| `Height` | String | 500px | — | `setHeight` | `getHeight` |
| `KeyColor` | String | #b16b2a | — | `setKeyColor` | `getKeyColor` |
| `LineHeight` | Int | 18 | — | `setLineHeight` | `getLineHeight` |
| `NodeBackgroundColor` | String | #f6f8fa | — | `setNodeBackgroundColor` | `getNodeBackgroundColor` |
| `NodeBorderColor` | String | #475872 | — | `setNodeBorderColor` | `getNodeBorderColor` |
| `Padding` | Int | 10 | — | `setPadding` | `getPadding` |
| `ValueColor` | String | #008000 | — | `setValueColor` | `getValueColor` |
| `Width` | String | 500px | — | `setWidth` | `getWidth` |
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

Wire in parent: `Sub jsontree_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (7)
- `AddComponent()` _(public)_
- `Clear()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `Refresh()` _(public)_
- `Remove()` _(public)_

## Key Setters (23)
- `setArrowColor(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setFontSize(i As Int)` _(public)_
- `setHeight(s As String)` _(public)_
- `setJSON(m As Map)` _(public)_
- `setJsonString(s As String)` _(public)_
- `setKeyColor(s As String)` _(public)_
- `setLineHeight(i As Int)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setNodeBackgroundColor(s As String)` _(public)_
- `setNodeBorderColor(s As String)` _(public)_
- `setPadding(i As Int)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setStyles(s As String)` _(public)_
- `setValueColor(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (25)
- `getArrowColor()` _(public)_
- `getAttributes()` _(public)_
- `getClasses()` _(public)_
- `getEnabled()` _(public)_
- `getFontSize()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getJSON()` _(public)_
- `getJsonString()` _(public)_
- `getKeyColor()` _(public)_
- `getLineHeight()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getNodeBackgroundColor()` _(public)_
- `getNodeBorderColor()` _(public)_
- `getPadding()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getStyles()` _(public)_
- `getValueColor()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgJsonTree.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgJsonTree.bas) (verified demo):

```b4j
Private jTree As SDUI5JsonTree		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim jsontree As SDUI5JsonTree
jsontree.Initialize(Me, "SDUI5JsonTree", "SDUI5JsonTree")
jsontree.ParentID = "placeholder"
BANano.Await(jsontree.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
