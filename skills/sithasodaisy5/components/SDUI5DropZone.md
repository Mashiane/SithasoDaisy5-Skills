---
name: SDUI5DropZone
description: SithasoDaisy5 SDUI5DropZone component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5DropZone

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5DropZone.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5DropZone.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgDropZone.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgDropZone.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5DropZone is a drag-and-drop file upload zone. Use for file uploads with preview.
_SDUI5DropZone is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `Url` | String | ./assets/upload.php | — | `setUrl` | `getUrl` |
| `ParamName` | String | upload | — | `setParamName` | `getParamName` |
| `AutoProcessQueue` | Boolean | True | — | `setAutoProcessQueue` | `getAutoProcessQueue` |
| `UploadMultiple` | Boolean | False | — | `setUploadMultiple` | `getUploadMultiple` |
| `AcceptedFiles` | String | — | — | `setAcceptedFiles` | `getAcceptedFiles` |
| `AddRemoveLinks` | Boolean | True | — | `setAddRemoveLinks` | `getAddRemoveLinks` |
| `Capture` | String | — | camcorder, camera, microphone | `setCapture` | `getCapture` |
| `DisablePreviews` | Boolean | False | — | `setDisablePreviews` | `getDisablePreviews` |
| `Height` | String | 500px | — | `setHeight` | `getHeight` |
| `Width` | String | 500px | — | `setWidth` | `getWidth` |
| `MaxFilesize` | Int | 2 | — | `setMaxFilesize` | `getMaxFilesize` |
| `ParallelUploads` | Int | 2 | — | `setParallelUploads` | `getParallelUploads` |
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
`Complete`

Wire in parent: `Sub dropzone_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (13)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `ProcessQueue()` _(public)_
- `RemoveFile(fileObj As Object)` _(public)_
- `RemoveAllFiles()` _(public)_
- `CancelUploads()` _(public)_
- `GetFiles()` As List _(public)_
- `Refresh()` _(public)_
## Key Setters (24)
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
- `setAutoProcessQueue(b As Boolean)` _(public)_
- `setAcceptedFiles(s As String)` _(public)_
- `setAddRemoveLinks(b As Boolean)` _(public)_
- `setCapture(s As String)` _(public)_
- `setDisablePreviews(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setMaxFilesize(i As Int)` _(public)_
- `setParallelUploads(i As Int)` _(public)_
- `setParamName(s As String)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setUploadMultiple(b As Boolean)` _(public)_
- `setUrl(s As String)` _(public)_
- `setWidth(s As String)` _(public)_
## Getters (26)
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
- `getAutoProcessQueue()` As Boolean _(public)_
- `getAcceptedFiles()` As String _(public)_
- `getAddRemoveLinks()` As Boolean _(public)_
- `getCapture()` As String _(public)_
- `getDisablePreviews()` As Boolean _(public)_
- `getHeight()` As String _(public)_
- `getMaxFilesize()` As Int _(public)_
- `getParallelUploads()` As Int _(public)_
- `getParamName()` As String _(public)_
- `getRoundedBox()` As Boolean _(public)_
- `getShadow()` As String _(public)_
- `getUploadMultiple()` As Boolean _(public)_
- `getUrl()` As String _(public)_
- `getWidth()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgDropZone.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgDropZone.bas) (verified demo). `SDUI5DropZone1` = a SDUI5DropZone.

```b4j
	SDUI5DropZone1.Initialize(Me, "SDUI5DropZone1", "SDUI5DropZone1")
	SDUI5DropZone1.ParentID = "SDUI5Column1"
	SDUI5DropZone1.RoundedBox = True
	SDUI5DropZone1.Shadow = "lg"
	BANano.Await(SDUI5DropZone1.AddComponent)
```

Demo-wired events: `Complete` — handlers named `SDUI5DropZone1_<Event>`.
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `rounded-box`, `dropzone flex flex-wrap justify-center items-center`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim dropzone As SDUI5DropZone
dropzone.Initialize(Me, "SDUI5DropZone", "SDUI5DropZone")
dropzone.ParentID = "placeholder"
BANano.Await(dropzone.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


