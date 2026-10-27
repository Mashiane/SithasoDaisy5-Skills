---
name: SDUI5JsonEditor
description: SithasoDaisy5 SDUI5JsonEditor component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5JsonEditor

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5JsonEditor.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5JsonEditor.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgJSONEditor.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgJSONEditor.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5JsonEditor is a JSON editor with validation. Use for editing JSON data.
_SDUI5JsonEditor is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `Title` | String | — | — | `setTitle` | `getTitle` |
| `Mode` | String | view | code, form, preview, text, tree, view | `setMode` | `getMode` |
| `Path` | String | — | — | `setPath` | `getPath` |
| `Height` | String | 500px | — | `setHeight` | `getHeight` |
| `Width` | String | 500px | — | `setWidth` | `getWidth` |
| `ButtonSize` | String | md | lg, md, sm, xs, none | `setButtonSize` | `getButtonSize` |
| `ButtonsOutlined` | Boolean | False | — | `setButtonsOutlined` | `getButtonsOutlined` |
| `HasUpload` | Boolean | True | — | `setHasUpload` | `getHasUpload` |
| `HasSave` | Boolean | True | — | `setHasSave` | `getHasSave` |
| `HasDownload` | Boolean | True | — | `setHasDownload` | `getHasDownload` |
| `HasRefresh` | Boolean | False | — | `setHasRefresh` | `getHasRefresh` |
| `HasBack` | Boolean | True | — | `setHasBack` | `getHasBack` |
| `Shadow` | String | lg | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `Rounded` | String | lg | square, circle, none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 | `setRounded` | `getRounded` |
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
`OnError`, `OnChange`, `Save`, `Download`, `Refresh`, `Back`, `CustomButton`

Wire in parent: `Sub jsoneditor_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (20)
- `AddComponent()` _(public)_
- `AddToolbarActionButton(btnID As String, btnCaption As String, btnColor As String)` As SDUI5Button _(public)_
- `AddToolbarActionButtonIcon(btnID As String, sIcon As String, btnColor As String, iconColor As String)` As SDUI5Button _(public)_
- `AddToolbarButton(btnID As String, btnCaption As String, btnColor As String)` As SDUI5Button _(public)_
- `AddToolbarButtonIcon(btnID As String, sIcon As String, btnColor As String, iconColor As String)` As SDUI5Button _(public)_
- `AddToolbarFileUpload(btnID As String, sIcon As String, btnColor As String, bMultiple As Boolean)` As SDUI5Button _(public)_
- `CollapseAll()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `ExpandAll()` _(public)_
- `FileNullify()` _(public)_
- `Focus()` _(public)_
- `HideActions()` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `MoveBackButton()` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `Refresh()` _(public)_
- `Remove()` _(public)_
- `ShowActions()` _(public)_
- `ToJson()` As Object _(public)_
- `ToString()` As String _(public)_

## Key Setters (41)
- `setAttributes(s As String)` _(public)_
- `setButtonSize(s As String)` _(public)_
- `setButtonsOutlined(b As Boolean)` _(public)_
- `setClasses(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setHasBack(b As Boolean)` _(public)_
- `setHasDownload(b As Boolean)` _(public)_
- `setHasRefresh(b As Boolean)` _(public)_
- `setHasSave(b As Boolean)` _(public)_
- `setHasUpload(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setJson(s As Object)` _(public)_
- `setJsonString(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setMode(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPath(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRounded(s As String)` _(public)_
- `setShadow(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setTitle(s As String)` _(public)_
- `SetToolbarButtonBadge(btn As String, value As String)` _(public)_
- `SetToolbarButtonBadgeColor(btn As String, value As String)` _(public)_
- `SetToolbarButtonBadgeRound(btn As String)` _(public)_
- `SetToolbarButtonBadgeSize(btn As String, value As String)` _(public)_
- `SetToolbarButtonBadgeTextColor(btn As String, value As String)` _(public)_
- `SetToolbarButtonColor(btn As String, value As String)` _(public)_
- `SetToolbarButtonDisabled(btn As String, b As Boolean)` _(public)_
- `SetToolbarButtonEnable(btn As String, b As Boolean)` _(public)_
- `SetToolbarButtonLoading(btn As String, b As Boolean)` _(public)_
- `SetToolbarButtonTextColor(btn As String, value As String)` _(public)_
- `SetToolbarButtonTextColorWhite(id As String)` _(public)_
- `SetToolbarButtonToolTip(btnID As String, tooltip As String, color As String, position As String)` _(public)_
- `SetToolbarButtonVisible(btn As String, value As Boolean)` _(public)_
- `setValue(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (31)
- `getAttributes()` _(public)_
- `getButtonSize()` _(public)_
- `getButtonsOutlined()` _(public)_
- `getClasses()` _(public)_
- `getEnabled()` _(public)_
- `getHasBack()` _(public)_
- `getHasDownload()` _(public)_
- `getHasRefresh()` _(public)_
- `getHasSave()` _(public)_
- `getHasUpload()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getJson()` _(public)_
- `getJsonString()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getMode()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPath()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRounded()` _(public)_
- `getShadow()` _(public)_
- `getStyles()` _(public)_
- `getTitle()` _(public)_
- `getToolBarButtonID(btnID As String)` As String _(public)_
- `getValue()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_

## Private Methods (2)
- `SetDefaults()` _(private)_
- `UploadToolbarHandler(e As BANanoEvent)` _(private)_

## Verified Demo Usage

Real syntax from [`pgJSONEditor.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgJSONEditor.bas) (verified demo):

```b4j
Private jEdit As SDUI5JsonEditor		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim jsoneditor As SDUI5JsonEditor
jsoneditor.Initialize(Me, "SDUI5JsonEditor", "SDUI5JsonEditor")
jsoneditor.ParentID = "placeholder"
BANano.Await(jsoneditor.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
