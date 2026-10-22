---
name: SDUI5InfoCard
description: SithasoDaisy5 SDUI5InfoCard component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5InfoCard

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5InfoCard.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5InfoCard.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgInfoBox.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgInfoBox.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5InfoCard is an informational card (title, description, icon). Use for feature/info display. Children mount into sub-regions.
_SDUI5InfoCard is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `InforType` | String | 1 | 1, 2, 3, 4, 5, 6 | `setInforType` | `getInforType` |
| `Effect` | String | none | hover-expand-effect, hover-zoom-effect, none | `setEffect` | `getEffect` |
| `Icon` | String | fa-solid fa-user | — | `setIcon` | `getIcon` |
| `IconColor` | String | #7cfc00 | — | `setIconColor` | `getIconColor` |
| `IconTextColor` | String | #FFFFFF | — | `setIconTextColor` | `getIconTextColor` |
| `Title` | String | Employees | — | `setTitle` | `getTitle` |
| `Notes` | String | Last 24 Hours | — | `setNotes` | `getNotes` |
| `StartFrom` | String | 0 | — | `setStartFrom` | `getStartFrom` |
| `Value` | String | 1000 | — | `setValue` | `getValue` |
| `Prefix` | String | — | — | `setPrefix` | `getPrefix` |
| `Separator` | String | — | — | `setSeparator` | `getSeparator` |
| `Suffix` | String | — | — | `setSuffix` | `getSuffix` |
| `BackgroundColor` | String | — | — | `setBackgroundColor` | `getBackgroundColor` |
| `TextColor` | String | — | — | `setTextColor` | `getTextColor` |
| `AnimateCounter` | Boolean | True | — | `setAnimateCounter` | `getAnimateCounter` |
| `Decimal` | String | . | — | `setDecimal` | `getDecimal` |
| `Duration` | String | 2 | — | `setDuration` | `getDuration` |
| `DecimalPlaces` | String | 0 | — | `setDecimalPlaces` | `getDecimalPlaces` |
| `UseGrouping` | Boolean | True | — | `setUseGrouping` | `getUseGrouping` |
| `Enabled` | Boolean | True | — | `setEnabled` | `getEnabled` |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |
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

Wire in parent: `Sub infocard_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (7)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Refresh()` As 'ignoredeadcode _(public)_
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
- `setValue(text As String)` _(public)_
- `setIconTextColor(s As String)` As 'ignoredeadcode _(public)_
- `setNotes(s As String)` As 'ignoredeadcode _(public)_
- `setDecimalPlaces(s As String)` _(public)_
- `setEffect(s As String)` As 'ignoredeadcode _(public)_
- `setUseGrouping(b As Boolean)` _(public)_
- `setAnimateCounter(b As Boolean)` _(public)_
- `setBackgroundColor(s As String)` As 'ignoredeadcode _(public)_
- `setDecimal(s As String)` _(public)_
- `setDuration(s As String)` _(public)_
- `setIcon(s As String)` As 'ignoredeadcode _(public)_
- `setIconColor(s As String)` As 'ignoredeadcode _(public)_
- `setInforType(s As String)` As 'ignoredeadcode _(public)_
- `setPrefix(s As String)` _(public)_
- `setSeparator(s As String)` _(public)_
- `setStartFrom(s As String)` _(public)_
- `setSuffix(s As String)` _(public)_
- `setTextColor(s As String)` As 'ignoredeadcode _(public)_
- `setTitle(s As String)` _(public)_
## Getters (32)
- `getElement()` As BANanoElement _(public)_
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
- `getIconTextColor()` As String _(public)_
- `getNotes()` As String _(public)_
- `getDecimalPlaces()` As String _(public)_
- `getEffect()` As String _(public)_
- `getUseGrouping()` As Boolean _(public)_
- `getAnimateCounter()` As Boolean _(public)_
- `getBackgroundColor()` As String _(public)_
- `getDecimal()` As String _(public)_
- `getDuration()` As String _(public)_
- `getIcon()` As String _(public)_
- `getIconColor()` As String _(public)_
- `getInforType()` As String _(public)_
- `getPrefix()` As String _(public)_
- `getSeparator()` As String _(public)_
- `getStartFrom()` As String _(public)_
- `getSuffix()` As String _(public)_
- `getTextColor()` As String _(public)_
- `getTitle()` As String _(public)_
- `getParentID()` As String _(public)_
- `getValue()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgInfoBox.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgInfoBox.bas) (verified demo). `SDUI5InfoCard2` = a SDUI5InfoCard.

```b4j
	SDUI5InfoCard2.Initialize(Me, "SDUI5InfoCard2", "SDUI5InfoCard2")
	SDUI5InfoCard2.ParentID = "SDUI5Column3"
	SDUI5InfoCard2.Effect = "hover-expand-effect"
	SDUI5InfoCard2.Icon = "fa-solid fa-couch"
	SDUI5InfoCard2.IconColor = "#00ffff"
	SDUI5InfoCard2.InforType = "2"
	SDUI5InfoCard2.Separator = ","
	BANano.Await(SDUI5InfoCard2.AddComponent)
```

Demo-wired events: `Click` — handlers named `SDUI5InfoCard2_<Event>`.
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `cursor-pointer pl-0 rounded-box`, `cursor-pointer relative rounded-box shadow-md`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim infocard As SDUI5InfoCard
infocard.Initialize(Me, "SDUI5InfoCard", "SDUI5InfoCard")
infocard.ParentID = "placeholder"
BANano.Await(infocard.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


