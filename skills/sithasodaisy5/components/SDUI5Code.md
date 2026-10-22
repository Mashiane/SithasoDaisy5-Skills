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
## Public Methods (32)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
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
- `MoveBackButton()` As 'ignoredeadcode _(public)_
- `AddToolbarButton(btnID As String, btnCaption As String, btnColor As String)` As SDUI5Button _(public)_
- `AddToolbarActionButton(btnID As String, btnCaption As String, btnColor As String)` As SDUI5Button		'ignoredeadcode _(public)_
- `SetToolbarButtonToolTip(btnID As String, tooltip As String, color As String, position As String)` As 'ignoredeadcode _(public)_
- `AddToolbarButtonIcon(btnID As String, sIcon As String, btnColor As String, iconColor As String)` As SDUI5Button			'ignoredeadcode _(public)_
- `SetToolbarButtonTextColorWhite(id As String)` _(public)_
- `AddToolbarActionButtonIcon(btnID As String, sIcon As String, btnColor As String, iconColor As String)` As SDUI5Button			'ignoredeadcode _(public)_
- `AddToolbarFileUpload(btnID As String, sIcon As String, btnColor As String, bMultiple As Boolean)` As SDUI5Button		'ignoredeadcode _(public)_
- `Clear()` _(public)_
- `AddCode(cl As String)` _(public)_
- `PasteFromClipBoard()` _(public)_
- `CopyToClipboard(txt As String)` _(public)_
- `RefreshRaw()` _(public)_
- `Refresh()` _(public)_
- `Download(FileName As String)` _(public)_
## Key Setters (26)
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
- `setRounded(s As String)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setButtonSize(s As String)` _(public)_
- `setButtonsOutlined(b As Boolean)` _(public)_
- `setHasRefresh(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHasBack(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHasDownload(b As Boolean)` As 'ignoredeadcode _(public)_
- `setCodeType(s As String)` _(public)_
- `setCaption(l As String)` _(public)_
- `setLanguage(l As String)` _(public)_
- `setFileName(l As String)` _(public)_
- `setTextSize(s As String)` As 'ignoredeadcode _(public)_
- `setContent(s As String)` _(public)_
- `setHeight(s As String)` As 'ignoredeadcode _(public)_
- `setWidth(s As String)` _(public)_
## Getters (29)
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
- `getRounded()` As String _(public)_
- `getRoundedBox()` As Boolean _(public)_
- `getShadow()` As String _(public)_
- `getButtonSize()` As String _(public)_
- `getButtonsOutlined()` As Boolean _(public)_
- `getHasRefresh()` As Boolean _(public)_
- `getHasBack()` As Boolean _(public)_
- `getHasDownload()` As Boolean _(public)_
- `getToolBarButtonID(btnID As String)` As String _(public)_
- `getCodeType()` As String _(public)_
- `getCaption()` As String _(public)_
- `getLanguage()` As String _(public)_
- `getFileName()` As String _(public)_
- `getTextSize()` As String _(public)_
- `getContent()` As String _(public)_
- `getHeight()` As String _(public)_
- `getWidth()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgCode.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgCode.bas) (verified demo). `SDUI5Code1` = a SDUI5Code.

```b4j
	SDUI5Code1.Initialize(Me, "SDUI5Code1", "SDUI5Code1")
	SDUI5Code1.ParentID = "SDUI5Column1"
	SDUI5Code1.Height = "56"
	SDUI5Code1.Content = "Hello SithadoDaisy5!"
	BANano.Await(SDUI5Code1.AddComponent)
```

Also used in: `pggridbuilder`
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


