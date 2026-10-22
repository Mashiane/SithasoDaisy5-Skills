---
name: SDUI5Collapse
description: SithasoDaisy5 SDUI5Collapse component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Collapse

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Collapse.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Collapse.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgAccordion.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgAccordion.bas)
  - [`pgCollapse.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgCollapse.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Collapse is a collapsible content panel with a title. Children mount into the collapse via `ParentID = collapseName`. Use for FAQ/accordion-style show-hide. Title/TitleBackgroundColor/TitleTextColor style the header.
_SDUI5Collapse is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `ReadMe` | String | Child Item _title, _content | — | — | — |
| `ParentID` | String | — | — | `setParentID` | `getParentID` |
| `GroupName` | String | — | — | `setGroupName` | `getGroupName` |
| `Icon` | String | — | — | `setIcon` | `getIcon` |
| `IconColor` | String | — | — | `setIconColor` | `getIconColor` |
| `IconSize` | String | 32px | — | `setIconSize` | `getIconSize` |
| `Title` | String | Collapse | — | `setTitle` | `getTitle` |
| `TitleBackgroundColor` | String | — | — | `setTitleBackgroundColor` | `getTitleBackgroundColor` |
| `TitleTextColor` | String | — | — | `setTitleTextColor` | `getTitleTextColor` |
| `TitleClass` | String | font-semibold | — | `setTitleClass` | `getTitleClass` |
| `RawContent` | String | Collapse Content | — | `setContent` | `getContent` |
| `ContentBackgroundColor` | String | base-100 | — | `setContentBackgroundColor` | `getContentBackgroundColor` |
| `ContentTextColor` | String | — | — | `setContentTextColor` | `getContentTextColor` |
| `ContentTextSize` | String | sm | 2xl, 3xl, 4xl, 5xl, 6xl, 7xl, 8xl, 9xl, base, lg, md, none, sm, xl, xs | `setContentTextSize` | `getContentTextSize` |
| `ContentClass` | String | — | — | `setContentClass` | `getContentClass` |
| `Active` | Boolean | False | — | `setActive` | `getActive` |
| `RightIcon` | String | arrow | arrow, plus | `setRightIcon` | `getRightIcon` |
| `JoinItem` | Boolean | False | — | `setJoinItem` | `getJoinItem` |
| `TextColor` | String | — | — | `setTextColor` | `getTextColor` |
| `BackgroundColor` | String | base-100 | — | `setBackgroundColor` | `getBackgroundColor` |
| `Border` | Boolean | True | — | — | — |
| `BorderColor` | String | base-300 | — | `setBorderColor` | `getBorderColor` |
| `OpenClose` | String | none | close, none, open | `setOpenClose` | `getOpenClose` |
| `Rounded` | String | none | 0, 2xl, 3xl, full, lg, md, none, rounded, sm, xl | `setRounded` | `getRounded` |
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
_(none declared)_

Wire in parent: `Sub collapse_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (10)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `LinkExisting()` _(public)_
- `ClearContent()` _(public)_
- `HideContent(skey As String)` _(public)_
- `ShowContent(skey As String)` _(public)_
## Key Setters (32)
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
- `setTitleClass(s As String)` As 'ignoredeadcode _(public)_
- `setContentClass(s As String)` As 'ignoredeadcode _(public)_
- `setIcon(s As String)` As 'ignoredeadcode _(public)_
- `setIconColor(s As String)` As 'ignoredeadcode _(public)_
- `setIconSize(s As String)` As 'ignoredeadcode _(public)_
- `setGroupName(s As String)` As 'ignoredeadcode _(public)_
- `setActive(b As Boolean)` As 'ignoredeadcode _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBorderColor(s As String)` _(public)_
- `setContentBackgroundColor(s As String)` As 'ignoredeadcode _(public)_
- `setContentTextColor(s As String)` As 'ignoredeadcode _(public)_
- `setContentTextSize(s As String)` As 'ignoredeadcode _(public)_
- `setJoinItem(b As Boolean)` As 'ignoredeadcode _(public)_
- `setOpenClose(s As String)` _(public)_
- `setContent(s As String)` As 'ignoredeadcode _(public)_
- `setRightIcon(s As String)` _(public)_
- `setRounded(s As String)` _(public)_
- `setShadow(s As String)` _(public)_
- `setTextColor(s As String)` _(public)_
- `setTitle(s As String)` _(public)_
- `setTitleBackgroundColor(s As String)` As 'ignoredeadcode _(public)_
- `setTitleTextColor(s As String)` As 'ignoredeadcode _(public)_
## Getters (34)
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
- `getTitleClass()` As String _(public)_
- `getContentClass()` As String _(public)_
- `getIcon()` As String _(public)_
- `getIconColor()` As String _(public)_
- `getIconSize()` As String _(public)_
- `getGroupName()` As String _(public)_
- `getActive()` As Boolean _(public)_
- `getBackgroundColor()` As String _(public)_
- `getBorderColor()` As String _(public)_
- `getContentBackgroundColor()` As String _(public)_
- `getContentTextColor()` As String _(public)_
- `getContentTextSize()` As String _(public)_
- `getJoinItem()` As Boolean _(public)_
- `getOpenClose()` As String _(public)_
- `getContent()` As String _(public)_
- `getRightIcon()` As String _(public)_
- `getRounded()` As String _(public)_
- `getShadow()` As String _(public)_
- `getTextColor()` As String _(public)_
- `getTitle()` As String _(public)_
- `getTitleBackgroundColor()` As String _(public)_
- `getTitleTextColor()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgCollapse.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgCollapse.bas) (verified demo). `SDUI5Collapse4` = a SDUI5Collapse.

```b4j
	SDUI5Collapse4.Initialize(Me, "SDUI5Collapse4", "SDUI5Collapse4")
	SDUI5Collapse4.ParentID = "SDUI5Row1"
	SDUI5Collapse4.ContentTextSize = "none"
	SDUI5Collapse4.IconSize = "42px"
	SDUI5Collapse4.OpenClose = "open"
	SDUI5Collapse4.Content = "Click the ""Sign Up"" button in the top right corner and follow the registration process."
	SDUI5Collapse4.RightIcon = "plus"
	SDUI5Collapse4.Title = "How do I create an account?"
	BANano.Await(SDUI5Collapse4.AddComponent)
```

Also used in: `pgAccordion`
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `collapse`, `border`, `join-item`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim collapse As SDUI5Collapse
collapse.Initialize(Me, "SDUI5Collapse", "SDUI5Collapse")
collapse.ParentID = "placeholder"
BANano.Await(collapse.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


