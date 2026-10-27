---
name: SDUI5TreeView
description: SithasoDaisy5 SDUI5TreeView component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5TreeView

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5TreeView.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5TreeView.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgTreeView.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTreeView.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5TreeView is a tree view. Nodes mount via ParentID. Use for hierarchical data.
_SDUI5TreeView is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `ItemColor` | String | primary | — | `setItemColor` | `getItemColor` |
| `ItemActiveColor` | String | — | — | `setItemActiveColor` | `getItemActiveColor` |
| `ItemFocusColor` | String | — | — | `setItemFocusColor` | `getItemFocusColor` |
| `ItemHoverColor` | String | — | — | `setItemHoverColor` | `getItemHoverColor` |
| `Height` | String | full | — | `setHeight` | `getHeight` |
| `Width` | String | 200px | — | `setWidth` | `getWidth` |
| `CollapseIconUrl` | String | ./assets/chevron-right-solid.svg | — | `setCollapseIconUrl` | `getCollapseIconUrl` |
| `ExpandIconUrl` | String | ./assets/chevron-down-solid.svg | — | `setExpandIconUrl` | `getExpandIconUrl` |
| `DragNDrop` | Boolean | True | — | `setDragNDrop` | `getDragNDrop` |
| `HasCheckbox` | Boolean | False | — | `setHasCheckbox` | `getHasCheckbox` |
| `IconHeight` | String | 16px | — | `setIconHeight` | `getIconHeight` |
| `IconWidth` | String | 16px | — | `setIconWidth` | `getIconWidth` |
| `InlineEdit` | Boolean | False | — | `setInlineEdit` | `getInlineEdit` |
| `MultipleCheck` | Boolean | False | — | `setMultipleCheck` | `getMultipleCheck` |
| `MultipleSelect` | Boolean | False | — | `setMultipleSelect` | `getMultipleSelect` |
| `Size` | String | md | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `CheckBoxSize` | String | md | lg, md, none, sm, xl, xs | `setCheckBoxSize` | `getCheckBoxSize` |
| `TextBoxSize` | String | sm | lg, md, none, sm, xl, xs | `setTextBoxSize` | `getTextBoxSize` |
| `CheckBoxActiveColor` | String | — | — | `setCheckBoxActiveColor` | `getCheckBoxActiveColor` |
| `CheckBoxActiveBorderColor` | String | — | — | `setCheckBoxActiveBorderColor` | `getCheckBoxActiveBorderColor` |
| `Replace` | Boolean | False | — | `setReplace` | `getReplace` |
| `UseLocalstorage` | Boolean | True | — | `setUseLocalstorage` | `getUseLocalstorage` |
| `BackgroundColor` | String | — | — | `setBackgroundColor` | `getBackgroundColor` |
| `Rounded` | String | — | none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 | `setRounded` | `getRounded` |
| `RoundedBox` | Boolean | False | — | `setRoundedBox` | `getRoundedBox` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
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
`nodeDrop`, `nodeDragStart`, `nodeExpanded`, `nodeCollapsed`, `nodeEdited`, `nodeSelected`, `nodesSelected`, `nodesChecked`, `nodeClick`, `nodeEditCancelled`

