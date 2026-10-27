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
- `isChrome()` _(public)_
- `isCookie()` _(public)_
- `isFirefox()` _(public)_
- `isIE()` _(public)_
- `isIpad()` _(public)_
- `isIphone()` _(public)_
- `isIpod()` _(public)_
- `isLinux()` _(public)_
- `isLocalStorage()` _(public)_
- `isMac()` _(public)_
- `isMobile()` _(public)_
- `isMobileAndroid()` _(public)_
- `isMobileBlackBerry()` _(public)_
- `isMobileIOS()` _(public)_
- `isMobileMajor()` _(public)_
- `isMobileOpera()` _(public)_
- `isMobileSafari()` _(public)_
- `isMobileWindows()` _(public)_
- `isOpera()` _(public)_
- `isSafari()` _(public)_
- `isSessionStorage()` _(public)_
- `isSolaris()` _(public)_
- `isUbuntu()` _(public)_
- `isWindows()` _(public)_
- `SystemLanguage()` _(public)_

## Key Setters (0)

## Getters (23)
- `getAvailableResolution()` _(public)_
- `getBrowser()` _(public)_
- `getBrowserMajorVersion()` _(public)_
- `getBrowserVersion()` _(public)_
- `getColorDepth()` _(public)_
- `getCPU()` _(public)_
- `getCurrentResolution()` _(public)_
- `getDevice()` _(public)_
- `getDeviceType()` _(public)_
- `getDeviceVendor()` _(public)_
- `getDeviceXDPI()` _(public)_
- `getDeviceYDPI()` _(public)_
- `getEngine()` _(public)_
- `getEngineVersion()` _(public)_
- `getFingerprint()` _(public)_
- `getLanguage()` _(public)_
- `getOS()` _(public)_
- `getOSVersion()` _(public)_
- `getPlugins()` _(public)_
- `getScreenPrint()` _(public)_
- `getSoftwareVersion()` _(public)_
- `getTimeZone()` _(public)_
- `getUserAgent()` _(public)_

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
