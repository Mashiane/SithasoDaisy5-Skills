---
name: SDUI5Svg
description: SithasoDaisy5 SDUI5Svg component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Svg

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Svg.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Svg.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgSVG.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgSVG.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Svg renders an SVG (inline or from file). Use for icons/graphics. Path must include ./assets/ prefix + extension.
_SDUI5Svg is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `Replace` | Boolean | True | — | `setReplace` | `getReplace` |
| `Fit` | Boolean | True | — | `setFit` | `getFit` |
| `Src` | String | — | — | `setSrc` | `getSrc` |
| `Width` | String | — | — | `setWidth` | `getWidth` |
| `Height` | String | — | — | `setHeight` | `getHeight` |
| `Color` | String | — | — | `setColor` | `getColor` |
| `FillColor` | String | currentColor | — | `setFillColor` | `getFillColor` |
| `StrokeColor` | String | — | — | `setStrokeColor` | `getStrokeColor` |
| `StrokeWidth` | String | — | — | `setStrokeWidth` | `getStrokeWidth` |
| `Cache` | String | — | — | `setCache` | `getCache` |
| `CacheDisabled` | Boolean | True | — | `setCacheDisabled` | `getCacheDisabled` |
| `DisableCssScoping` | Boolean | False | — | `setDisableCssScoping` | `getDisableCssScoping` |
| `DisableUniqueId` | Boolean | False | — | `setDisableUniqueId` | `getDisableUniqueId` |
| `JSEnabled` | Boolean | False | — | `setJSEnabled` | `getJSEnabled` |
| `LazyLoading` | Boolean | False | — | `setLazyLoading` | `getLazyLoading` |
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

Wire in parent: `Sub svg_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (6)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
## Key Setters (24)
- `setPositionStyle(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setParentID(s As String)` _(public)_
- `setFit(b As Boolean)` _(public)_
- `setReplace(b As Boolean)` _(public)_
- `setCache(s As String)` _(public)_
- `setCacheDisabled(b As Boolean)` _(public)_
- `setColor(s As String)` _(public)_
- `setDisableCssScoping(b As Boolean)` _(public)_
- `setDisableUniqueId(b As Boolean)` _(public)_
- `setFillColor(s As String)` _(public)_
- `setHeight(s As String)` _(public)_
- `setJSEnabled(b As Boolean)` _(public)_
- `setLazyLoading(b As Boolean)` _(public)_
- `setSrc(s As String)` _(public)_
- `setStrokeColor(s As String)` _(public)_
- `setStrokeWidth(s As String)` _(public)_
- `setWidth(s As String)` _(public)_
## Getters (26)
- `getAttributes()` As String _(public)_
- `getStyles()` As String _(public)_
- `getClasses()` As String _(public)_
- `getPaddingAXYTBLR()` As String _(public)_
- `getMarginAXYTBLR()` As String _(public)_
- `getPositionStyle()` As String _(public)_
- `getPosition()` As String _(public)_
- `getVisible()` As Boolean _(public)_
- `getID()` As String _(public)_
- `getParentID()` As String _(public)_
- `getHere()` As String _(public)_
- `getFit()` As Boolean _(public)_
- `getReplace()` As Boolean _(public)_
- `getCache()` As String _(public)_
- `getCacheDisabled()` As Boolean _(public)_
- `getColor()` As String _(public)_
- `getDisableCssScoping()` As Boolean _(public)_
- `getDisableUniqueId()` As Boolean _(public)_
- `getFillColor()` As String _(public)_
- `getHeight()` As String _(public)_
- `getJSEnabled()` As Boolean _(public)_
- `getLazyLoading()` As Boolean _(public)_
- `getSrc()` As String _(public)_
- `getStrokeColor()` As String _(public)_
- `getStrokeWidth()` As String _(public)_
- `getWidth()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgSVG.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgSVG.bas) (verified demo). `SDUI5Svg3` = a SDUI5Svg.

```b4j
	SDUI5Svg3.Initialize(Me, "SDUI5Svg3", "SDUI5Svg3")
	SDUI5Svg3.ParentID = "SDUI5Column3"
	SDUI5Svg3.CacheDisabled = False
	SDUI5Svg3.FillColor = "red"
	SDUI5Svg3.Height = "32px"
	SDUI5Svg3.Src = "./assets/shop-svgrepo-com.svg"
	SDUI5Svg3.Width = "32px"
	SDUI5Svg3.Fit = False
	SDUI5Svg3.Replace = False
	BANano.Await(SDUI5Svg3.AddComponent)
```

Demo-wired events: `Click` — handlers named `SDUI5Svg3_<Event>`.
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim svg As SDUI5Svg
svg.Initialize(Me, "SDUI5Svg", "SDUI5Svg")
svg.ParentID = "placeholder"
BANano.Await(svg.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


