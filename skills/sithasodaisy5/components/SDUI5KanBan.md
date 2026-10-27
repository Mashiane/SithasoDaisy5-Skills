---
name: SDUI5KanBan
description: SithasoDaisy5 SDUI5KanBan component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5KanBan

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5KanBan.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5KanBan.bas)
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5KanBan is a kanban board with columns and draggable cards. Children (columns, cards) mount into the board via `ParentID`. Use for task/status workflows.
_SDUI5KanBan is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
## Skeleton Contract
Every SithasoDaisy5 component follows the same shape (see SDUI5Component base):
1. `Initialize(Callback, Name, EventName)` — sets `mCallBack`, `mName`, `mEventName`, calls `SetDefaults`.
2. `ParentID` (property / `setParentID(id)`) — attach point in the DOM.
3. `DesignerCreateView(Target, Props)` — INTERNAL (called by `AddComponent`, never from app code); reads `CustProps`, pushes daisyUI classes via `UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT`, appends `[BANCLEAN]<tag id="{name}">`, wires `UI.OnEvent`.
4. Live setters mutate the DOM via `UI.*ByID("{name}_child")`.

**Init signature**: `Initialize(CallBack As Object, cName As String, EventName As String)` | **Has DesignerCreateView**: Yes
## Designer Properties
| Key | Type | Default | List | Setter | Getter |
|---|---|---|---|---|---|
| `ParentID` | String | — | — | `setParentID` | `getParentID` |
| `DragBoards` | Boolean | true | — | `setDragBoards` | `getDragBoards` |
| `DragItems` | Boolean | true | — | `setDragItems` | `getDragItems` |
| `Gutter` | String | 15px | — | `setGutter` | `getGutter` |
| `WidthBoard` | String | 250px | — | `setWidthBoard` | `getWidthBoard` |
| `ResponsivePercentage` | Boolean | true | — | `setResponsivePercentage` | `getResponsivePercentage` |
| `ItemAddOptionsEnabled` | Boolean | False | — | `setItemAddOptionsEnabled` | `getItemAddOptionsEnabled` |
| `ItemAddOptionsClass` | String | — | — | `setItemAddOptionsClass` | `getItemAddOptionsClass` |
| `ItemAddOptionsContent` | String | — | — | `setItemAddOptionsContent` | `getItemAddOptionsContent` |
| `ItemAddOptionsFooter` | Boolean | False | — | `setItemAddOptionsFooter` | `getItemAddOptionsFooter` |
| `ItemHandleOptionsEnabled` | Boolean | False | — | `setItemHandleOptionsEnabled` | `getItemHandleOptionsEnabled` |
| `ItemHandleOptionsCustomCssIconHandler` | String | — | — | `setItemHandleOptionsCustomCssIconHandler` | `getItemHandleOptionsCustomCssIconHandler` |
| `ItemHandleOptionsCustomHandler` | String | — | — | `setItemHandleOptionsCustomHandler` | `getItemHandleOptionsCustomHandler` |
| `ItemHandleOptionsCustomCssHandler` | String | — | — | `setItemHandleOptionsCustomCssHandler` | `getItemHandleOptionsCustomCssHandler` |
| `ItemHandleOptionsHandleClass` | String | — | — | `setItemHandleOptionsHandleClass` | `getItemHandleOptionsHandleClass` |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |
| `MarginAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | `setMarginAXYTBLR` | `getMarginAXYTBLR` |
| `PaddingAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | `setPaddingAXYTBLR` | `getPaddingAXYTBLR` |
| `RawClasses` | String | — | — | `setClasses` | `getClasses` |
| `RawStyles` | String | — | — | `setStyles` | `getStyles` |
| `RawAttributes` | String | — | — | `setAttributes` | `getAttributes` |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
Where a designer key and method name differ, the method names shown are the source-verified mapping.
## Events
`ButtonClick`, `Click`, `Context`, `DragBoard`, `DragEl`, `DragEndBoard`, `DragEndEl`, `DropEl`, `DragItem`, `DragItemEnd`, `DropItem`, `ClickItem`, `ContextItem`

Wire in parent: `Sub kanban_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (8)
- `AddBoard(id As String, title As String, className As String, props As Map)` _(public)_
- `AddBoardItem(boardid As String, id As String, title As String, className As String, props As Map)` _(public)_
- `AddComponent()` _(public)_
- `Clear()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(CallBack As Object, cName As String, EventName As String)` _(public)_
- `LoadComponentJson(designName As String)` _(public)_
- `Refresh()` _(public)_

## Key Setters (21)
- `setAttributes(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setDragBoards(b As Boolean)` _(public)_
- `setDragItems(b As Boolean)` _(public)_
- `setGutter(s As String)` _(public)_
- `setItemAddOptionsClass(s As String)` _(public)_
- `setItemAddOptionsContent(s As String)` _(public)_
- `setItemAddOptionsEnabled(b As Boolean)` _(public)_
- `setItemAddOptionsFooter(b As Boolean)` _(public)_
- `setItemHandleOptionsCustomCssHandler(s As String)` _(public)_
- `setItemHandleOptionsCustomCssIconHandler(s As String)` _(public)_
- `setItemHandleOptionsCustomHandler(s As String)` _(public)_
- `setItemHandleOptionsEnabled(b As Boolean)` _(public)_
- `setItemHandleOptionsHandleClass(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setResponsivePercentage(b As Boolean)` _(public)_
- `setStyles(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidthBoard(s As String)` _(public)_

## Getters (23)
- `getAttributes()` _(public)_
- `getClasses()` _(public)_
- `getDragBoards()` _(public)_
- `getDragItems()` _(public)_
- `getGutter()` _(public)_
- `getHere()` _(public)_
- `getID()` _(public)_
- `getItemAddOptionsClass()` _(public)_
- `getItemAddOptionsContent()` _(public)_
- `getItemAddOptionsEnabled()` _(public)_
- `getItemAddOptionsFooter()` _(public)_
- `getItemHandleOptionsCustomCssHandler()` _(public)_
- `getItemHandleOptionsCustomCssIconHandler()` _(public)_
- `getItemHandleOptionsCustomHandler()` _(public)_
- `getItemHandleOptionsEnabled()` _(public)_
- `getItemHandleOptionsHandleClass()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getResponsivePercentage()` _(public)_
- `getStyles()` _(public)_
- `getVisible()` _(public)_
- `getWidthBoard()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim kanban As SDUI5KanBan
kanban.Initialize(Me, "SDUI5KanBan", "SDUI5KanBan")
kanban.ParentID = "placeholder"
BANano.Await(kanban.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
