---
name: SDUI5VideoPlayer
description: SithasoDaisy5 SDUI5VideoPlayer component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5VideoPlayer

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5VideoPlayer.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5VideoPlayer.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgVideoPlayer.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgVideoPlayer.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5VideoPlayer plays video (mp4/youtube). Use for video display.
_SDUI5VideoPlayer is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `TypeOf` | String | video | audio, video | `setTypeOf` | `getTypeOf` |
| `Provider` | String | youtube | vimeo, youtube, none | `setProvider` | `getProvider` |
| `Embed` | Boolean | False | — | `setEmbed` | `getEmbed` |
| `EmbedId` | String | — | — | `setEmbedId` | `getEmbedId` |
| `Mp4Url` | String | — | — | `setMp4Url` | `getMp4Url` |
| `Mp3Url` | String | — | — | `setMp3Url` | `getMp3Url` |
| `Poster` | String | — | — | `setPoster` | `getPoster` |
| `Title` | String | — | — | `setTitle` | `getTitle` |
| `Width` | String | 500px | — | `setWidth` | `getWidth` |
| `Height` | String | 500px | — | `setHeight` | `getHeight` |
| `Autoplay` | Boolean | False | — | `setAutoplay` | `getAutoplay` |
| `Controls` | Boolean | True | — | `setControls` | `getControls` |
| `Crossorigin` | Boolean | True | — | `setCrossOrigin` | `getCrossorigin` |
| `IconUrl` | String | ./assets/plyr.svg | — | `setIconUrl` | `getIconUrl` |
| `Playsinline` | Boolean | True | — | `setPlaysInline` | `getPlaysinline` |
| `Captions` | Boolean | True | — | `setCaptions` | `getCaptions` |
| `Keyboard` | Boolean | True | — | `setKeyboard` | `getKeyboard` |
| `Tooltips` | Boolean | True | — | `setTooltips` | `getTooltips` |
| `Rounded` | String | none | none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 | `setRounded` | `getRounded` |
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

Wire in parent: `Sub videoplayer_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (8)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Refresh()` _(public)_
## Key Setters (31)
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
- `setMp3Url(s As String)` As 'ignoredeadcode _(public)_
- `setTypeOf(s As String)` As 'ignoredeadcode _(public)_
- `setCaptions(b As Boolean)` _(public)_
- `setKeyboard(b As Boolean)` _(public)_
- `setRounded(s As String)` _(public)_
- `setTooltips(b As Boolean)` _(public)_
- `setEmbed(b As Boolean)` _(public)_
- `setMp4Url(s As String)` As 'ignoredeadcode _(public)_
- `setAutoplay(b As Boolean)` _(public)_
- `setControls(b As Boolean)` As 'ignoredeadcode _(public)_
- `setCrossOrigin(b As Boolean)` As 'ignoredeadcode _(public)_
- `setEmbedId(s As String)` _(public)_
- `setHeight(s As String)` _(public)_
- `setIconUrl(s As String)` _(public)_
- `setPlaysInline(b As Boolean)` As 'ignoredeadcode _(public)_
- `setPoster(s As String)` As 'ignoredeadcode _(public)_
- `setProvider(s As String)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setTitle(s As String)` _(public)_
- `setWidth(s As String)` _(public)_
## Getters (33)
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
- `getMp3Url()` As String _(public)_
- `getTypeOf()` As String _(public)_
- `getCaptions()` As Boolean _(public)_
- `getKeyboard()` As Boolean _(public)_
- `getRounded()` As String _(public)_
- `getTooltips()` As Boolean _(public)_
- `getEmbed()` As Boolean _(public)_
- `getMp4Url()` As String _(public)_
- `getAutoplay()` As Boolean _(public)_
- `getControls()` As Boolean _(public)_
- `getCrossorigin()` As Boolean _(public)_
- `getEmbedId()` As String _(public)_
- `getHeight()` As String _(public)_
- `getIconUrl()` As String _(public)_
- `getPlaysinline()` As Boolean _(public)_
- `getPoster()` As String _(public)_
- `getProvider()` As String _(public)_
- `getRoundedBox()` As Boolean _(public)_
- `getShadow()` As String _(public)_
- `getTitle()` As String _(public)_
- `getWidth()` As String _(public)_
## Private Methods (1)
- `SetDefaults()` _(private)_
## Verified Demo Usage

Real syntax from [`pgVideoPlayer.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgVideoPlayer.bas) (verified demo). `SDUI5VideoPlayer2` = a SDUI5VideoPlayer.

```b4j
	SDUI5VideoPlayer2.Initialize(Me, "SDUI5VideoPlayer2", "SDUI5VideoPlayer2")
	SDUI5VideoPlayer2.ParentID = "SDUI5Column2"
	SDUI5VideoPlayer2.Embed = True
	SDUI5VideoPlayer2.EmbedId = "76979871"
	SDUI5VideoPlayer2.Height = ""
	SDUI5VideoPlayer2.Poster = "https://cdn.plyr.io/static/demo/View_From_A_Blue_Moon_Trailer-HD.jpg"
	SDUI5VideoPlayer2.Provider = "vimeo"
	SDUI5VideoPlayer2.Rounded = "lg"
	SDUI5VideoPlayer2.Shadow = "lg"
	SDUI5VideoPlayer2.Title = "View From A Blue Moon"
	BANano.Await(SDUI5VideoPlayer2.AddComponent)
```
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `rounded-box`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim videoplayer As SDUI5VideoPlayer
videoplayer.Initialize(Me, "SDUI5VideoPlayer", "SDUI5VideoPlayer")
videoplayer.ParentID = "placeholder"
BANano.Await(videoplayer.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


