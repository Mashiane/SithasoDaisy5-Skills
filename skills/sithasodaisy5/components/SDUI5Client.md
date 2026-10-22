---
name: SDUI5Client
description: SithasoDaisy5 SDUI5Client component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Client

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Client.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Client.bas)
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Client is an API/HTTP client helper component for making requests. Use for calling backend endpoints.
_SDUI5Client is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
## Skeleton Contract
Every SithasoDaisy5 component follows the same shape (see SDUI5Component base):
1. `Initialize(Callback, Name, EventName)` — sets `mCallBack`, `mName`, `mEventName`, calls `SetDefaults`.
2. `ParentID` (property / `setParentID(id)`) — attach point in the DOM.
3. `DesignerCreateView(Target, Props)` — INTERNAL (called by `AddComponent`, never from app code); reads `CustProps`, pushes daisyUI classes via `UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT`, appends `[BANCLEAN]<tag id="{name}">`, wires `UI.OnEvent`.
4. Live setters mutate the DOM via `UI.*ByID("{name}_child")`.

**Init signature**: `Initialize()` | **Has DesignerCreateView**: No
## Designer Properties
_(inherits from SDUI5Component base — see base contract)_
## Events
_(none declared)_

Wire in parent: `Sub client_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (26)
- `Initialize()` _(public)_
- `isMobile()` As Boolean _(public)_
- `isMobileAndroid()` As Boolean _(public)_
- `isMobileIOS()` As Boolean _(public)_
- `isIE()` As Boolean _(public)_
- `isChrome()` As Boolean _(public)_
- `isFirefox()` As Boolean _(public)_
- `isSafari()` As Boolean _(public)_
- `isOpera()` As Boolean _(public)_
- `isMobileSafari()` As Boolean _(public)_
- `isWindows()` As Boolean _(public)_
- `isMac()` As Boolean _(public)_
- `isLinux()` As Boolean _(public)_
- `isUbuntu()` As Boolean _(public)_
- `isSolaris()` As Boolean _(public)_
- `isMobileMajor()` As Boolean _(public)_
- `isMobileOpera()` As Boolean _(public)_
- `isMobileWindows()` As Boolean _(public)_
- `isMobileBlackBerry()` As Boolean _(public)_
- `isIphone()` As Boolean _(public)_
- `isIpad()` As Boolean _(public)_
- `isIpod()` As Boolean _(public)_
- `isLocalStorage()` As Boolean _(public)_
- `isSessionStorage()` As Boolean _(public)_
- `isCookie()` As Boolean _(public)_
- `SystemLanguage()` As String _(public)_
## Key Setters (0)
_(none — uses base SDUI5Component setters only)_
## Getters (23)
- `getFingerprint()` As Object _(public)_
- `getSoftwareVersion()` As String _(public)_
- `getUserAgent()` As String _(public)_
- `getBrowser()` As String _(public)_
- `getBrowserVersion()` As String _(public)_
- `getBrowserMajorVersion()` As String _(public)_
- `getEngine()` As String _(public)_
- `getEngineVersion()` As String _(public)_
- `getOS()` As String _(public)_
- `getOSVersion()` As String _(public)_
- `getDevice()` As String _(public)_
- `getDeviceType()` As String _(public)_
- `getDeviceVendor()` As String _(public)_
- `getCPU()` As String _(public)_
- `getScreenPrint()` As String _(public)_
- `getColorDepth()` As String _(public)_
- `getCurrentResolution()` As String _(public)_
- `getAvailableResolution()` As String _(public)_
- `getDeviceXDPI()` As String _(public)_
- `getDeviceYDPI()` As String _(public)_
- `getPlugins()` As String _(public)_
- `getTimeZone()` As String _(public)_
- `getLanguage()` As String _(public)_
## Private Methods (0)
_(none)_
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim client As SDUI5Client
client.Initialize(Me, "SDUI5Client", "SDUI5Client")
client.ParentID = "placeholder"
BANano.Await(client.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


