---
name: SDUI5Hero
description: SithasoDaisy5 SDUI5Hero component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Hero

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Hero.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Hero.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgHero.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgHero.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Hero is a hero section (title, subtitle, image, CTA). Use for landing page headers.
_SDUI5Hero is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `ReadMe` | String | Child Item _content | — | — | — |
| `ParentID` | String | — | — | `setParentID` | `getParentID` |
| `BackgroundColor` | String | — | — | `setBackgroundColor` | `getBackgroundColor` |
| `TextColor` | String | — | — | `setTextColor` | `getTextColor` |
| `BackgroundImage` | String | — | — | `setBackgroundImage` | `getBackgroundImage` |
| `Overlay` | Boolean | False | — | `setOverlay` | `getOverlay` |
| `Rounded` | String | none | 0, 2xl, 3xl, full, lg, md, none, rounded, sm, xl | `setRounded` | `getRounded` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `ContentTextAlign` | String | — | center, end, justify, left, none, right, start | `setContentTextAlign` | `getContentTextAlign` |
| `ContentFlexDirection` | String | flex-col | flex-col, flex-col-reverse, flex-row, flex-row-reverse | `setContentFlexDirection` | `getContentFlexDirection` |
| `SmContentFlexDirection` | String | none | flex-col, flex-col-reverse, flex-row, flex-row-reverse | `setSmContentFlexDirection` | `getSmContentFlexDirection` |
| `MdContentFlexDirection` | String | none | flex-col, flex-col-reverse, flex-row, flex-row-reverse | `setMdContentFlexDirection` | `getMdContentFlexDirection` |
| `LgContentFlexDirection` | String | flex-row | flex-col, flex-col-reverse, flex-row, flex-row-reverse | `setLgContentFlexDirection` | `getLgContentFlexDirection` |
| `XlContentFlexDirection` | String | none | flex-col, flex-col-reverse, flex-row, flex-row-reverse | `setXlContentFlexDirection` | `getXlContentFlexDirection` |
| `XxlContentFlexDirection` | String | none | flex-col, flex-col-reverse, flex-row, flex-row-reverse | `setXxlContentFlexDirection` | `getXxlContentFlexDirection` |
| `MinHeight` | String | 56 | — | `setMinHeight` | `getMinHeight` |
| `Height` | String | — | — | `setHeight` | `getHeight` |
| `MinWidth` | String | — | — | `setMinWidth` | `getMinWidth` |
| `Width` | String | — | — | `setWidth` | `getWidth` |
| `RawContentAttributes` | String | — | — | `setContentAttributes` | `getContentAttributes` |
| `RawContentClass` | String | — | — | `setContentClass` | `getContentClass` |
| `RawContentStyle` | String | — | — | `setContentStyle` | `getContentStyle` |
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

Wire in parent: `Sub hero_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (6)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
## Key Setters (30)
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
- `setBackgroundColor(s As String)` _(public)_
- `setBackgroundImage(s As String)` _(public)_
- `setContentFlexDirection(s As String)` As 'ignoredeadcode _(public)_
- `setContentTextAlign(s As String)` As 'ignoredeadcode _(public)_
- `setHeight(s As String)` _(public)_
- `setLgContentFlexDirection(s As String)` As 'ignoredeadcode _(public)_
- `setMdContentFlexDirection(s As String)` As 'ignoredeadcode _(public)_
- `setMinHeight(s As String)` _(public)_
- `setMinWidth(s As String)` _(public)_
- `setOverlay(b As Boolean)` As 'ignoredeadcode _(public)_
- `setContentAttributes(s As String)` As 'ignoredeadcode _(public)_
- `setContentClass(s As String)` As 'ignoredeadcode _(public)_
- `setContentStyle(s As String)` As 'ignoredeadcode _(public)_
- `setSmContentFlexDirection(s As String)` As 'ignoredeadcode _(public)_
- `setTextColor(s As String)` _(public)_
- `setWidth(s As String)` _(public)_
- `setXlContentFlexDirection(s As String)` As 'ignoredeadcode _(public)_
- `setXxlContentFlexDirection(s As String)` As 'ignoredeadcode _(public)_
- `setRounded(s As String)` _(public)_
- `setShadow(s As String)` _(public)_
## Getters (32)
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
- `getBackgroundColor()` As String _(public)_
- `getBackgroundImage()` As String _(public)_
- `getContentFlexDirection()` As String _(public)_
- `getContentTextAlign()` As String _(public)_
- `getHeight()` As String _(public)_
- `getLgContentFlexDirection()` As String _(public)_
- `getMdContentFlexDirection()` As String _(public)_
- `getMinHeight()` As String _(public)_
- `getMinWidth()` As String _(public)_
- `getOverlay()` As Boolean _(public)_
- `getContentAttributes()` As String _(public)_
- `getContentClass()` As String _(public)_
- `getContentStyle()` As String _(public)_
- `getSmContentFlexDirection()` As String _(public)_
- `getTextColor()` As String _(public)_
- `getWidth()` As String _(public)_
- `getXlContentFlexDirection()` As String _(public)_
- `getXxlContentFlexDirection()` As String _(public)_
- `getRounded()` As String _(public)_
- `getShadow()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgHero.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgHero.bas) (verified demo). `SDUI5Hero4` = a SDUI5Hero.

```b4j
	SDUI5Hero4.Initialize(Me, "SDUI5Hero4", "SDUI5Hero4")
	SDUI5Hero4.ParentID = "SDUI5Column4"
	SDUI5Hero4.BackgroundImage = "https://img.daisyui.com/images/stock/photo-1507358522600-9f71e620c44e.webp"
	SDUI5Hero4.ContentTextAlign = "center"
	SDUI5Hero4.Height = "480px"
	SDUI5Hero4.MinHeight = ""
	SDUI5Hero4.Overlay = True
	SDUI5Hero4.ContentAttributes = ""
	SDUI5Hero4.ContentClass = ""
	SDUI5Hero4.ContentStyle = ""
	SDUI5Hero4.Rounded = "lg"
	SDUI5Hero4.Shadow = "lg"
	SDUI5Hero4.TextColor = "neutral-content"
	BANano.Await(SDUI5Hero4.AddComponent)
```

Composite structure — children mount into sub-regions: a `SDUI5Image1` inside `SDUI5Hero2_content`:

```b4j
	SDUI5Image1.Initialize(Me, "SDUI5Image1", "SDUI5Image1")
	SDUI5Image1.ParentID = "SDUI5Hero2_content"
	SDUI5Image1.Height = ""
	SDUI5Image1.Mask = "rounded-lg"
	SDUI5Image1.MaxWidth = "sm"
	SDUI5Image1.Shadow = "2xl"
	SDUI5Image1.Src = "https://img.daisyui.com/images/stock/photo-1635805737707-575885ab0820.webp"
	SDUI5Image1.Width = ""
	BANano.Await(SDUI5Image1.AddComponent)
```
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `hero`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim hero As SDUI5Hero
hero.Initialize(Me, "SDUI5Hero", "SDUI5Hero")
hero.ParentID = "placeholder"
BANano.Await(hero.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


