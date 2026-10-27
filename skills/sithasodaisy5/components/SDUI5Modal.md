---
name: SDUI5Modal
description: SithasoDaisy5 SDUI5Modal component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Modal

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Modal.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Modal.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgCategories.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgCategories.bas)
  - [`pgContacts.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgContacts.bas)
  - [`pgGhostLogin.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgGhostLogin.bas)
  - [`pgModal.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgModal.bas)
  - [`pgModalHTML.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgModalHTML.bas)
  - [`pgSwiper.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgSwiper.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Modal is a **dual-mode** component: with `IsCard = False` (default) it renders a daisyUI `modal` dialog driven by a hidden checkbox toggle (`${name}_toggle`). Always open a dialog with `modal.Show` and close it with `modal.Close` so the checkbox state stays synchronized with the close and backdrop controls. Do **not** use the designer `Open` property or `setOpen` for dialog visibility: its setter only adds/removes the `modal-open` CSS class and does not synchronize the hidden checkbox, which can leave the close/backdrop behavior in the wrong state. With `IsCard = True` it renders a plain `card` (no toggle/backdrop) for inline panels. It auto-creates action buttons (Yes/No/Cancel/Ok/Retry/Abort/Ignore) based on `ActionType`, and hosts child content in sub-regions `${name}_form` (body/form), `${name}_action` (buttons), `${name}_box` (card body), `${name}_title`. It carries its own validation (`ResetValidation`/`Validate`/`IsValid`) over its `Form`; set `Html` for raw HTML body.
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
| `ReadMe` | String | Child Item _box, _title, _form, _action | — | — | — |
| `ParentID` | String | — | — | `setParentID` | `getParentID` |
| `IsCard` | Boolean | False | — | `setIsCard` | `getIsCard` |
| `Size` | String | lg | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `Title` | String | Modal Dialog | — | `setTitle` | `getTitle` |
| `TitleTextColor` | String | — | — | `setTitleTextColor` | `getTitleTextColor` |
| `TitleVisible` | Boolean | True | — | `setTitleVisible` | `getTitleVisible` |
| `Icon` | String | — | — | `setIcon` | `getIcon` |
| `IconColor` | String | — | — | `setIconColor` | `getIconColor` |
| `IconSize` | String | 32px | — | `setIconSize` | `getIconSize` |
| `IconVisible` | Boolean | False | — | `setIconVisible` | `getIconVisible` |
| `RawHtml` | String | — | — | `setHTML` | `getHTML` |
| `Open` | Boolean | False | — | `setOpen` | `getOpen` |
| `Closable` | Boolean | True | — | `setClosable` | `getClosable` |
| `Backdrop` | Boolean | True | — | `setBackdrop` | `getBackdrop` |
| `Glass` | Boolean | False | — | `setGlass` | `getGlass` |
| `ActionsVisible` | Boolean | True | — | `setActionsVisible` | `getActionsVisible` |
| `ActionType` | String | yes-no | cancel, no, yes, yes-no, yes-no-cancel, ok-cancel, retry-cancel, abort-retry-ignore | `setActionType` | `getActionType` |
| `BottonsWidth` | String | 22 | — | `setBottonsWidth` | `getBottonsWidth` |
| `ButtonsShadow` | String | md | 2xl, inner, lg, md, none, shadow, sm, xl | `setButtonsShadow` | `getButtonsShadow` |
| `ButtonsRounded` | String | md | none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 | `setButtonsRounded` | `getButtonsRounded` |
| `YesCaption` | String | Yes | — | `setYesCaption` | `getYesCaption` |
| `YesTextColor` | String | #ffffff | — | `setYesTextColor` | `getYesTextColor` |
| `YesColor` | String | success | — | `setYesColor` | `getYesColor` |
| `YesLoading` | Boolean | False | — | `setYesLoading` | `getYesLoading` |
| `YesVisible` | Boolean | True | — | `setYesVisible` | `getYesVisible` |
| `NoCaption` | String | No | — | `setNoCaption` | `getNoCaption` |
| `NoTextColor` | String | #ffffff | — | `setNoTextColor` | `getNoTextColor` |
| `NoColor` | String | error | — | `setNoColor` | `getNoColor` |
| `NoLoading` | Boolean | False | — | `setNoLoading` | `getNoLoading` |
| `NoVisible` | Boolean | True | — | `setNoVisible` | `getNoVisible` |
| `CancelCaption` | String | Cancel | — | `setCancelCaption` | `getCancelCaption` |
| `CancelTextColor` | String | #ffffff | — | `setCancelTextColor` | `getCancelTextColor` |
| `CancelColor` | String | gray | — | `setCancelColor` | `getCancelColor` |
| `CancelLoading` | Boolean | False | — | `setCancelLoading` | `getCancelLoading` |
| `CancelVisible` | Boolean | True | — | `setCancelVisible` | `getCancelVisible` |
| `Height` | String | fit | — | `setHeight` | `getHeight` |
| `Width` | String | 700px | — | `setWidth` | `getWidth` |
| `FullScreen` | Boolean | False | — | `setFullScreen` | `getFullScreen` |
| `BackgroundColor` | String | base-100 | — | `setBackgroundColor` | `getBackgroundColor` |
| `Border` | Boolean | True | — | `setBorder` | `getBorder` |
| `Dash` | Boolean | False | — | `setDash` | `getDash` |
| `Rounded` | String | none | 0, 2xl, 3xl, full, lg, md, none, rounded, sm, xl | `setRounded` | `getRounded` |
| `RoundedBox` | Boolean | False | — | `setRoundedBox` | `getRoundedBox` |
| `Shadow` | String | sm | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `MoveFrom` | String | middle | bottom, end, middle, start, top | `setMoveFrom` | `getMoveFrom` |
| `SMMoveFrom` | String | none | bottom, end, middle, none, start, top | `setSMMoveFrom` | `getSMMoveFrom` |
| `MDMoveFrom` | String | none | bottom, end, middle, none, start, top | `setMDMoveFrom` | `getMDMoveFrom` |
| `LGMoveFrom` | String | none | bottom, end, middle, none, start, top | `setLGMoveFrom` | `getLGMoveFrom` |
| `XLMoveFrom` | String | none | bottom, end, middle, none, start, top | `setXLMoveFrom` | `getXLMoveFrom` |
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
`Yes_Click`, `No_Click`, `Cancel_Click`, `Ok_Click`, `Retry_Click`, `Abort_Click`, `Ignore_Click`

Wire in parent: `Sub modal_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (11)
- `AddComponent()` _(public)_
- `Close()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `IsValid()` _(public)_
- `Remove()` _(public)_
- `RemoveBodyPadding()` _(public)_
- `RemoveFormPadding()` _(public)_
- `ResetValidation()` _(public)_
- `Show()` _(public)_
- `Validate(response As Boolean)` _(public)_

## Key Setters (59)
- `setActionsVisible(b As Boolean)` _(public)_
- `setActionType(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setBackdrop(b As Boolean)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBorder(b As Boolean)` _(public)_
- `setBottonsWidth(s As String)` _(public)_
- `setButtonsRounded(s As String)` _(public)_
- `setButtonsShadow(s As String)` _(public)_
- `setCancelCaption(s As String)` _(public)_
- `setCancelColor(s As String)` _(public)_
- `setCancelLoading(b As Boolean)` _(public)_
- `setCancelTextColor(s As String)` _(public)_
- `setCancelVisible(b As Boolean)` _(public)_
- `setClasses(s As String)` _(public)_
- `setClosable(b As Boolean)` _(public)_
- `setDash(b As Boolean)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setFullScreen(b As Boolean)` _(public)_
- `setGlass(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setHTML(s As String)` _(public)_
- `setIcon(s As String)` _(public)_
- `setIconColor(s As String)` _(public)_
- `setIconSize(s As String)` _(public)_
- `setIconVisible(b As Boolean)` _(public)_
- `setIsCard(b As Boolean)` _(public)_
- `setLGMoveFrom(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setMDMoveFrom(s As String)` _(public)_
- `setMoveFrom(s As String)` _(public)_
- `setNoCaption(s As String)` _(public)_
- `setNoColor(s As String)` _(public)_
- `setNoLoading(b As Boolean)` _(public)_
- `setNoTextColor(s As String)` _(public)_
- `setNoVisible(b As Boolean)` _(public)_
- `setOpen(b As Boolean)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRounded(s As String)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setSize(s As String)` _(public)_
- `setSMMoveFrom(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setTitle(s As String)` _(public)_
- `setTitleTextColor(s As String)` _(public)_
- `setTitleVisible(b As Boolean)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_
- `setXLMoveFrom(s As String)` _(public)_
- `setYesCaption(s As String)` _(public)_
- `setYesColor(s As String)` _(public)_
- `setYesLoading(b As Boolean)` _(public)_
- `setYesTextColor(s As String)` _(public)_
- `setYesVisible(b As Boolean)` _(public)_

## Getters (61)
- `getActionsVisible()` _(public)_
- `getActionType()` _(public)_
- `getAttributes()` _(public)_
- `getBackdrop()` _(public)_
- `getBackgroundColor()` _(public)_
- `getBorder()` _(public)_
- `getBottonsWidth()` _(public)_
- `getButtonsRounded()` _(public)_
- `getButtonsShadow()` _(public)_
- `getCancelCaption()` _(public)_
- `getCancelColor()` _(public)_
- `getCancelLoading()` _(public)_
- `getCancelTextColor()` _(public)_
- `getCancelVisible()` _(public)_
- `getClasses()` _(public)_
- `getClosable()` _(public)_
- `getDash()` _(public)_
- `getEnabled()` _(public)_
- `getFullScreen()` _(public)_
- `getGlass()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getHTML()` _(public)_
- `getIcon()` _(public)_
- `getIconColor()` _(public)_
- `getIconSize()` _(public)_
- `getIconVisible()` _(public)_
- `getID()` As String _(public)_
- `getIsCard()` _(public)_
- `getLGMoveFrom()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getMDMoveFrom()` _(public)_
- `getMoveFrom()` _(public)_
- `getNoCaption()` _(public)_
- `getNoColor()` _(public)_
- `getNoLoading()` _(public)_
- `getNoTextColor()` _(public)_
- `getNoVisible()` _(public)_
- `getOpen()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRounded()` _(public)_
- `getRoundedBox()` _(public)_
- `getShadow()` _(public)_
- `getSize()` _(public)_
- `getSMMoveFrom()` _(public)_
- `getStyles()` _(public)_
- `getTitle()` _(public)_
- `getTitleTextColor()` _(public)_
- `getTitleVisible()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_
- `getXLMoveFrom()` _(public)_
- `getYesCaption()` _(public)_
- `getYesColor()` _(public)_
- `getYesLoading()` _(public)_
- `getYesTextColor()` _(public)_
- `getYesVisible()` _(public)_

## Private Methods (4)
- `AddCancelButton()` _(private)_
- `AddNoButton()` _(private)_
- `AddYesButton()` _(private)_
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgModal.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgModal.bas) (verified demo):

```b4j
Private modal1 As SDUI5Modal		'ignore
modal1.Initialize(Me, "modal1", "modal1")
modal1.ParentID = app.PageView
'modal1.ActionType = "yes-no"
modal1.Backdrop = False
modal1.Html = ""
modal1.Title = "Modal 1"
BANano.Await(modal1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `card`, `card-border`, `card-dash`, `rounded-box`, `modal`, `modal-open`, `overflow-y-auto`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim modal As SDUI5Modal
modal.Initialize(Me, "SDUI5Modal", "SDUI5Modal")
modal.ParentID = "placeholder"
BANano.Await(modal.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
