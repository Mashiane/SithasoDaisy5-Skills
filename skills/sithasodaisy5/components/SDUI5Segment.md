---
name: SDUI5Segment
description: SithasoDaisy5 SDUI5Segment component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Segment

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Segment.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Segment.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgTabs.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTabs.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Segment is a segmented control (tabs-like). Use for switching between views.
_SDUI5Segment is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `Size` | String | md | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `Height` | String | fit | — | `setHeight` | `getHeight` |
| `Width` | String | fit | — | `setWidth` | `getWidth` |
| `RawOptions` | String | btn1=Button 1; btn2=Button 2; btn3=Button 3 | — | `setOptions` | `getOptions` |
| `IconSize` | String | 20px | — | `setIconSize` | `getIconSize` |
| `BadgeColor` | String | — | — | `setBadgeColor` | `getBadgeColor` |
| `BadgeSize` | String | md | lg, md, none, sm, xl, xs | `setBadgeSize` | `getBadgeSize` |
| `ActiveColor` | String | #0000ff | — | `setActiveColor` | `getActiveColor` |
| `ActiveTextColor` | String | #ffffff | — | `setActiveTextColor` | `getActiveTextColor` |
| `OptionWidth` | String | 32 | — | `setOptionWidth` | `getOptionWidth` |
| `Active` | String | btn1 | — | `setActive` | `getActive` |
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

Wire in parent: `Sub segment_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (8)
- `AddButton(sKey As String, sText As String)` _(public)_
- `AddComponent()` _(public)_
- `AddTabItem(sKey As String, sText As String, sIcon As String, sBadge As String)` As SDUI5TabsItem _(public)_
- `Clear()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Remove()` _(public)_
- `TabItem(skey As String)` As SDUI5TabsItem _(public)_

## Key Setters (23)
- `setActive(item As String)` _(public)_
- `setActiveColor(s As String)` _(public)_
- `setActiveTextColor(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setBadgeColor(s As String)` _(public)_
- `setBadgeSize(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setDisabled(sitems As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setIconSize(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setOptions(s As String)` _(public)_
- `setOptionWidth(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setSize(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (25)
- `getActive()` _(public)_
- `getActiveColor()` _(public)_
- `getActiveTextColor()` _(public)_
- `getAttributes()` _(public)_
- `getBadgeColor()` _(public)_
- `getBadgeSize()` _(public)_
- `getClasses()` _(public)_
- `getDisabled()` _(public)_
- `getEnabled()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getIconSize()` _(public)_
- `getID()` As String _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getOptions()` _(public)_
- `getOptionWidth()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getSize()` _(public)_
- `getStyles()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_

## Private Methods (3)
- `itemchange(e As BANanoEvent)` _(private)_
- `SetActiveInternal(item As String)` _(private)_
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgTabs.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTabs.bas) (verified demo):

```b4j
Private segment1 As SDUI5Segment		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `tabs tabs-box inline-flex flex-nowrap whitespace-nowrap`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim segment As SDUI5Segment
segment.Initialize(Me, "SDUI5Segment", "SDUI5Segment")
segment.ParentID = "placeholder"
BANano.Await(segment.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
