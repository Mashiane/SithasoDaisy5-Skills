---
name: SDUI5TreeSpider
description: SithasoDaisy5 SDUI5TreeSpider component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5TreeSpider

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5TreeSpider.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5TreeSpider.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgTreeSpider.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTreeSpider.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5TreeSpider is a spider/radar tree visualization. Use for hierarchical radial display.
_SDUI5TreeSpider is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `AnimationRotationInterval` | Int | 1 | — | `setAnimationRotationInterval` | `getAnimationRotationInterval` |
| `AnimationRotationSpeed` | Int | 10 | — | `setAnimationRotationSpeed` | `getAnimationRotationSpeed` |
| `AutoInitialize` | Boolean | True | — | `setAutoInitialize` | `getAutoInitialize` |
| `AutoSetChartHeadBg` | Boolean | False | — | `setAutoSetChartHeadBg` | `getAutoSetChartHeadBg` |
| `BackgroundPattern` | String | default | blurry, chaos, default, flurry, flux, gyrrate, leaves, none, quad, replicate, scribble, spiral, spot, squiggly, whirling | `setBackgroundPattern` | `getBackgroundPattern` |
| `ChartHeadType` | String | default | default, landscape, rounded | `setChartHeadType` | `getChartHeadType` |
| `ChartHeadBg` | String | #ffffff | — | `setChartHeadBg` | `getChartHeadBg` |
| `HeadImageShape` | String | symbolCircle | symbolCircle, symbolCross, symbolDiamond, symbolDiamond2, symbolSquare, symbolSquare2, symbolStar, symbolTriangle, symbolTriangle2, symbolWye | `setHeadImageShape` | `getHeadImageShape` |
| `HeadLinkerThumbCircleRadius` | Int | 8 | — | `setHeadLinkerThumbCircleRadius` | `getHeadLinkerThumbCircleRadius` |
| `LinkerThumbShape` | String | symbolCircle | symbolAsterisk, symbolCircle, symbolCross, symbolDiamond, symbolDiamond2, symbolPlus, symbolSquare, symbolSquare2, symbolStar, symbolTriangle, symbolTriangle2, symbolWye, symbolX | `setLinkerThumbShape` | `getLinkerThumbShape` |
| `ShowChartHeadBorder` | Boolean | True | — | `setShowChartHeadBorder` | `getShowChartHeadBorder` |
| `ShowTools` | Boolean | True | — | `setShowTools` | `getShowTools` |
| `TreeType` | String | default | cellar, default, goldenRod, hSpider, hSpiderWalk, radialSpiderLeg, vSpiderWalk | `setTreeType` | `getTreeType` |
| `TreeLinkType` | String | none | curveBasisClosed, curveBumpX, curveBumpY, curveLinear, curveStep, curveStepAfter, curveStepBefore, none | `setTreeLinkType` | `getTreeLinkType` |
| `VerticalSpace` | String | 120px | — | `setVerticalSpace` | `getVerticalSpace` |
| `Width` | String | 900px | — | `setWidth` | `getWidth` |
| `Height` | String | 500px | — | `setHeight` | `getHeight` |
| `ZoomInDistance` | String | 1.5 | — | `setZoomInDistance` | `getZoomInDistance` |
| `ZoomOutDistance` | String | 0.5 | — | `setZoomOutDistance` | `getZoomOutDistance` |
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

