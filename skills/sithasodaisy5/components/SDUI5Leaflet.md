---
name: SDUI5Leaflet
description: SithasoDaisy5 SDUI5Leaflet component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Leaflet

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Leaflet.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Leaflet.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgLeafLet.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgLeafLet.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Leaflet is a map (Leaflet) component. Use for displaying maps and markers.
_SDUI5Leaflet is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `TypeOf` | String | normal | legend, normal | `setTypeOf` | `getTypeOf` |
| `Label` | String | — | — | `setLabel` | `getLabel` |
| `LayerType` | String | openstreetmap | openstreetmap, google-roadmap, google-satellite, google-hybrid, google-terrain, other | `setLayerType` | `getLayerType` |
| `Geonames` | Boolean | False | — | `setGeonames` | `getGeonames` |
| `Height` | String | 500px | — | `setHeight` | `getHeight` |
| `Width` | String | 500px | — | `setWidth` | `getWidth` |
| `Lat` | String | 0 | — | — | — |
| `Lng` | String | 0 | — | — | — |
| `MaxZoom` | Int | 19 | — | `setMaxZoom` | `getMaxZoom` |
| `Zoom` | Int | 5 | — | `setZoom` | `getZoom` |
| `CenterFieldSet` | Boolean | True | — | `setCenterFieldSet` | `getCenterFieldSet` |
| `CurrentCaption` | String | Current Location | — | `setCurrentCaption` | `getCurrentCaption` |
| `CurrentColor` | String | primary | — | `setCurrentColor` | `getCurrentColor` |
| `CurrentTextColor` | String | white | — | `setCurrentTextColor` | `getCurrentTextColor` |
| `StartTrackingCaption` | String | Start Tracking | — | `setStartTrackingCaption` | `getStartTrackingCaption` |
| `StartTrackingColor` | String | success | — | `setStartTrackingColor` | `getStartTrackingColor` |
| `StartTrackingTextColor` | String | white | — | `setStartTrackingTextColor` | `getStartTrackingTextColor` |
| `StopTrackingCaption` | String | Stop Tracking | — | `setStopTrackingCaption` | `getStopTrackingCaption` |
| `StopTrackingColor` | String | error | — | `setStopTrackingColor` | `getStopTrackingColor` |
| `StopTrackingTextColor` | String | white | — | `setStopTrackingTextColor` | `getStopTrackingTextColor` |
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
`BaseLayerChange`, `OverlayAdd`, `OverlayRemove`, `LayerAdd`, `LayerRemove`, `ZoomLevelsChange`, `Resize`, `Unload`, `ViewReset`, `Load`, `ZoomStart`, `MoveStart`, `Zoom`, `Move`, `ZoomEnd`, `MoveEnd`, `PopupOpen`, `PopupClose`, `AutopanStart`, `TooltipOpen`, `TooltipClose`, `LocationError`, `LocationFound`, `Click`, `DblClick`, `MouseDown`, `MouseUp`, `MouseOver`, `MouseOut`, `MouseMove`, `ContextMenu`, `Keypress`, `PreClick`, `ZoomAnim`, `MarkerDragStart`, `MarkerDrag`, `MarkerDragEnd`, `MarkerClick`, `MarkerDblclick`, `MarkerMouseDown`, `MarkerMouseUp`, `MarkerMouseOver`, `MarkerMouseOut`, `MarkerContextMenu`, `MarkerAdd`, `MarkerRemove`, `MarkerPopupOpen`, `MarkerPopupClose`, `MarkerTooltipOpen`, `MarkerTooltipClose`

