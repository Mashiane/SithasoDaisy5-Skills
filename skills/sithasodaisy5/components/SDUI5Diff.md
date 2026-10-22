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
| `Rounded` | String | none | 0, 2xl, 3xl, full, lg, md, none, rounded, sm, xl | — | — |
| `RoundedBox` | Boolean | False | — | — | — |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | — | — |
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
## Public Methods (6)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
## Key Setters (22)
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
- `setDiffType(s As String)` _(public)_
- `setHeight(s As String)` As 'ignoredeadcode _(public)_
- `setWidth(s As String)` As 'ignoredeadcode _(public)_
- `setImage1(s As String)` _(public)_
- `setImage2(s As String)` _(public)_
- `setTextSize(s As String)` As 'ignoredeadcode _(public)_
- `setText1(s As String)` _(public)_
- `setText1BackgroundColor(s As String)` As 'ignoredeadcode _(public)_
- `setText1TextColor(s As String)` As 'ignoredeadcode _(public)_
- `setText2(s As String)` _(public)_
- `setText2BackgroundColor(s As String)` As 'ignoredeadcode _(public)_
- `setText2TextColor(s As String)` As 'ignoredeadcode _(public)_
## Getters (24)
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
- `getDiffType()` As String _(public)_
- `getHeight()` As String _(public)_
- `getImage1()` As String _(public)_
- `getImage2()` As String _(public)_
- `getTextSize()` As String _(public)_
- `getText1()` As String _(public)_
- `getText1BackgroundColor()` As String _(public)_
- `getText1TextColor()` As String _(public)_
- `getText2()` As String _(public)_
- `getText2BackgroundColor()` As String _(public)_
- `getText2TextColor()` As String _(public)_
- `getWidth()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgDiff.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgDiff.bas) (verified demo). `SDUI5Diff2` = a SDUI5Diff.

```b4j
	SDUI5Diff2.Initialize(Me, "SDUI5Diff2", "SDUI5Diff2")
	SDUI5Diff2.ParentID = "SDUI5Row1"
	SDUI5Diff2.DiffType = "text"
	SDUI5Diff2.Height = "300px"
	SDUI5Diff2.TextSize = "5xl"
	SDUI5Diff2.Width = "400px"
	BANano.Await(SDUI5Diff2.AddComponent)
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