Wire in parent: `Sub treespider_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (10)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Clear()` _(public)_
- `AddItem(parentID As String, id As String, name As String, role As String, location As String, image As String)` _(public)_
- `Refresh()` _(public)_
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
- `setAnimationRotationInterval(i As Int)` _(public)_
- `setAnimationRotationSpeed(i As Int)` _(public)_
- `setAutoInitialize(b As Boolean)` _(public)_
- `setAutoSetChartHeadBg(b As Boolean)` _(public)_
- `setBackgroundPattern(s As String)` _(public)_
- `setChartHeadType(s As String)` _(public)_
- `setChartHeadBg(s As String)` _(public)_
- `setHeadImageShape(s As String)` _(public)_
- `setHeadLinkerThumbCircleRadius(i As Int)` _(public)_
- `setHeight(s As String)` _(public)_
- `setLinkerThumbShape(s As String)` _(public)_
- `setShowChartHeadBorder(b As Boolean)` _(public)_
- `setShowTools(b As Boolean)` _(public)_
- `setTreeType(s As String)` _(public)_
- `setTreeLinkType(s As String)` _(public)_
- `setVerticalSpace(s As String)` _(public)_
- `setWidth(s As String)` _(public)_
- `setZoomInDistance(d As Double)` _(public)_
- `setZoomOutDistance(d As Double)` _(public)_
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
- `getAnimationRotationInterval()` As Int _(public)_
- `getAnimationRotationSpeed()` As Int _(public)_
- `getAutoInitialize()` As Boolean _(public)_
- `getAutoSetChartHeadBg()` As Boolean _(public)_
- `getBackgroundPattern()` As String _(public)_
- `getChartHeadType()` As String _(public)_
- `getChartHeadBg()` As String _(public)_
- `getHeadImageShape()` As String _(public)_
- `getHeadLinkerThumbCircleRadius()` As Int _(public)_
- `getHeight()` As String _(public)_
- `getLinkerThumbShape()` As String _(public)_
- `getShowChartHeadBorder()` As Boolean _(public)_
- `getShowTools()` As Boolean _(public)_
- `getTreeType()` As String _(public)_
- `getTreeLinkType()` As String _(public)_
- `getVerticalSpace()` As String _(public)_
- `getWidth()` As String _(public)_
- `getZoomInDistance()` As Double _(public)_
- `getZoomOutDistance()` As Double _(public)_
## Private Methods (1)
- `SetDefaults()` _(private)_
## Verified Demo Usage

Real syntax from [`pgTreeSpider.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTreeSpider.bas) (verified demo). `tsOrganogram` = a SDUI5TreeSpider.

```b4j
	tsOrganogram.Initialize(Me, "tsOrganogram", "tsOrganogram")
	tsOrganogram.ParentID = "SDUI5Column1"
	tsOrganogram.AutoInitialize = False
	tsOrganogram.AutoSetChartHeadBg = True
	tsOrganogram.BackgroundPattern = "none"
	tsOrganogram.ChartHeadBg = "#c3ff52"
	tsOrganogram.HeadLinkerThumbCircleRadius = 10
	tsOrganogram.Height = "700px"
	tsOrganogram.ShowTools = False
	tsOrganogram.VerticalSpace = "80px"
	tsOrganogram.Width = "100%"
	BANano.Await(tsOrganogram.AddComponent)
```

Builder methods, real call order (from `pgTreeSpider.bas`):

```b4j
	tsOrganogram.AddItem("", "1", "Abayomi Amusa", "Manager", "Lagos, Nigeria", "./assets/face1.jpg")
	tsOrganogram.AddItem("1", "2", "Trey Anderson", "Product Manager", "California, United States", "./assets/face2.jpg")
	tsOrganogram.AddItem("1", "3", "Troy Manuel", "Software Developer", "Alberta, Canada", "./assets/face3.jpg")
	tsOrganogram.AddItem("1", "4", "Rebecca Oslon", "Software Developer", "London, United Kingdom", "./assets/face4.jpg")
	tsOrganogram.AddItem("1", "5", "David Scheg", "Product Designer", "Jiaozian, China", "./assets/face5.jpg")
	tsOrganogram.AddItem("2", "6", "James Zucks", "DevOps", "Accra, Ghana", "./assets/face6.jpg")
	tsOrganogram.AddItem("2", "7", "Zu Po Xe", "Backend Developer", "Johanesburg, South Africa", "./assets/face7.jpg")
	tsOrganogram.AddItem("2", "8", "Scott Ziagler", "FrontEnd Developer Intern", "", "./assets/face8.jpg")
	tsOrganogram.AddItem("7", "9", "Xervia Allero", "FrontEnd Developer Intern", "", "./assets/face9.jpg")
	tsOrganogram.AddItem("3", "10", "Adebowale Ajanlekoko", "Fullstack Developer", "", "./assets/face10.jpg")
```
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim treespider As SDUI5TreeSpider
treespider.Initialize(Me, "SDUI5TreeSpider", "SDUI5TreeSpider")
treespider.ParentID = "placeholder"
BANano.Await(treespider.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


