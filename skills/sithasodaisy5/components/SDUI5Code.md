---
name: SDUI5Code
description: SithasoDaisy5 SDUI5Code component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Code

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Code.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Code.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgCode.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgCode.bas)
  - [`pggridbuilder.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pggridbuilder.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Code displays code with syntax highlighting. Use for showing code snippets.
_SDUI5Code is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `ReadMe` | String | Child Item _buttons (card) | — | — | — |
| `ParentID` | String | — | — | `setParentID` | `getParentID` |
| `Caption` | String | Source Code | — | `setCaption` | `getCaption` |
| `Language` | String | vb | css, html, js, vb, json | `setLanguage` | `getLanguage` |
| `CodeType` | String | default | card, default | `setCodeType` | `getCodeType` |
| `ButtonSize` | String | md | lg, md, sm, xs, none | `setButtonSize` | `getButtonSize` |
| `ButtonsOutlined` | Boolean | False | — | `setButtonsOutlined` | `getButtonsOutlined` |
| `HasDownload` | Boolean | False | — | `setHasDownload` | `getHasDownload` |
| `HasRefresh` | Boolean | False | — | `setHasRefresh` | `getHasRefresh` |
| `HasBack` | Boolean | False | — | `setHasBack` | `getHasBack` |
| `FileName` | String | code.bas | — | `setFileName` | `getFileName` |
| `RawContent` | String | — | — | `setContent` | `getContent` |
| `TextSize` | String | none | 2xl, 3xl, 4xl, 5xl, 6xl, 7xl, 8xl, 9xl, base, lg, md, none, sm, xl, xs | `setTextSize` | `getTextSize` |
| `Height` | String | 800px | — | `setHeight` | `getHeight` |
| `Width` | String | full | — | `setWidth` | `getWidth` |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |
| `Enabled` | Boolean | True | — | `setEnabled` | `getEnabled` |
| `Rounded` | String | none | 0, 2xl, 3xl, full, lg, md, none, rounded, sm, xl | `setRounded` | `getRounded` |
| `RoundedBox` | Boolean | False | — | `setRoundedBox` | `getRoundedBox` |
| `Shadow` | String | xl | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
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
`Download`, `Refresh`, `Back`, `CustomButton`

Wire in parent: `Sub code_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (17)
- `AddCode(cl As String)` _(public)_
- `AddComponent()` _(public)_
- `AddToolbarActionButton(btnID As String, btnCaption As String, btnColor As String)` As SDUI5Button _(public)_
- `AddToolbarActionButtonIcon(btnID As String, sIcon As String, btnColor As String, iconColor As String)` As SDUI5Button _(public)_
- `AddToolbarButton(btnID As String, btnCaption As String, btnColor As String)` As SDUI5Button _(public)_
- `AddToolbarButtonIcon(btnID As String, sIcon As String, btnColor As String, iconColor As String)` As SDUI5Button _(public)_
- `AddToolbarFileUpload(btnID As String, sIcon As String, btnColor As String, bMultiple As Boolean)` As SDUI5Button _(public)_
- `Clear()` _(public)_
- `CopyToClipboard(txt As String)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Download(FileName As String)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `MoveBackButton()` _(public)_
- `PasteFromClipBoard()` _(public)_
- `Refresh()` _(public)_
- `RefreshRaw()` _(public)_
- `Remove()` _(public)_

## Key Setters (40)
- `setAttributes(s As String)` _(public)_
- `setButtonSize(s As String)` _(public)_
- `setButtonsOutlined(b As Boolean)` _(public)_
- `setCaption(l As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setCodeType(s As String)` _(public)_
- `setContent(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setFileName(l As String)` _(public)_
- `setHasBack(b As Boolean)` _(public)_
- `setHasDownload(b As Boolean)` _(public)_
- `setHasRefresh(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setLanguage(l As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRounded(s As String)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setTextSize(s As String)` _(public)_
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
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (30)
- `getAttributes()` _(public)_
- `getButtonSize()` _(public)_
- `getButtonsOutlined()` _(public)_
- `getCaption()` _(public)_
- `getClasses()` _(public)_
- `getCodeType()` _(public)_
- `getContent()` _(public)_
- `getEnabled()` _(public)_
- `getFileName()` _(public)_
- `getHasBack()` _(public)_
- `getHasDownload()` _(public)_
- `getHasRefresh()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getLanguage()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRounded()` _(public)_
- `getRoundedBox()` _(public)_
- `getShadow()` _(public)_
- `getStyles()` _(public)_
- `getTextSize()` _(public)_
- `getToolBarButtonID(btnID As String)` As String _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_

## Private Methods (3)
- `BeautifySourceCode(sc As String)` As String _(private)_
- `FileUploadHandler(e As BANanoEvent)` _(private)_
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgCode.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgCode.bas) (verified demo):

```b4j
Private SDUI5Code1 As SDUI5Code		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `rounded-box`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim code As SDUI5Code
code.Initialize(Me, "SDUI5Code", "SDUI5Code")
code.ParentID = "placeholder"
BANano.Await(code.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
