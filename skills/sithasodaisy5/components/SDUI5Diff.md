---
name: SDUI5Diff
description: SithasoDaisy5 SDUI5Diff component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Diff

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Diff.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Diff.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgDiff.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgDiff.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Diff shows a before/after comparison (diff). Use for image/text comparisons.
_SDUI5Diff is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `DiffType` | String | image | image, text | `setDiffType` | `getDiffType` |
| `Height` | String | 80 | — | `setHeight` | `getHeight` |
| `Width` | String | 80 | — | `setWidth` | `getWidth` |
| `Image1` | String | ./assets/13.jpg | — | `setImage1` | `getImage1` |
| `Image2` | String | ./assets/13.jpg | — | `setImage2` | `getImage2` |
| `Text1` | String | SITHASODAISY5 | — | `setText1` | `getText1` |
| `TextSize` | String | 9xl | 2xl, 3xl, 4xl, 5xl, 6xl, 7xl, 8xl, 9xl, base, lg, md, none, sm, xl, xs | `setTextSize` | `getTextSize` |
| `Text1TextColor` | String | primary-content | — | `setText1TextColor` | `getText1TextColor` |
| `Text1BackgroundColor` | String | primary | — | `setText1BackgroundColor` | `getText1BackgroundColor` |
| `Text2` | String | SITHASODAISY5 | — | `setText2` | `getText2` |
| `Text2TextColor` | String | — | — | `setText2TextColor` | `getText2TextColor` |
| `Text2BackgroundColor` | String | base-200 | — | `setText2BackgroundColor` | `getText2BackgroundColor` |
| `Rounded` | String | none | 0, 2xl, 3xl, full, lg, md, none, rounded, sm, xl | `setRounded` | `getRounded` |
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
_(none declared)_

Wire in parent: `Sub diff_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (4)
- `AddComponent()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Remove()` _(public)_

## Key Setters (26)
- `setAttributes(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setDiffType(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setImage1(s As String)` _(public)_
- `setImage2(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRounded(s As String)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setText1(s As String)` _(public)_
- `setText1BackgroundColor(s As String)` _(public)_
- `setText1TextColor(s As String)` _(public)_
- `setText2(s As String)` _(public)_
- `setText2BackgroundColor(s As String)` _(public)_
- `setText2TextColor(s As String)` _(public)_
- `setTextSize(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (28)
- `getAttributes()` _(public)_
- `getClasses()` _(public)_
- `getDiffType()` _(public)_
- `getEnabled()` _(public)_
- `getHeight()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getImage1()` _(public)_
- `getImage2()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRounded()` _(public)_
- `getRoundedBox()` _(public)_
- `getShadow()` _(public)_
- `getStyles()` _(public)_
- `getText1()` _(public)_
- `getText1BackgroundColor()` _(public)_
- `getText1TextColor()` _(public)_
- `getText2()` _(public)_
- `getText2BackgroundColor()` _(public)_
- `getText2TextColor()` _(public)_
- `getTextSize()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgDiff.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgDiff.bas) (verified demo):

```b4j
Private SDUI5Diff1 As SDUI5Diff		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `diff aspect-16/9`, `rounded-box`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim diff As SDUI5Diff
diff.Initialize(Me, "SDUI5Diff", "SDUI5Diff")
diff.ParentID = "placeholder"
BANano.Await(diff.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
