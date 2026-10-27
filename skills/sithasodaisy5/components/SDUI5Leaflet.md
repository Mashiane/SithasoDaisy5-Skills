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
| `Lat` | String | 0 | — | `setLat` | `getLat` |
| `Lng` | String | 0 | — | `setLng` | `getLng` |
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
## Public Methods (57)
- `AddCircle(markerID As String, markerLat As Double, markerLng As Double, Color As String, fillColor As String, fillOpacity As Double, Radius As Int)` As BANanoObject _(public)_
- `AddComponent()` _(public)_
- `AddIcon(iconID As String, iconURL As String, widthPx As Int, heightPx As Int, anchorX As Int, anchorY As Int, popupAnchorX As Int, popupAnchorY As Int)` As BANanoObject _(public)_
- `AddImage(imgID As String, imgURL As String, southWestLat As Double, southWestLon As Double, northEastLat As Double, northEastLon As Double)` As BANanoObject _(public)_
- `AddMarker(markerID As String, markerLat As Double, markerLng As Double)` As BANanoObject _(public)_
- `AddPolygon(polygonID As String, color As String, fillColor As String, fillOpacity As Double)` As BANanoObject _(public)_
- `AddPolygonMarker(polygonID As String, Lat As Double, Lng As Double)` As SDUI5Leaflet _(public)_
- `AddPolygonMarkerObj(poly As BANanoObject, Lat As Double, Lng As Double)` As SDUI5Leaflet _(public)_
- `AddPolyline(polyID As String, color As String, weight As Int, opacity As Double)` As BANanoObject _(public)_
- `AddPolylineMarker(polyID As String, Lat As Double, Lng As Double)` As SDUI5Leaflet _(public)_
- `AddPolylineMarkerObj(poly As BANanoObject, Lat As Double, Lng As Double)` As SDUI5Leaflet _(public)_
- `AddRectangle(markerID As String, lat1 As Double, lng1 As Double, lat2 As Double, lng2 As Double)` As BANanoObject _(public)_
- `AddShapeFile(shpID As String, shpPath As String)` _(public)_
- `BindMarkerEvent(MarkerObject As BANanoObject, Event As String, EventHandler As Object, Callback As String)` _(public)_
- `CircleFitToBounds(polyID As String)` _(public)_
- `Clear()` _(public)_
- `ClearPolygon(polygonID As String)` _(public)_
- `ClearPolygonObj(poly As BANanoObject)` _(public)_
- `ClearPolyline(ID As String)` _(public)_
- `ClearPolylineObj(poly As BANanoObject)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Destroy()` _(public)_
- `FitBounds(target As Object)` _(public)_
- `FlyTo(Lat As Double, Lng As Double, Zoom As Int)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `InvalidateSize()` _(public)_
- `Locate(bWatch As Boolean, bSetView As Boolean, bEnableHighAccuracy As Boolean)` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `PanTo(Lat As Double, Lng As Double)` _(public)_
- `PolygonFitToBounds(polyID As String)` _(public)_
- `PolylineFitToBounds(polyID As String)` _(public)_
- `Refresh()` _(public)_
- `RefreshPolygon(polygonID As String)` As BANanoObject _(public)_
- `RefreshPolygonObj(poly As BANanoObject)` _(public)_
- `RefreshPolyline(polyID As String)` As BANanoObject _(public)_
- `RefreshPolylineObj(poly As BANanoObject)` _(public)_
- `Remove()` _(public)_
- `RemoveCircle(markerID As String)` _(public)_
- `RemoveCircleObj(MarkerObject As BANanoObject)` As SDUI5Leaflet _(public)_
- `RemoveCircles()` _(public)_
- `RemoveImage(imgID As String)` _(public)_
- `RemoveMarker(markerID As String)` _(public)_
- `RemoveMarkerObj(MarkerObject As BANanoObject)` As SDUI5Leaflet _(public)_
- `RemoveMarkers()` _(public)_
- `RemovePolygon(markerID As String)` _(public)_
- `RemovePolygonObj(MarkerObject As BANanoObject)` As SDUI5Leaflet _(public)_
- `RemovePolyGons()` _(public)_
- `RemovePolyline(markerID As String)` _(public)_
- `RemovePolylineObj(MarkerObject As BANanoObject)` As SDUI5Leaflet _(public)_
- `RemovePolyLines()` _(public)_
- `RemovePopUp(markerID As String)` _(public)_
- `RemovePopUps()` _(public)_
- `RemoveRectangle(markerID As String)` _(public)_
- `RemoveShapeFile(shpID As String)` _(public)_
- `RemoveShapeFiles()` _(public)_
- `StopLocate()` _(public)_
- `UnbindMarkerEvent(MarkerObject As BANanoObject, Event As String, EventHandler As Object, Callback As String)` _(public)_

## Key Setters (50)
- `setAttributes(s As String)` _(public)_
- `SetAutoPanObj(MarkerObject As BANanoObject, AutoPan As Boolean)` As SDUI5Leaflet _(public)_
- `setCenterFieldSet(b As Boolean)` _(public)_
- `SetCirclePopup(markerID As String, Popup As String)` As SDUI5Leaflet _(public)_
- `SetCircleStyle(markerID As String, m As Map)` _(public)_
- `SetCircleTooltip(markerID As String, Tooltip As String)` As SDUI5Leaflet _(public)_
- `setClasses(s As String)` _(public)_
- `setCurrentCaption(s As String)` _(public)_
- `setCurrentColor(s As String)` _(public)_
- `setCurrentTextColor(s As String)` _(public)_
- `SetDraggableObj(MarkerObject As BANanoObject, Draggable As Boolean)` As SDUI5Leaflet _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setGeonames(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setLabel(s As String)` _(public)_
- `setLat(s As String)` _(public)_
- `setLayerType(s As String)` _(public)_
- `setLng(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `SetMarkerAutoPan(markerID As String, AutoPan As Boolean)` As SDUI5Leaflet _(public)_
- `SetMarkerDraggable(markerID As String, Draggable As Boolean)` As SDUI5Leaflet _(public)_
- `SetMarkerIcon(markerID As String, iconID As String)` _(public)_
- `SetMarkerPopup(markerID As String, Popup As String)` As SDUI5Leaflet _(public)_
- `SetMarkerRotationAngle(id As String, rotationAngle As Float)` _(public)_
- `SetMarkerRotationOrigin(id As String, rotationOrigin As Float)` _(public)_
- `SetMarkerStyle(markerID As String, m As Map)` _(public)_
- `SetMarkerTooltip(markerID As String, Tooltip As String)` As SDUI5Leaflet _(public)_
- `setMaxZoom(i As Int)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `SetPolygonPopup(markerID As String, Popup As String)` As SDUI5Leaflet _(public)_
- `SetPolygonTooltip(markerID As String, Tooltip As String)` As SDUI5Leaflet _(public)_
- `SetPopupObj(MarkerObject As BANanoObject, Popup As String)` As SDUI5Leaflet _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setStartTrackingCaption(s As String)` _(public)_
- `setStartTrackingColor(s As String)` _(public)_
- `setStartTrackingTextColor(s As String)` _(public)_
- `setStopTrackingCaption(s As String)` _(public)_
- `setStopTrackingColor(s As String)` _(public)_
- `setStopTrackingTextColor(s As String)` _(public)_
- `SetStyle(m As Map)` _(public)_
- `setStyles(s As String)` _(public)_
- `SetTooltipObj(MarkerObject As BANanoObject, Tooltip As String)` As SDUI5Leaflet _(public)_
- `setTypeOf(s As String)` _(public)_
- `SetView(Lat As Double, Lng As Double, Zoom As Int)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_
- `setZoom(i As Int)` _(public)_

