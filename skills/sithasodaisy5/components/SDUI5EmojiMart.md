---
name: SDUI5EmojiMart
description: SithasoDaisy5 SDUI5EmojiMart component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5EmojiMart

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5EmojiMart.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5EmojiMart.bas)
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5EmojiMart is an emoji picker (emoji-mart). Use to let users insert emojis into text inputs.
_SDUI5EmojiMart is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `AutoFocus` | Boolean | False | — | `setAutoFocus` | `getAutoFocus` |
| `DynamicWidth` | Boolean | False | — | `setDynamicWidth` | `getDynamicWidth` |
| `EmojiButtonSize` | Int | 36 | lg, md, none, sm, xl, xs | `setEmojiButtonSize` | `getEmojiButtonSize` |
| `EmojiButtonsRadius` | String | 100% | — | `setEmojiButtonsRadius` | `getEmojiButtonsRadius` |
| `EmojiSize` | Int | 24 | lg, md, none, sm, xl, xs | `setEmojiSize` | `getEmojiSize` |
| `EmojiVersion` | String | 15 | — | `setEmojiVersion` | `getEmojiVersion` |
| `Icons` | String | auto | auto, outline, solid | `setIcons` | `getIcons` |
| `Locale` | String | en | — | `setLocale` | `getLocale` |
| `MaxFrequentRows` | Int | 4 | — | `setMaxFrequentRows` | `getMaxFrequentRows` |
| `NavPosition` | String | top | bottom, none, top | `setNavPosition` | `getNavPosition` |
| `NoCountryFlags` | Boolean | False | — | `setNoCountryFlags` | `getNoCountryFlags` |
| `NoResultsEmoji` | String | cry | — | `setNoResultsEmoji` | `getNoResultsEmoji` |
| `PerLine` | Int | 9 | — | `setPerLine` | `getPerLine` |
| `PreviewEmoji` | String | point_up | — | `setPreviewEmoji` | `getPreviewEmoji` |
| `PreviewPosition` | String | bottom | bottom, none, top | `setPreviewPosition` | `getPreviewPosition` |
| `SearchPosition` | String | sticky | none, static, sticky | `setSearchPosition` | `getSearchPosition` |
| `SetOf` | String | apple | apple, facebook, google, native, twitter | `setSetOf` | `getSetOf` |
| `Skin` | Int | 1, MinRange: 1, MaxRange: 6 | — | `setSkin` | `getSkin` |
| `SkinTonePosition` | String | preview | none, preview, search | `setSkinTonePosition` | `getSkinTonePosition` |
| `Theme` | String | auto | auto, dark, light | `setTheme` | `getTheme` |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
## Events
`EmojiSelect`, `ClickOutside`

Wire in parent: `Sub emojimart_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (7)
- `AddComponent()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `LinkExisting()` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `Refresh(Module As Object, SelectMethod As String, ClickOutSideMethod As String)` _(public)_
- `Remove()` _(public)_

## Key Setters (22)
- `setAutoFocus(b As Boolean)` _(public)_
- `setDynamicWidth(b As Boolean)` _(public)_
- `setEmojiButtonSize(i As Int)` _(public)_
- `setEmojiButtonsRadius(s As String)` _(public)_
- `setEmojiSize(i As Int)` _(public)_
- `setEmojiVersion(s As String)` _(public)_
- `setIcons(s As String)` _(public)_
- `setLocale(s As String)` _(public)_
- `setMaxFrequentRows(i As Int)` _(public)_
- `setNavPosition(s As String)` _(public)_
- `setNoCountryFlags(b As Boolean)` _(public)_
- `setNoResultsEmoji(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPerLine(i As Int)` _(public)_
- `setPreviewEmoji(s As String)` _(public)_
- `setPreviewPosition(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setSearchPosition(s As String)` _(public)_
- `setSetOf(s As String)` _(public)_
- `setSkin(i As Int)` _(public)_
- `setSkinTonePosition(s As String)` _(public)_
- `setTheme(s As String)` _(public)_

## Getters (24)
- `getAutoFocus()` _(public)_
- `getDynamicWidth()` _(public)_
- `getEmojiButtonSize()` _(public)_
- `getEmojiButtonsRadius()` _(public)_
- `getEmojiSize()` _(public)_
- `getEmojiVersion()` _(public)_
- `getHere()` As String _(public)_
- `getIcons()` _(public)_
- `getID()` As String _(public)_
- `getLocale()` _(public)_
- `getMaxFrequentRows()` _(public)_
- `getNavPosition()` _(public)_
- `getNoCountryFlags()` _(public)_
- `getNoResultsEmoji()` _(public)_
- `getParentID()` _(public)_
- `getPerLine()` _(public)_
- `getPreviewEmoji()` _(public)_
- `getPreviewPosition()` _(public)_
- `GetProperties()` _(public)_
- `getSearchPosition()` _(public)_
- `getSetOf()` _(public)_
- `getSkin()` _(public)_
- `getSkinTonePosition()` _(public)_
- `getTheme()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim emojimart As SDUI5EmojiMart
emojimart.Initialize(Me, "SDUI5EmojiMart", "SDUI5EmojiMart")
emojimart.ParentID = "placeholder"
BANano.Await(emojimart.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
