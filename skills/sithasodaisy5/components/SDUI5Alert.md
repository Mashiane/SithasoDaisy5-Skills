---
name: SDUI5Alert
description: SithasoDaisy5 SDUI5Alert component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Alert

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Alert.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Alert.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgAlert.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgAlert.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Alert is a daisyUI `alert` banner with Title, Icon (with extension), Color, Size, Outline/Soft/Dash styling, Alignment, HasActions (renders action buttons), Height/Width. Use for inline status/error/success messages; Icon path must include extension. Toggle visibility via SetVisible.
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
| `ReadMe` | String | Child Item _actions | — | — | — |
| `ParentID` | String | — | — | `setParentID` | `getParentID` |
| `Title` | String | Alert Title | — | `setTitle` | `getTitle` |
| `Text` | String | Alert Text | — | `setText` | `getText` |
| `TextColor` | String | — | — | `setTextColor` | `getTextColor` |
| `Alignment` | String | none | horizontal, none, vertical | `setAlignment` | `getAlignment` |
| `Color` | String | none | accent, error, info, neutral, none, primary, secondary, success, warning | `setColor` | `getColor` |
| `BackgroundColor` | String | — | — | `setBackgroundColor` | `getBackgroundColor` |
| `Dash` | Boolean | False | — | `setDash` | `getDash` |
| `Icon` | String | — | — | `setIcon` | `getIcon` |
| `IconSize` | String | 16px | — | `setIconSize` | `getIconSize` |
| `IconColor` | String | — | — | `setIconColor` | `getIconColor` |
| `Outline` | Boolean | False | — | `setOutline` | `getOutline` |
| `Size` | String | none | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `Height` | String | — | — | `setHeight` | `getHeight` |
| `Width` | String | 96 | — | `setWidth` | `getWidth` |
| `Soft` | Boolean | False | — | `setSoft` | `getSoft` |
| `HasActions` | Boolean | False | — | `setHasActions` | `getHasActions` |
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
`Click`

Wire in parent: `Sub alert_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (6)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
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
- `setText(text As String)` As 'ignoredeadcode _(public)_
- `setHeight(s As String)` _(public)_
- `setWidth(s As String)` _(public)_
- `setHasActions(b As Boolean)` As 'ignoredeadcode _(public)_
- `setIconSize(s As String)` As 'ignoredeadcode _(public)_
- `setTitle(text As String)` As 'ignoredeadcode _(public)_
- `setAlignment(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setColor(s As String)` _(public)_
- `setDash(b As Boolean)` _(public)_
- `setIcon(s As String)` As 'ignoredeadcode _(public)_
- `setIconColor(s As String)` As 'ignoredeadcode _(public)_
- `setOutline(b As Boolean)` _(public)_
- `setSize(s As String)` _(public)_
- `setSoft(b As Boolean)` _(public)_
- `setTextColor(s As String)` _(public)_
## Getters (27)
- `getID()` As String _(public)_
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
- `getText()` As String _(public)_
- `getHeight()` As String _(public)_
- `getWidth()` As String _(public)_
- `getHasActions()` As Boolean _(public)_
- `getIconSize()` As String _(public)_
- `getTitle()` As String _(public)_
- `getAlignment()` As String _(public)_
- `getBackgroundColor()` As String _(public)_
- `getColor()` As String _(public)_
- `getDash()` As Boolean _(public)_
- `getIcon()` As String _(public)_
- `getIconColor()` As String _(public)_
- `getOutline()` As Boolean _(public)_
- `getSize()` As String _(public)_
- `getSoft()` As Boolean _(public)_
- `getTextColor()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgAlert.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgAlert.bas) (verified demo). `SDUI5Alert18` = a SDUI5Alert.

```b4j
	SDUI5Alert18.Initialize(Me, "SDUI5Alert18", "SDUI5Alert18")
	SDUI5Alert18.ParentID = "SDUI5Row4"
	SDUI5Alert18.Color = "info"
	SDUI5Alert18.HasActions = True
	SDUI5Alert18.Icon = "./assets/check.svg"
	SDUI5Alert18.Size = "sm"
	SDUI5Alert18.Text = "You have 1 unread message"
	SDUI5Alert18.TextColor = "#FFFFFF"
	SDUI5Alert18.Title = "New Message1"
	SDUI5Alert18.Width = "full"
	BANano.Await(SDUI5Alert18.AddComponent)
```

Composite structure — children mount into sub-regions: a `SDUI5Button1` inside `SDUI5Alert18_actions`:

```b4j
	SDUI5Button1.Initialize(Me, "SDUI5Button1", "SDUI5Button1")
	SDUI5Button1.ParentID = "SDUI5Alert18_actions"
	SDUI5Button1.IconSize = "none"
	SDUI5Button1.IndicatorSize = "xs"
	SDUI5Button1.Size = "sm"
	SDUI5Button1.Text = "See"
	BANano.Await(SDUI5Button1.AddComponent)
```
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `alert`, `alert-dash`, `alert-outline`, `alert-soft`
**Colors**: `alert:sColor`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim alert As SDUI5Alert
alert.Initialize(Me, "SDUI5Alert", "SDUI5Alert")
alert.ParentID = "placeholder"
BANano.Await(alert.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


