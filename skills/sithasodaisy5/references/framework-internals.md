---
name: framework-internals
description: How the SithasoDaisy5 wrapper works (read-only). Library build, component anatomy traced through SDUI5Button, UIShared engine, UsesX bundles, daisyUI upstream mapping, and how to read source when docs fall short.
---

# Framework Internals (read-only)

Framework root: `C:\b4j\workspace\0SithasoDaisy5`. **App-building agents never
write here** (Constitution Art II.5). This file exists so agents understand
*why* the documented patterns are the way they are. All line citations below
were read 2026-10-11; re-verify against source if the library bumps.

## 1. Library build: project run produces the .b4xlib

- `SithasoDaisy5.b4j` is a B4J library project: ~160 top-level `.bas` files,
  `ModuleN=` registry (159 entries), `FileN=` third-party assets.
- Running it (B4J IDE or B4JBuilder) executes the embedded build module, which
  calls `BANano.BuildAsB4Xlib(LibVersion)` (`SithasoDaisy5.b4j:920`).
- Output `SithasoDaisy5.b4xlib` is what every BANano app project references.
  App agents consume the library; only the library author rebuilds it.

## 2. Wrapper anatomy, traced through SDUI5Button.bas

Every `SDUI5*` class is a thin B4J wrapper that turns designer properties
into daisyUI classes at mount time:

1. **`#DesignerProperty` declarations** (top of file) = the documented props
   table. `Key` is the API name, `List:` is the allowed-values enum. The
   extractor (`sd5-book-to-skill`) reads exactly these lines.
2. **`Class_Globals`**: private state per prop (`sColor`, `bOutline`, …) +
   `Public UI As UIShared` (the DOM engine) + `Public CustProps As Map`
   (props baked at mount) + `mName/mEventName/mElement/mCallBack`.
3. **`Initialize(Callback, Name, EventName)`** → `UI.Initialize(Me)`,
   `CleanID` on names, `CustProps.Initialize`, `SetDefaults` (defaults match
   the `DefaultValue:` attributes).
4. **`AddComponent`** (the ONLY app-facing mount call): resolves `"#ParentID"`,
   then calls `DesignerCreateView` internally.
5. **`DesignerCreateView(Target, Props)`** (INTERNAL, e.g. `SDUI5Button:469`):
   reads each prop and pushes classes — `UI.AddClassDT("btn-outline")`,
   `UI.AddColorDT("btn", sColor)` (`:665`), responsive `lg:btn-…` variants
   (`:671-674`) — then appends the `[BANCLEAN]<tag id="{name}">` node and wires
   events via `UI.OnEvent` (`:278-279`). **Never call from app code.**
6. **Live setters** (`setX`) mutate the mounted DOM via `UI.*ByID`
   (`SetVisible`/`SetEnabled` guard on `mElement = Null`, `:322-334`).
7. **`Remove()`** detaches `mElement` + nulls the reference.

Base defaults (`SDUI5Component.bas`): `TagName=div`, `Visible/Enabled=True`,
`PositionStyle=none`, margin/padding `a=?;…` sentinels, `RawClasses/RawStyles/
RawAttributes` escape hatches (JSON with `=`/`;`).

## 3. UIShared.bas — the single DOM engine

Every component holds one `UI As UIShared`. All class assembly
(`AddClassDT/BuildExClass`), color routing (`AddColorDT/SetColor`), event
wiring (`OnEvent`), lazy assets (`LoadAssetsOnDemand`), and sanitizers
(`CleanID`) route through it. One engine → consistent output; a class bug
here affects all components (widen regression scope accordingly).

## 4. UsesX loaders = named asset bundles (SDUI5App.bas ~844-1007)

```b4x
Banano.Await(UI.LoadAssetsOnDemand("KanBan", Array("jkanban.min.css", "dragula.min.js", "jkanban.min.js")))  ' :861
```

Each `UsesX` maps one lazy dependency to its `FileN=`-registered files
(BANano `ForLater` pattern — see `banano-essentials.md` §4). Call the loader
in `pgIndex` before any page mounts a component that needs it
(`uses-assets-map.md` is the table; `SDUI5App.bas` is the truth).

## 5. daisyUI upstream mapping (daisyui.com)

Each component wraps one daisyUI component: `SDUI5Button→btn`
(`daisyui.com/components/button`), `SDUI5Card→card`, `SDUI5Modal→modal`, ….
`daisyui-master/` in the framework root is the vendored daisyUI source —
the upstream reference for "does this class exist". A portable copy,
`daisyui-master.zip` (repo root, 1496 entries), serves the skill's
cross-referencing (`crossref_daisyui.py`) without touching the framework
checkout. Canonical readability order: daisyui.com docs → vendored source →
our component docs. Note: upstream ships its own agent skills inside
`.agents/skills/` — useful future study, not our authority. Emitted-class
lists in component docs must be a subset of upstream; `crossref_daisyui.py`
checks this mechanically. When the model wants a visual daisyUI does not
have, the Style Tiers policy (approximate + declare) applies — never an
invented class.

## 6. Reading source when docs fall short

1. Props/defaults/enums → `#DesignerProperty` lines at file top.
2. Emitted markup/classes → `DesignerCreateView` body (`AddClassDT/AddColorDT/
   AddRoundedDT/AddShadowDT` strings are literal upstream classes).
3. Events → `UI.OnEvent` calls; handler = `${mEventName}_<event>`.
4. Mount order/slots → demo `pg*.bas` (component-manifest demo evidence).
5. Case: source filenames keep their own casing (`SDUI5Megamenu.bas`,
   `SDUI5Textrotate.bas`); registry/docs use `MegaMenu`/`TextRotate`. B4J is
   case-insensitive — treat as identical, record registry casing in docs.

## 7. Framework gap protocol

Source bug or missing capability found while building an app: do NOT patch
framework source. Ship the closest source-backed approximation in app code,
record the deviation + evidence in the screen contract / STATE.md, and report
the gap (file + routine + expected vs actual) to the user for the library
author. Constitution Art II.5 / Art X apply.