Wire in parent: `Sub leaflet_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (81)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `InvalidateSize()` _(public)_
- `Refresh()` _(public)_
- `SetStyle(m As Map)` _(public)_
- `SetMarkerStyle(markerID As String, m As Map)` _(public)_
- `SetCircleStyle(markerID As String, m As Map)` _(public)_
- `PanTo(Lat As Double, Lng As Double)` _(public)_
- `SetView(Lat As Double, Lng As Double, Zoom As Int)` As 'ignoredeadcode _(public)_
- `GetDistance(lat1 As Double, lng1 As Double, lat2 As Double, lng2 As Double)` As Object _(public)_
- `FlyTo(Lat As Double, Lng As Double, Zoom As Int)` As 'ignoredeadcode _(public)_
- `Destroy()` _(public)_
- `Clear()` _(public)_
- `AddShapeFile(shpID As String, shpPath As String)` _(public)_
- `RemoveMarkers()` _(public)_
- `RemoveShapeFiles()` _(public)_
- `RemoveShapeFile(shpID As String)` _(public)_
- `RemoveCircles()` _(public)_
- `RemovePolyLines()` _(public)_
- `RemovePolyGons()` _(public)_
- `RemovePopUps()` _(public)_
- `RemovePopUp(markerID As String)` _(public)_
- `AddRectangle(markerID As String, lat1 As Double, lng1 As Double, lat2 As Double, lng2 As Double)` As BANanoObject _(public)_
- `AddCircle(markerID As String, markerLat As Double, markerLng As Double, Color As String, fillColor As String, fillOpacity As Double, Radius As Int)` As BANanoObject _(public)_
- `AddIcon(iconID As String, iconURL As String, widthPx As Int, heightPx As Int, anchorX As Int, anchorY As Int, popupAnchorX As Int, popupAnchorY As Int)` As BANanoObject _(public)_
- `AddImage(imgID As String, imgURL As String, southWestLat As Double, southWestLon As Double, northEastLat As Double, northEastLon As Double)` As BANanoObject _(public)_
- `SetMarkerIcon(markerID As String, iconID As String)` _(public)_
- `AddMarker(markerID As String, markerLat As Double, markerLng As Double)` As BANanoObject _(public)_
- `AddPolygon(polygonID As String, color As String, fillColor As String, fillOpacity As Double)` As BANanoObject _(public)_
- `AddPolyline(polyID As String, color As String, weight As Int, opacity As Double)` As BANanoObject _(public)_
- `AddPolylineMarker(polyID As String, Lat As Double, Lng As Double)` As SDUI5Leaflet _(public)_
- `RefreshPolyline(polyID As String)` As BANanoObject _(public)_
- `ClearPolygon(polygonID As String)` _(public)_
- `ClearPolygonObj(poly As BANanoObject)` _(public)_
- `ClearPolylineObj(poly As BANanoObject)` _(public)_
- `ClearPolyline(ID As String)` _(public)_
- `AddPolygonMarker(polygonID As String, Lat As Double, Lng As Double)` As SDUI5Leaflet _(public)_
- `AddPolygonMarkerObj(poly As BANanoObject, Lat As Double, Lng As Double)` As SDUI5Leaflet _(public)_
- `AddPolylineMarkerObj(poly As BANanoObject, Lat As Double, Lng As Double)` As SDUI5Leaflet _(public)_
- `RefreshPolygonObj(poly As BANanoObject)` _(public)_
- `RefreshPolylineObj(poly As BANanoObject)` _(public)_
- `RefreshPolygon(polygonID As String)` As BANanoObject _(public)_
- `RemoveMarker(markerID As String)` _(public)_
- `RemoveImage(imgID As String)` _(public)_
- `RemoveCircle(markerID As String)` _(public)_
- `RemoveRectangle(markerID As String)` _(public)_
- `RemovePolygon(markerID As String)` _(public)_
- `RemovePolyline(markerID As String)` _(public)_
- `RemoveMarkerObj(MarkerObject As BANanoObject)` As SDUI5Leaflet _(public)_
- `RemoveCircleObj(MarkerObject As BANanoObject)` As SDUI5Leaflet _(public)_
- `RemovePolygonObj(MarkerObject As BANanoObject)` As SDUI5Leaflet _(public)_
- `PolylineFitToBounds(polyID As String)` _(public)_
- `CircleFitToBounds(polyID As String)` _(public)_
- `PolygonFitToBounds(polyID As String)` _(public)_
- `GetPolylineBounds(polyID As String)` As Object _(public)_
- `GetCircleBounds(id As String)` As Object _(public)_
- `GetMarkerBounds(id As String)` As Object _(public)_
- `GetCircleRadius(id As String)` As Int _(public)_
- `FitBounds(target As Object)` _(public)_
- `RemovePolylineObj(MarkerObject As BANanoObject)` As SDUI5Leaflet _(public)_
- `SetMarkerDraggable(markerID As String, Draggable As Boolean)` As SDUI5Leaflet _(public)_
- `SetDraggableObj(MarkerObject As BANanoObject, Draggable As Boolean)` As SDUI5Leaflet _(public)_
- `SetMarkerAutoPan(markerID As String, AutoPan As Boolean)` As SDUI5Leaflet _(public)_
- `SetAutoPanObj(MarkerObject As BANanoObject, AutoPan As Boolean)` As SDUI5Leaflet _(public)_
- `SetMarkerTooltip(markerID As String, Tooltip As String)` As SDUI5Leaflet _(public)_
- `SetPolygonTooltip(markerID As String, Tooltip As String)` As SDUI5Leaflet _(public)_
- `SetCircleTooltip(markerID As String, Tooltip As String)` As SDUI5Leaflet _(public)_
- `SetTooltipObj(MarkerObject As BANanoObject, Tooltip As String)` As SDUI5Leaflet _(public)_
- `SetMarkerPopup(markerID As String, Popup As String)` As SDUI5Leaflet _(public)_
- `SetPopupObj(MarkerObject As BANanoObject, Popup As String)` As SDUI5Leaflet _(public)_
- `SetCirclePopup(markerID As String, Popup As String)` As SDUI5Leaflet _(public)_
- `SetPolygonPopup(markerID As String, Popup As String)` As SDUI5Leaflet _(public)_
- `BindMarkerEvent(MarkerObject As BANanoObject, Event As String, EventHandler As Object, Callback As String)` _(public)_
- `UnbindMarkerEvent(MarkerObject As BANanoObject, Event As String, EventHandler As Object, Callback As String)` _(public)_
- `Locate(bWatch As Boolean, bSetView As Boolean, bEnableHighAccuracy As Boolean)` _(public)_
- `StopLocate()` _(public)_
## Key Setters (28)
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
- `setCurrentCaption(s As String)` As 'ignoredeadcode _(public)_
- `setStartTrackingCaption(s As String)` As 'ignoredeadcode _(public)_
- `setStopTrackingCaption(s As String)` As 'ignoredeadcode _(public)_
- `setCurrentColor(s As String)` As 'ignoredeadcode _(public)_
- `setCurrentTextColor(s As String)` As 'ignoredeadcode _(public)_
- `setStartTrackingColor(s As String)` As 'ignoredeadcode _(public)_
- `setStartTrackingTextColor(s As String)` As 'ignoredeadcode _(public)_
- `setStopTrackingColor(s As String)` As 'ignoredeadcode _(public)_
- `setStopTrackingTextColor(s As String)` As 'ignoredeadcode _(public)_
- `setCenterFieldSet(b As Boolean)` As 'ignoredeadcode _(public)_
- `setLabel(s As String)` _(public)_
- `setTypeOf(s As String)` _(public)_
- `setLayerType(s As String)` As 'ignoredeadcode _(public)_
- `setGeonames(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setMaxZoom(i As Int)` _(public)_
- `setWidth(s As String)` _(public)_
- `setZoom(i As Int)` _(public)_
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
- `getCurrentCaption()` As String _(public)_
- `getStartTrackingCaption()` As String _(public)_
- `getStopTrackingCaption()` As String _(public)_
- `getCurrentColor()` As String _(public)_
- `getCurrentTextColor()` As String _(public)_
- `getStartTrackingColor()` As String _(public)_
- `getStartTrackingTextColor()` As String _(public)_
- `getStopTrackingColor()` As String _(public)_
- `getStopTrackingTextColor()` As String _(public)_
- `getCenterFieldSet()` As Boolean _(public)_
- `getLabel()` As String _(public)_
- `getTypeOf()` As String _(public)_
- `getContainer()` As BANanoElement _(public)_
- `getLayerType()` As String _(public)_
- `getGeonames()` As Boolean _(public)_
- `getHeight()` As String _(public)_
- `getMaxZoom()` As Int _(public)_
- `getWidth()` As String _(public)_
- `getZoom()` As Int _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgLeafLet.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgLeafLet.bas) (verified demo). `llmap` = a SDUI5Leaflet.

```b4j
	llmap.Initialize(Me, "llmap", "llmap")
	llmap.ParentID = "SDUI5Column1"
	llmap.Height = "800px"
	llmap.Width = "800px"
	llmap.Zoom = 13
	BANano.Await(llmap.AddComponent)
```

Builder methods, real call order (from `pgLeafLet.bas`):

```b4j
	llmap.AddIcon("customicon", "https://cdn-icons-png.flaticon.com/512/1673/1673221.png", 32, 32, 16, 32, 0, -32)
	llmap.AddMarker("el", -33.01529, 27.91162)
	llmap.SetMarkerTooltip("el", "East London Tooltip")
	llmap.SetMarkerPopup("el", "East London Popup")
	llmap.SetMarkerDraggable("el", True)
	llmap.SetMarkerAutoPan("el", True)
	llmap.SetView(-33.01529, 27.91162, llmap.Zoom)
	llmap.AddCircle("circle1", 51.508, -0.11, "red", "#f03", 0.5, 500)
	llmap.SetCircleTooltip("circle1", "This is a circle.")
	llmap.SetCirclePopup("circle1", "This is a popup.")
	llmap.AddPolygon("p1", "red", "#f03", 0.5)
	llmap.SetPolygonTooltip("p1", "This is a polygon tooltip!")
	llmap.SetPolygonPopUp("p1", "This is a polygon popup!")
	llmap.AddPolygonMarker("p1", 51.509, -0.08)
```

Demo-wired events: `Click`, `LocationError`, `LocationFound`, `MarkerAdd`, `MarkerClick`, `Zoom`, `ZoomLevelsChange` — handlers named `llmap_<Event>`.
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim leaflet As SDUI5Leaflet
leaflet.Initialize(Me, "SDUI5Leaflet", "SDUI5Leaflet")
leaflet.ParentID = "placeholder"
BANano.Await(leaflet.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


