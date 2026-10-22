---
name: SDUI5Rating
description: SithasoDaisy5 SDUI5Rating component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Rating

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Rating.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Rating.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgModal.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgModal.bas)
  - [`pgRating.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgRating.bas)
  - [`pgValidation.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgValidation.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Rating is a daisyUI star rating input (1–N stars) with hover, half-stars, color, size, and validation. **InputType controls label rendering: `normal` renders a bare rating (no label), `legend` renders the `Label` above the rating.** Set `InputType = "legend"` for the label to display. Use GetValue/SetValue and Validate/IsValid for form handling.
_SDUI5Rating is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `InputType` | String | normal | normal, legend | `setInputType` | `getInputType` |
| `Label` | String | Rating | — | `setLabel` | `getLabel` |
| `LegendColor` | String | — | — | `setLegendColor` | `getLegendColor` |
| `Mask` | String | star | circle, decagon, diamond, heart, hexagon, hexagon-2, pentagon, rounded, rounded-2xl, rounded-3xl, rounded-lg, rounded-md, rounded-sm, rounded-xl, square, squircle, star, star-2, triangle, triangle-2, triangle-3, triangle-4 | `setMask` | `getMask` |
| `Color` | String | primary | accent, error, info, neutral, primary, secondary, success, warning, none | `setColor` | `getColor` |
| `RatingBackgroundColor` | String | — | — | `setRangeBackgroundColor` | `getRatingBackgroundColor` |
| `Size` | String | md | lg, md, sm, xl, xs | `setSize` | `getSize` |
| `Count` | Int | 5, MinRange: 0, MaxRange: 10 | — | `setCount` | `getCount` |
| `Value` | String | 2 | — | `setValue` | `getValue` |
| `FirstHidden` | Boolean | True | — | `setFirstHidden` | `getFirstHidden` |
| `Gap` | String | 2 | — | `setGap` | `getGap` |
| `Half` | Boolean | False | — | `setHalf` | `getHalf` |
| `Hint` | String | — | — | `setHint` | `getHint` |
| `Required` | Boolean | False | — | `setRequired` | `getRequired` |
| `ReadOnly` | Boolean | False | — | `setReadOnly` | `getReadOnly` |
| `BackgroundColor` | String | base-200 | — | `setBackgroundColor` | `getBackgroundColor` |
| `Border` | Boolean | True | — | `setBorder` | `getBorder` |
| `BorderColor` | String | base-300 | — | `setBorderColor` | `getBorderColor` |
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
`Change`

Wire in parent: `Sub rating_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (12)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Clear()` As 'ignoredeadcode _(public)_
- `Refresh()` As 'ignoredeadcode _(public)_
- `Focus()` _(public)_
- `HintError(s As String)` As 'ignoredeadcode _(public)_
- `IsBlank()` As Boolean _(public)_
- `ResetValidation()` _(public)_
## Key Setters (30)
- `setParentID(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setLegendColor(s As String)` As 'ignoredeadcode _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setBackgroundColor(s As String)` As 'ignoredeadcode _(public)_
- `setBorder(b As Boolean)` As 'ignoredeadcode _(public)_
- `setBorderColor(s As String)` As 'ignoredeadcode _(public)_
- `setRoundedBox(b As Boolean)` As 'ignoredeadcode _(public)_
- `setShadow(s As String)` As 'ignoredeadcode _(public)_
- `setInputType(s As String)` _(public)_
- `setRequired(b As Boolean)` _(public)_
- `setColor(s As String)` _(public)_
- `setCount(s As Int)` _(public)_
- `setRangeBackgroundColor(s As String)` _(public)_
- `setFirstHidden(b As Boolean)` _(public)_
- `setGap(s As String)` As 'ignoredeadcode _(public)_
- `setHalf(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHint(s As String)` _(public)_
- `setLabel(s As String)` _(public)_
- `setMask(s As String)` _(public)_
- `setReadOnly(b As Boolean)` _(public)_
- `setSize(s As String)` As 'ignoredeadcode _(public)_
- `setValue(s As String)` As 'ignoredeadcode _(public)_
## Getters (32)
- `getID()` As String _(public)_
- `getParentID()` As String _(public)_
- `getHere()` As String _(public)_
- `getLegendColor()` As String _(public)_
- `getVisible()` As Boolean _(public)_
- `getEnabled()` As Boolean _(public)_
- `getPositionStyle()` As String _(public)_
- `getPosition()` As String _(public)_
- `getAttributes()` As String _(public)_
- `getStyles()` As String _(public)_
- `getClasses()` As String _(public)_
- `getPaddingAXYTBLR()` As String _(public)_
- `getMarginAXYTBLR()` As String _(public)_
- `getBackgroundColor()` As String _(public)_
- `getBorder()` As Boolean _(public)_
- `getBorderColor()` As String _(public)_
- `getRoundedBox()` As Boolean _(public)_
- `getShadow()` As String _(public)_
- `getInputType()` As String _(public)_
- `getRequired()` As Boolean _(public)_
- `getRatingBackgroundColor()` As String _(public)_
- `getColor()` As String _(public)_
- `getCount()` As Int _(public)_
- `getFirstHidden()` As Boolean _(public)_
- `getGap()` As String _(public)_
- `getHalf()` As Boolean _(public)_
- `getHint()` As String _(public)_
- `getLabel()` As String _(public)_
- `getMask()` As String _(public)_
- `getReadOnly()` As Boolean _(public)_
- `getSize()` As String _(public)_
- `getValue()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgModal.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgModal.bas) (verified demo). `rtService` = a SDUI5Rating.

```b4j
	rtService.Initialize(Me, "rtService", "rtService")
	rtService.ParentID = "SDUI5Column10"
	rtService.Color = "success"
	rtService.InputType = "legend"
	rtService.Label = "Rate our Service"
	rtService.Mask = "heart"
	rtService.PaddingAXYTBLR = "a=4; x=?; y=?; t=?; b=?; l=?; r=?"
	rtService.Required = True
	rtService.RoundedBox = True
	rtService.Shadow = "lg"
	rtService.Value = "0"
	BANano.Await(rtService.AddComponent)
```

Demo-wired events: `Change` — handlers named `rtService_<Event>`.

Also used in: `pgRating`, `pgValidation`
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim rating As SDUI5Rating
rating.Initialize(Me, "SDUI5Rating", "SDUI5Rating")
rating.ParentID = "placeholder"
BANano.Await(rating.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Shared helpers: Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/TextSize/BackgroundImage. Dimensions are component-specific: this component exposes neither Width nor Height; use `Classes` utilities for sizing when needed.
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


