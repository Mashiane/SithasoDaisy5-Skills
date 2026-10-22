---
name: SDUI5ExcelReport
description: SithasoDaisy5 SDUI5ExcelReport component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5ExcelReport

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5ExcelReport.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5ExcelReport.bas)
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5ExcelReport generates Excel reports from data. Use for exporting tabular data to .xlsx.
_SDUI5ExcelReport is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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

Wire in parent: `Sub excelreport_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (10)
- `Initialize()` _(public)_
- `InStr(sText As String, sFind As String)` As Int _(public)_
- `AlphaNumeric(value As String)` As String _(public)_
- `GetListFromMapKeys(m As Map, keys As List)` As List _(public)_
- `AddColumn(colPosition As String, colName As String)` _(public)_
- `SetColumn(ColName As String,fldValue As String)` _(public)_
- `ClearColumns()` _(public)_
- `ClearRows()` _(public)_
- `SetRows(r As List)` _(public)_
- `Execute()` _(public)_
## Key Setters (4)
- `setStartRow(i As Int)` _(public)_
- `setTemplateFile(s As String)` _(public)_
- `setSheetName(s As String)` _(public)_
- `setReportFileName(s As String)` _(public)_
## Getters (4)
- `getStartRow()` As Int _(public)_
- `getTemplateFile()` As String _(public)_
- `getSheetName()` As String _(public)_
- `getReportFileName()` As String _(public)_
## Private Methods (0)
_(none)_
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim excelreport As SDUI5ExcelReport
excelreport.Initialize(Me, "SDUI5ExcelReport", "SDUI5ExcelReport")
excelreport.ParentID = "placeholder"
BANano.Await(excelreport.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


