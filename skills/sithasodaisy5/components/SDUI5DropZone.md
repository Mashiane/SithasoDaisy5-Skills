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
## Public Methods (10)
- `AddComponent()` _(public)_
- `CancelUploads()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `ProcessQueue()` _(public)_
- `Refresh()` _(public)_
- `Remove()` _(public)_
- `RemoveAllFiles()` _(public)_
- `RemoveFile(fileObj As Object)` _(public)_

## Key Setters (25)
- `setAcceptedFiles(s As String)` _(public)_
- `setAddRemoveLinks(b As Boolean)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setAutoProcessQueue(b As Boolean)` _(public)_
- `setCapture(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setDisablePreviews(b As Boolean)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setMaxFilesize(i As Int)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParallelUploads(i As Int)` _(public)_
- `setParamName(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setUploadMultiple(b As Boolean)` _(public)_
- `setUrl(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (28)
- `getAcceptedFiles()` _(public)_
- `getAddRemoveLinks()` _(public)_
- `getAttributes()` _(public)_
- `getAutoProcessQueue()` _(public)_
- `getCapture()` _(public)_
- `getClasses()` _(public)_
- `getDisablePreviews()` _(public)_
- `getEnabled()` _(public)_
- `GetFiles()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getMaxFilesize()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParallelUploads()` _(public)_
- `getParamName()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRoundedBox()` _(public)_
- `getShadow()` _(public)_
- `getStyles()` _(public)_
- `getUploadMultiple()` _(public)_
- `getUrl()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgDropZone.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgDropZone.bas) (verified demo):

```b4j
Private SDUI5DropZone1 As SDUI5DropZone		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

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