## Getters (39)
- `getAttributes()` _(public)_
- `getCenterFieldSet()` _(public)_
- `GetCircleBounds(id As String)` As Object _(public)_
- `GetCircleRadius(id As String)` As Int _(public)_
- `getClasses()` _(public)_
- `getContainer()` _(public)_
- `getCurrentCaption()` _(public)_
- `getCurrentColor()` _(public)_
- `getCurrentTextColor()` _(public)_
- `GetDistance(lat1 As Double, lng1 As Double, lat2 As Double, lng2 As Double)` As Object _(public)_
- `getEnabled()` _(public)_
- `getGeonames()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getLabel()` _(public)_
- `getLat()` _(public)_
- `getLayerType()` _(public)_
- `getLng()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `GetMarkerBounds(id As String)` As Object _(public)_
- `getMaxZoom()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `GetPolylineBounds(polyID As String)` As Object _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getStartTrackingCaption()` _(public)_
- `getStartTrackingColor()` _(public)_
- `getStartTrackingTextColor()` _(public)_
- `getStopTrackingCaption()` _(public)_
- `getStopTrackingColor()` _(public)_
- `getStopTrackingTextColor()` _(public)_
- `getStyles()` _(public)_
- `getTypeOf()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_
- `getZoom()` _(public)_

## Private Methods (6)
- `BindEvent(Event As String, EventHandler As Object, Callback As String)` _(private)_
- `GetCurrentPosition(e As BANanoEvent)` _(private)_
- `LeafletMapEvent(Event As Map)` _(private)_
- `MarkerEvent(Event As Map)` _(private)_
- `SetDefaults()` _(private)_
- `UnbindEvent(Event As String, EventHandler As Object, Callback As String)` _(private)_

## Verified Demo Usage

Real syntax from [`pgLeafLet.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgLeafLet.bas) (verified demo):

```b4j
Private llmap As SDUI5Leaflet		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

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
