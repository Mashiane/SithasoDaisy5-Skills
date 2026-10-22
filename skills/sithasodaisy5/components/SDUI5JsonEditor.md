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
| `ButtonSize` | String | md | lg, md, sm, xs, none | — | — |
| `ButtonsOutlined` | Boolean | False | — | — | — |
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
## Public Methods (30)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `HideActions()` _(public)_
- `ShowActions()` _(public)_
- `Refresh()` _(public)_
- `SetToolbarButtonBadge(btn As String, value As String)` _(public)_
- `SetToolbarButtonBadgeColor(btn As String, value As String)` _(public)_
- `SetToolbarButtonBadgeSize(btn As String, value As String)` _(public)_
- `SetToolbarButtonBadgeRound(btn As String)` _(public)_
- `SetToolbarButtonBadgeTextColor(btn As String, value As String)` _(public)_
- `SetToolbarButtonTextColor(btn As String, value As String)` As 'ignoredeadcode _(public)_
- `SetToolbarButtonVisible(btn As String, value As Boolean)` _(public)_
- `SetToolbarButtonColor(btn As String, value As String)` _(public)_
- `SetToolbarButtonDisabled(btn As String, b As Boolean)` _(public)_
- `SetToolbarButtonEnable(btn As String, b As Boolean)` _(public)_
- `SetToolbarButtonLoading(btn As String, b As Boolean)` _(public)_
- `FileNullify()` _(public)_
- `MoveBackButton()` As 'ignoredeadcode _(public)_
- `AddToolbarButton(btnID As String, btnCaption As String, btnColor As String)` As SDUI5Button _(public)_
- `AddToolbarActionButton(btnID As String, btnCaption As String, btnColor As String)` As SDUI5Button		'ignoredeadcode _(public)_
- `SetToolbarButtonToolTip(btnID As String, tooltip As String, color As String, position As String)` As 'ignoredeadcode _(public)_
- `AddToolbarButtonIcon(btnID As String, sIcon As String, btnColor As String, iconColor As String)` As SDUI5Button			'ignoredeadcode _(public)_
- `SetToolbarButtonTextColorWhite(id As String)` _(public)_
- `AddToolbarActionButtonIcon(btnID As String, sIcon As String, btnColor As String, iconColor As String)` As SDUI5Button			'ignoredeadcode _(public)_
- `AddToolbarFileUpload(btnID As String, sIcon As String, btnColor As String, bMultiple As Boolean)` As SDUI5Button		'ignoredeadcode _(public)_
## Key Setters (25)
- `setShadow(s As String)` _(public)_
- `setRounded(s As String)` _(public)_
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
- `setValue(s As String)` _(public)_
- `setPath(s As String)` _(public)_
- `setTitle(s As String)` _(public)_
- `setJsonString(s As String)` _(public)_
- `setJson(s As Object)` _(public)_
- `setHeight(s As String)` _(public)_
- `setMode(s As String)` _(public)_
- `setWidth(s As String)` _(public)_
- `setHasRefresh(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHasBack(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHasDownload(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHasSave(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHasUpload(b As Boolean)` As 'ignoredeadcode _(public)_
## Getters (28)
- `getID()` As String _(public)_
- `getShadow()` As String _(public)_
- `getRounded()` As String _(public)_
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
- `getValue()` As String _(public)_
- `getPath()` As String _(public)_
- `getTitle()` As String _(public)_
- `getJsonString()` As String _(public)_
- `getJson()` As Object _(public)_
- `getHeight()` As String _(public)_
- `getMode()` As String _(public)_
- `getWidth()` As String _(public)_
- `getHasRefresh()` As Boolean _(public)_
- `getHasBack()` As Boolean _(public)_
- `getHasSave()` As Boolean _(public)_
- `getHasUpload()` As Boolean _(public)_
- `getHasDownload()` As Boolean _(public)_
- `getToolBarButtonID(btnID As String)` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgJSONEditor.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgJSONEditor.bas) (verified demo). `jEdit` = a SDUI5JsonEditor.

```b4j
	jEdit.Initialize(Me, "jEdit", "jEdit")
	jEdit.ParentID = "SDUI5Column1"
	jEdit.Height = "700px"
	jEdit.Mode = "tree"
	jEdit.Width = "full"
	jEdit.HasRefresh = True
	jEdit.Path = "./assets/baselayout.json"
	jEdit.Title = "Base Layout"
	BANano.Await(jEdit.AddComponent)
```

Demo-wired events: `OnError` — handlers named `jEdit_<Event>`.
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


