---
name: SDUIExcel
description: SithasoDaisy5 SDUIExcel component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUIExcel

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUIExcel.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUIExcel.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgExcelToApp.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgExcelToApp.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
_Excel workbook builder (oxml.js) — creates styled worksheets, rows, formulas; exports and reads `.xlsx` files client-side._

This is a **service module**, not a designer component: no `DesignerCreateView`, no designer properties, no daisyUI class emission. Add it to the B4J project and call its methods directly.
## Skeleton Contract
Every SithasoDaisy5 component follows the same shape (see SDUI5Component base):
1. `Initialize(Callback, Name, EventName)` — sets `mCallBack`, `mName`, `mEventName`, calls `SetDefaults`.
2. `ParentID` (property / `setParentID(id)`) — attach point in the DOM.
3. `DesignerCreateView(Target, Props)` — INTERNAL (called by `AddComponent`, never from app code); reads `CustProps`, pushes daisyUI classes via `UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT`, appends `[BANCLEAN]<tag id="{name}">`, wires `UI.OnEvent`.
4. Live setters mutate the DOM via `UI.*ByID("{name}_child")`.

**Init signature**: `Initialize(Module As Object, Event As String, fileName As String)` | **Has DesignerCreateView**: No
## Designer Properties
_(inherits from SDUI5Component base — see base contract)_
## Events
`ExcelDownload`

Wire in parent: `Sub excel_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (59)
- `InStr(sText As String, sFind As String)` As Int _(public)_
- `AlphaNumeric(value As String)` As String _(public)_
- `GetListFromMapKeys(m As Map, keys As List)` As List _(public)_
- `Initialize(Module As Object, Event As String, fileName As String)` _(public)_
- `AddColumn(colName As String, colHeading As String)` _(public)_
- `AddColumns(ws As BANanoObject, m As Map)` _(public)_
- `ClearColumns()` _(public)_
- `ClearRows()` _(public)_
- `SetHeaderFields(flds As List)` _(public)_
- `SetHeaderTitles(flds As List)` _(public)_
- `SetColumns(sheet As BANanoObject, rowPos As Int)` _(public)_
- `SetRowsFromDataTable(recs As List)` _(public)_
- `SetColumnsFromDataTable(xcolumns As Map)` _(public)_
- `CStr(o As Object)` As String _(public)_
- `ReadFromArrayBuffer(data As Object)` _(public)_
- `ReadSheetContentsByPos(pos As Int)` As List _(public)_
- `GetExcelHeadings(lst As List)` As List _(public)_
- `GetSingleCode(lst As List)` As String _(public)_
- `ReadFile(data As String)` As List _(public)_
- `ReadFileWorkSheet(data As String, ws As Int)` As List _(public)_
- `CreateStyle()` As OXMLStyle _(public)_
- `SetStyleBorder(rc As BANanoObject, borderColor As String, borderThickNess As String)` As SDUIExcel _(public)_
- `SetStyleNumberFormat(rc As BANanoObject, nf As String)` As SDUIExcel _(public)_
- `SetStyleBold(rc As BANanoObject, b As Boolean)` As SDUIExcel _(public)_
- `SetStyleItalic(rc As BANanoObject, b As Boolean)` As SDUIExcel _(public)_
- `SetStyleUnderline(rc As BANanoObject, b As Boolean)` As SDUIExcel _(public)_
- `SetStyleFontSize(rc As BANanoObject, fs As Int)` As SDUIExcel _(public)_
- `SetStyleVAlignment(rc As BANanoObject, va As String)` As SDUIExcel _(public)_
- `SetStyleHAlignment(rc As BANanoObject, ha As String)` As SDUIExcel _(public)_
- `SetStyle(rc As BANanoObject, Style As OXMLStyle)` _(public)_
- `Merge(sheet As BANanoObject, range As String)` As SDUIExcel _(public)_
- `GetRow(sheet As BANanoObject, rowPos As Int, colPos As Int)` As BANanoObject _(public)_
- `GetColumn(sheet As BANanoObject, rowPos As Int, colPos As Int)` As BANanoObject _(public)_
- `GetCell(sheet As BANanoObject, rowPos As Int, colPos As Int)` As BANanoObject _(public)_
- `CreateRow(rowPos As Int, colPos As Int)` As OXMLRow _(public)_
- `WorkSheet(sheetName As String)` As BANanoObject _(public)_
- `AddWorkSheet(sheetName As String)` As BANanoObject _(public)_
- `SetRow(sheet As BANanoObject, rowPos As Int, colPos As Int, values As List)` _(public)_
- `SetColumn(sheet As BANanoObject, rowPos As Int, colPos As Int, values As List)` _(public)_
- `SetRowBO(row As BANanoObject, values As List)` _(public)_
- `SetColBO(col As BANanoObject, values As List)` _(public)_
- `SetRow1(sheet As BANanoObject, row As OXMLRow)` _(public)_
- `Download(module As Object, methodName As String)` _(public)_
- `AddRowText(row As OXMLRow, value As String)` As SDUIExcel _(public)_
- `AddRowNumber(row As OXMLRow, value As String)` As SDUIExcel _(public)_
- `AddRowSharedText(row As OXMLRow, value As String)` As SDUIExcel _(public)_
- `AddRowFormula(row As OXMLRow, formula As String)` As SDUIExcel _(public)_
- `AddRowFormula1(row As OXMLRow, formula As String, value As String)` As SDUIExcel _(public)_
- `SetText(sheet As BANanoObject, rowPos As Int, colPos As Int, value As String)` _(public)_
- `SetCellText(cellBO As BANanoObject,  value As String)` _(public)_
- `SetCellNumber(cellBO As BANanoObject, value As String)` _(public)_
- `SetNumber(sheet As BANanoObject, rowPos As Int, colPos As Int, value As String)` _(public)_
- `SetCellSharedText(cellBO As BANanoObject, value As String)` _(public)_
- `SetSharedText(sheet As BANanoObject, rowPos As Int, colPos As Int, value As String)` _(public)_
- `SetCellFormula(cellBO As BANanoObject, formula As String)` _(public)_
- `SetFormula(sheet As BANanoObject, rowPos As Int, colPos As Int, formula As String)` _(public)_
- `SetCellFormula1(cellBO As BANanoObject, formula As String, value As String)` _(public)_
- `SetFormula1(sheet As BANanoObject, rowPos As Int, colPos As Int, formula As String, value As String)` _(public)_
- `ExportTable(mExcelTitle As String, border As Boolean, fieldNames As List, fieldTitles As List, Content As List)` _(public)_
## Key Setters (0)
_(none — uses base SDUI5Component setters only)_
## Getters (0)
_(none)_
## Private Methods (0)
_(none)_
## Verified Demo Usage
Real syntax from `pgExcelToApp.bas` (verified demo) — read an uploaded `.xlsx`:

```b4j
Dim xcel As SDUIExcel
xcel.Initialize(Me, "excel", fileName)                             'callback, event name, file name
Dim xcelBuffer As Object = BANano.Await(app.readAsArrayBufferWait(fileObj))
ExcelData = BANano.Await(xcel.ReadFile(xcelBuffer))                'returns the workbook data
ExcelHeadings = xcel.GetExcelHeadings(ExcelData)                   'column headers
```

Also used in: `pgPHPMySQL` (export flows).
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
```b4j
Dim svc As SDUIExcel
svc.Initialize(Module As Object, Event As String, fileName As String)
```
## Composes With
- Pairs with the SDUI5 page components: call service methods from page/component event handlers.


