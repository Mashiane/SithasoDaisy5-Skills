---
name: SDUI5GroupSelect
description: SithasoDaisy5 SDUI5GroupSelect component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5GroupSelect

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5GroupSelect.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5GroupSelect.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgGroupSelect.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgGroupSelect.bas)
  - [`pgModal.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgModal.bas)
  - [`pgThemeSelect.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgThemeSelect.bas)
  - [`pgValidation.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgValidation.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5GroupSelect is a select with grouped options. Use for categorized dropdowns. InputType controls label rendering.
_SDUI5GroupSelect is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `Label` | String | Group Select | — | `setLabel` | `getLabel` |
| `LegendColor` | String | — | — | `setLegendColor` | `getLegendColor` |
| `GroupName` | String | group1 | — | `setGroupName` | `getGroupName` |
| `RawOptions` | String | b4a=b4a; b4i=b4i; b4j=b4j; b4r=b4r | — | `setOptions` | `getOptions` |
| `Selected` | String | — | — | `setSelected` | `getSelected` |
| `SingleSelect` | Boolean | False | — | `setSingleSelect` | `getSingleSelect` |
| `ChipColor` | String | neutral | — | `setChipColor` | `getChipColor` |
| `ActiveColor` | String | #22c55e | — | `setActiveColor` | `getActiveColor` |
| `TextColor` | String | #ffffff | — | `setTextColor` | `getTextColor` |
| `ThemeController` | Boolean | False | — | `setThemeController` | `getThemeController` |
| `Size` | String | xs | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `BackgroundColor` | String | base-200 | — | `setBackgroundColor` | `getBackgroundColor` |
| `Border` | Boolean | True | — | `setBorder` | `getBorder` |
| `BorderColor` | String | base-300 | — | `setBorderColor` | `getBorderColor` |
| `Height` | String | — | — | `setHeight` | `getHeight` |
| `Width` | String | full | — | `setWidth` | `getWidth` |
| `RoundedBox` | Boolean | True | — | `setRoundedBox` | `getRoundedBox` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |
| `Enabled` | Boolean | True | — | `setEnabled` | `getEnabled` |
| `PositionStyle` | String | none | absolute, fixed, none, relative, static, sticky | `setPositionStyle` | `getPositionStyle` |
| `Position` | String | t=?; b=?; r=?; l=? | — | `setPosition` | `getPosition` |
| `MarginAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | `setMarginAXYTBLR` | `getMarginAXYTBLR` |
| `PaddingAXYTBLR` | String | a=4; x=?; y=?; t=?; b=?; l=?; r=? | — | `setPaddingAXYTBLR` | `getPaddingAXYTBLR` |
| `RawClasses` | String | — | — | `setClasses` | `getClasses` |
| `RawStyles` | String | — | — | `setStyles` | `getStyles` |
| `RawAttributes` | String | — | — | `setAttributes` | `getAttributes` |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
Where a designer key and method name differ, the method names shown are the source-verified mapping.
## Events
`Change`

Wire in parent: `Sub groupselect_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (18)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Clear()` As 'ignoredeadcode _(public)_
- `SetItemsChips(titems As Map)` _(public)_
- `SetOptionsFromMap(mItems As Map)` As 'ignoredeadcode _(public)_
- `AddOption(k As String, v As String)` _(public)_
- `IsBlank()` As Boolean _(public)_
- `ResetValidation()` _(public)_
- `SetLanguages()` _(public)_
- `SetCountries()` _(public)_
- `SetYears(yearsIntoPast As Int, yearsIntoFuture As Int)` _(public)_
- `SetMonths()` _(public)_
- `SetDays()` _(public)_
- `SetThemes()` _(public)_
## Key Setters (29)
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
- `setThemeController(b As Boolean)` As 'ignoredeadcode _(public)_
- `setLegendColor(s As String)` As 'ignoredeadcode _(public)_
- `setTextColor(s As String)` _(public)_
- `setActiveColor(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBorder(b As Boolean)` _(public)_
- `setBorderColor(s As String)` _(public)_
- `setGroupName(s As String)` _(public)_
- `setHeight(s As String)` _(public)_
- `setLabel(s As String)` _(public)_
- `setOptions(s As String)` As 'ignoredeadcode _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setSelected(s As String)` As 'ignoredeadcode _(public)_
- `setShadow(s As String)` _(public)_
- `setSingleSelect(b As Boolean)` _(public)_
- `setSize(s As String)` _(public)_
- `setWidth(s As String)` _(public)_
- `setChipColor(s As String)` _(public)_
- `setValue(s As String)` _(public)_
## Getters (31)
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
- `getThemeController()` As Boolean _(public)_
- `getLegendColor()` As String _(public)_
- `getTextColor()` As String _(public)_
- `getActiveColor()` As String _(public)_
- `getBackgroundColor()` As String _(public)_
- `getBorder()` As Boolean _(public)_
- `getBorderColor()` As String _(public)_
- `getGroupName()` As String _(public)_
- `getHeight()` As String _(public)_
- `getLabel()` As String _(public)_
- `getOptions()` As String _(public)_
- `getRoundedBox()` As Boolean _(public)_
- `getSelected()` As String _(public)_
- `getShadow()` As String _(public)_
- `getSingleSelect()` As Boolean _(public)_
- `getSize()` As String _(public)_
- `getWidth()` As String _(public)_
- `getChipColor()` As String _(public)_
- `getValue()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgThemeSelect.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgThemeSelect.bas) (verified demo). `SDUI5GroupSelect1` = a SDUI5GroupSelect.

```b4j
	SDUI5GroupSelect1.Initialize(Me, "SDUI5GroupSelect1", "SDUI5GroupSelect1")
	SDUI5GroupSelect1.ParentID = "SDUI5Column1"
	SDUI5GroupSelect1.ActiveColor = "#22c55e"
	SDUI5GroupSelect1.BackgroundColor = ""
	SDUI5GroupSelect1.Border = False
	SDUI5GroupSelect1.BorderColor = ""
	SDUI5GroupSelect1.ChipColor = "neutral"
	SDUI5GroupSelect1.Enabled = True
	SDUI5GroupSelect1.GroupName = "group1"
	SDUI5GroupSelect1.Height = ""
	SDUI5GroupSelect1.Label = "Select Theme"
	SDUI5GroupSelect1.LegendColor = ""
	SDUI5GroupSelect1.MarginAXYTBLR = "a=?; x=?; y=?; t=?; b=?; l=?; r=?"
	SDUI5GroupSelect1.PaddingAXYTBLR = "a=4; x=?; y=?; t=?; b=?; l=?; r=?"
	SDUI5GroupSelect1.Position = "t=?; b=?; r=?; l=?"
	SDUI5GroupSelect1.PositionStyle = "none"
	SDUI5GroupSelect1.Attributes = ""
	SDUI5GroupSelect1.Classes = ""
	SDUI5GroupSelect1.Options = ""
	SDUI5GroupSelect1.Styles = ""
	SDUI5GroupSelect1.RoundedBox = True
	SDUI5GroupSelect1.Selected = ""
	SDUI5GroupSelect1.Shadow = "none"
	SDUI5GroupSelect1.SingleSelect = True
	SDUI5GroupSelect1.Size = "sm"
	SDUI5GroupSelect1.TextColor = "#ffffff"
	SDUI5GroupSelect1.ThemeController = True
	SDUI5GroupSelect1.Visible = True
	SDUI5GroupSelect1.Width = "full"
	BANano.Await(SDUI5GroupSelect1.AddComponent)
```

Demo-wired events: `Change` — handlers named `SDUI5GroupSelect1_<Event>`.

Also used in: `pgGroupSelect`, `pgModal`, `pgValidation`
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `fieldset`, `border`, `rounded-box`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim groupselect As SDUI5GroupSelect
groupselect.Initialize(Me, "SDUI5GroupSelect", "SDUI5GroupSelect")
groupselect.ParentID = "placeholder"
BANano.Await(groupselect.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