Wire in parent: `Sub treeview_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (32)
- `AddComponent()` _(public)_
- `addNode(parentId As String, nodeId As String, iconUrl As String, text As String, href As String)` _(public)_
- `addNodeAfter(targetId As String, nodeId As String, iconUrl As String, text As String, href As String)` _(public)_
- `addNodeBefore(targetId As String, nodeId As String, iconUrl As String, text As String, href As String)` _(public)_
- `checkNode(nodeId As String, b As Boolean)` _(public)_
- `checkNodes(nodes As List)` _(public)_
- `Clear()` _(public)_
- `clearChecked()` _(public)_
- `clearSelected()` _(public)_
- `collapseAll()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `enableInlineEditing(nodeId As String)` _(public)_
- `enableNode(nodeId As String, state As Boolean)` _(public)_
- `expandAll()` _(public)_
- `expandNode(nodeId As String, state As Boolean)` _(public)_
- `findNode(nodeID As String)` As Map _(public)_
- `hideNode(nodeId As String)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `nodeExists(nodeID As String)` As Boolean _(public)_
- `nodeMoveDown(nodeId As String)` _(public)_
- `nodeMoveLeft(nodeId As String)` _(public)_
- `nodeMoveRight(nodeId As String)` _(public)_
- `nodeMoveUp(nodeId As String)` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `Refresh()` _(public)_
- `Remove()` _(public)_
- `removeChildren(nodeId As String)` _(public)_
- `removeNode(nodeId As String)` _(public)_
- `selectNode(nodeId As String, state As Boolean)` _(public)_
- `selectNodes(nodes As List)` _(public)_
- `showNode(nodeId As String)` _(public)_
- `updateNode(nodeId As String, iconUrl As String, text As String, href As String)` _(public)_

## Key Setters (37)
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setCheckBoxActiveBorderColor(s As String)` _(public)_
- `setCheckBoxActiveColor(s As String)` _(public)_
- `setCheckBoxSize(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setCollapseIconUrl(s As String)` _(public)_
- `setDragNDrop(b As Boolean)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setExpandIconUrl(s As String)` _(public)_
- `setHasCheckbox(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setIconHeight(s As String)` _(public)_
- `setIconWidth(s As String)` _(public)_
- `setInlineEdit(b As Boolean)` _(public)_
- `setItemActiveColor(s As String)` _(public)_
- `setItemColor(s As String)` _(public)_
- `setItemFocusColor(s As String)` _(public)_
- `setItemHoverColor(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setMultipleCheck(b As Boolean)` _(public)_
- `setMultipleSelect(b As Boolean)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setReplace(b As Boolean)` _(public)_
- `setRounded(s As String)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setSize(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setTextBoxSize(s As String)` _(public)_
- `setUseLocalstorage(b As Boolean)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (46)
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getCheckBoxActiveBorderColor()` _(public)_
- `getCheckBoxActiveColor()` _(public)_
- `getCheckBoxSize()` _(public)_
- `getCheckedNodes()` _(public)_
- `getChildren(nodeId As String)` As List _(public)_
- `getClasses()` _(public)_
- `getCollapseIconUrl()` _(public)_
- `getDragNDrop()` _(public)_
- `getEnabled()` _(public)_
- `getExpandIconUrl()` _(public)_
- `getHasCheckbox()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getIconHeight()` _(public)_
- `getIconWidth()` _(public)_
- `getID()` As String _(public)_
- `getInlineEdit()` _(public)_
- `getItemActiveColor()` _(public)_
- `getItemColor()` _(public)_
- `getItemFocusColor()` _(public)_
- `getItemHoverColor()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getMultipleCheck()` _(public)_
- `getMultipleSelect()` _(public)_
- `GetNodeFromEvent(e As BANanoEvent)` As TreeNode _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getReplace()` _(public)_
- `getRounded()` _(public)_
- `getRoundedBox()` _(public)_
- `getSelectedNode(includeChildren As Boolean)` As Object _(public)_
- `getSelectedNodes()` _(public)_
- `getShadow()` _(public)_
- `getSize()` _(public)_
- `getStyles()` _(public)_
- `getTextBoxSize()` _(public)_
- `GetTreeList()` _(public)_
- `GetTreeMap()` _(public)_
- `getUseLocalstorage()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_

## Private Methods (2)
- `BuildTree()` _(private)_
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgTreeView.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTreeView.bas) (verified demo):

```b4j
Private treeView As SDUI5TreeView		'ignore
Private tv2 As SDUI5TreeView		'ignore
BANano.Await(app.UsesTreeView)
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `menu`, `overflow-y-auto`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim treeview As SDUI5TreeView
treeview.Initialize(Me, "SDUI5TreeView", "SDUI5TreeView")
treeview.ParentID = "placeholder"
BANano.Await(treeview.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
