---
name: SDUI5Table
description: SithasoDaisy5 SDUI5Table component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Table

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Table.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Table.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgCategories.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgCategories.bas)
  - [`pgContacts.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgContacts.bas)
  - [`pgExcelToApp.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgExcelToApp.bas)
  - [`pgPHPMySQL.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgPHPMySQL.bas)
  - [`pgPHPSQLite.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgPHPSQLite.bas)
  - [`pgProvinces.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgProvinces.bas)
  - [`pgTable.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTable.bas)
  - [`pgTable2.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTable2.bas)
  - [`pgTable3.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTable3.bas)
  - [`pgTableExpand.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTableExpand.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Table is a data table with toolbar, search, filter, pagination, export, and CRUD actions. Configure columns via methods; rows from data. Use for tabular data management.
_SDUI5Table is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
## Skeleton Contract
Every SithasoDaisy5 component follows the same shape (see SDUI5Component base):
1. `Initialize(Callback, Name, EventName)` — sets `mCallBack`, `mName`, `mEventName`, calls `SetDefaults`.
2. `ParentID` (property / `setParentID(id)`) — attach point in the DOM.
3. `DesignerCreateView(Target, Props)` — INTERNAL (called by `AddComponent`, never from app code); reads `CustProps`, pushes daisyUI classes via `UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT`, appends `[BANCLEAN]<tag id="{name}">`, wires `UI.OnEvent`.
4. Live setters mutate the DOM via `UI.*ByID("{name}_child")`.

**Init signature**: `Initialize(CallBack As Object, Name As String, EventName As String)` | **Has DesignerCreateView**: Yes
## Designer Properties
| Key | Type | Default | List | Setter | Getter |
|---|---|---|---|---|---|
| `ReadMe` | String | Child Item _toolbar, _actions | — | — | — |
| `ParentID` | String | — | — | `setParentID` | `getParentID` |
| `Title` | String | Table | — | `setTitle` | `getTitle` |
| `TitleVisible` | Boolean | True | — | `setTitleVisible` | `getTitleVisible` |
| `Icon` | String | — | — | `setIcon` | `getIcon` |
| `IconColor` | String | — | — | `setIconColor` | `getIconColor` |
| `IconSize` | String | 32px | — | `setIconSize` | `getIconSize` |
| `IconVisible` | Boolean | False | — | `setIconVisible` | `getIconVisible` |
| `ExcelTitle` | String | Table | — | `setExcelTitle` | `getExcelTitle` |
| `PageSize` | String | a4 | a0, a1, a10, a10, a2, a3, a4, a5, a6, a7, a8, a9, b0, b1, b10, b10, b2, b3, b4, b5, b6, b7, b8, b9, c0, c1, c10, c10, c2, c3, c4, c5, c6, c7, c8, c9, credit-card, dl, government-letter, junior-legal, ledger, legal, letter, tabloid | `setPageSize` | `getPageSize` |
| `FontSize` | String | 11 | — | `setFontSize` | `getFontSize` |
| `Unit` | String | pt | cm, in, m, mm, pt, px | `setUnit` | `getUnit` |
| `Orientation` | String | landscape | landscape, potrait | `setOrientation` | `getOrientation` |
| `PageBreakRepeat` | String | — | — | `setPageBreakRepeat` | `getPageBreakRepeat` |
| `PdfTheme` | String | striped | css, grid, none, plain, striped | `setPdfTheme` | `getPdfTheme` |
| `ItemsPerPage` | String | 10 | — | `setItemsPerPage` | `getItemsPerPage` |
| `ListViewMode` | Boolean | False | — | `setListViewMode` | `getListViewMode` |
| `TrapRowClick` | Boolean | False | — | — | — |
| `HasFilter` | Boolean | False | — | `setHasFilter` | `getHasFilter` |
| `HasExpand` | Boolean | False | — | `setHasExpand` | `getHasExpand` |
| `TableSize` | String | md | lg, md, sm, xs, none, xl | `setTableSize` | `getTableSize` |
| `NormalCase` | Boolean | False | — | `setNormalCase` | `getNormalCase` |
| `WrapHeadings` | Boolean | False | — | `setWrapHeadings` | `getWrapHeadings` |
| `LowerCase` | Boolean | False | — | `setLowerCase` | `getLowerCase` |
| `IsNormal` | Boolean | False | — | `setIsNormal` | `getIsNormal` |
| `IsZebra` | Boolean | False | — | `setIsZebra` | `getIsZebra` |
| `Pagination` | Boolean | True | — | `setPagination` | `getPagination` |
| `BadgesOutlined` | Boolean | False | — | `setBadgesOutlined` | `getBadgesOutlined` |
| `BadgesSize` | String | md | lg, md, sm, xs, none | `setBadgesSize` | `getBadgesSize` |
| `ButtonSize` | String | md | lg, md, sm, xs, none | `setButtonSize` | `getButtonSize` |
| `ComponentSize` | String | sm | lg, md, sm, xs, none | `setComponentSize` | `getComponentSize` |
| `ButtonsOutlined` | Boolean | False | — | `setButtonsOutlined` | `getButtonsOutlined` |
| `TooltipColor` | String | primary | — | `setTooltipColor` | `getTooltipColor` |
| `TooltipAlignment` | String | none | start, center, end, none | `setTooltipAlignment` | `getTooltipAlignment` |
| `Hover` | Boolean | False | — | `setHover` | `getHover` |
| `SelectAll` | Boolean | False | — | `setSelectAll` | `getSelectAll` |
| `HasSearch` | Boolean | False | — | `setHasSearch` | `getHasSearch` |
| `SearchSize` | String | md | lg, md, sm, xs, none | `setSearchSize` | `getSearchSize` |
| `SearchWidth` | String | 300px | — | `setSearchWidth` | `getSearchWidth` |
| `HasAddnew` | Boolean | True | — | `setHasAddNew` | `getHasAddnew` |
| `AddNewTooltip` | String | — | — | `setAddNewTooltip` | `getAddNewTooltip` |
| `HasSaveSingle` | Boolean | False | — | `setHasSaveSingle` | `getHasSaveSingle` |
| `SaveSingleTooltip` | String | — | — | `setSaveSingleTooltip` | `getSaveSingleTooltip` |
| `HasDeleteSingle` | Boolean | False | — | `setHasDeleteSingle` | `getHasDeleteSingle` |
| `DeleteSingleTooltip` | String | — | — | `setDeleteSingleTooltip` | `getDeleteSingleTooltip` |
| `HasRefresh` | Boolean | True | — | `setHasRefresh` | `getHasRefresh` |
| `RefreshTooltip` | String | — | — | `setRefreshTooltip` | `getRefreshTooltip` |
| `HasDeleteAll` | Boolean | False | — | `setHasDeleteAll` | `getHasDeleteAll` |
| `DeleteAllTooltip` | String | — | — | `setDeleteAllTooltip` | `getDeleteAllTooltip` |
| `HasToolbarUpload` | Boolean | False | — | `setHasToolbarUpload` | `getHasToolbarUpload` |
| `UploadToolbarTooltip` | String | — | — | `setUploadToolbarTooltip` | `getUploadToolbarTooltip` |
| `HasToolbarDownload` | Boolean | False | — | `setHasToolbarDownload` | `getHasToolbarDownload` |
| `DownloadToolbarTooltip` | String | — | — | — | — |
| `MultipleFiles` | Boolean | False | — | `setMultipleFiles` | `getMultipleFiles` |
| `HasExportMenu` | Boolean | False | — | `setHasExportMenu` | `getHasExportMenu` |
| `ExportToCsv` | Boolean | False | — | `setHasExportToCsv` | — |
| `ExportToCsvTooltip` | String | — | — | `setExportToCsvTooltip` | `getExportToCsvTooltip` |
| `ExportToPdf` | Boolean | False | — | `setExportToPdf` | `getExportToPdf` |
| `ExportToPdfTooltip` | String | — | — | `setExportToPdfTooltip` | `getExportToPdfTooltip` |
| `ExportToXls` | Boolean | False | — | `setExportToXls` | `getExportToXls` |
| `ExportToXlsTooltip` | String | — | — | `setExportToXlsTooltip` | `getExportToXlsTooltip` |
| `HasHelp` | Boolean | False | — | `setHasHelp` | `getHasHelp` |
| `HelpTooltip` | String | — | — | `setHelpTooltip` | `getHelpTooltip` |
| `HasBack` | Boolean | True | — | `setHasBack` | `getHasBack` |
| `BackTooltip` | String | — | — | `setBackTooltip` | `getBackTooltip` |
| `HasGrid` | Boolean | False | — | `setHasGrid` | `getHasGrid` |
| `GridTooltip` | String | — | — | `setGridTooltip` | `getGridTooltip` |
| `HasAlphaChooser` | Boolean | True | — | `setHasAlphaChooser` | `getHasAlphaChooser` |
| `AlphaChooserTextColor` | String | #ffffff | — | `setAlphaChooserTextColor` | `getAlphaChooserTextColor` |
| `AlphaChooserColumn` | String | name | — | `setAlphaChooserColumn` | `getAlphaChooserColumn` |
| `AlphaChooserHeight` | String | 8 | — | `setAlphaChooserHeight` | `getAlphaChooserHeight` |
| `HasColumnChooser` | Boolean | True | — | `setHasColumnChooser` | `getHasColumnChooser` |
| `ColumnChooserTextColor` | String | #ffffff | — | `setColumnChooserTextColor` | `getColumnChooserTextColor` |
| `ColumnChooserHeight` | String | 8 | — | `setColumnChooserHeight` | `getColumnChooserHeight` |
| `ColumnChooserColor` | String | primary | — | `setColumnChooserColor` | `getColumnChooserColor` |
| `ShowTotalRecords` | Boolean | True | — | `setShowTotalRecords` | `getShowTotalRecords` |
| `HasEdit` | Boolean | True | — | `setHasEdit` | `getHasEdit` |
| `EditTooltip` | String | — | — | `setEditTooltip` | `getEditTooltip` |
| `HasClone` | Boolean | False | — | `setHasClone` | `getHasClone` |
| `CloneTooltip` | String | — | — | `setCloneTooltip` | `getCloneTooltip` |
| `HasDelete` | Boolean | True | — | `setHasDelete` | `getHasDelete` |
| `DeleteTooltip` | String | — | — | `setDeleteTooltip` | `getDeleteTooltip` |
| `HasUpload` | Boolean | False | — | `setHasUpload` | `getHasUpload` |
| `UploadTooltip` | String | — | — | `setUploadTooltip` | `getUploadTooltip` |
| `HasDownload` | Boolean | False | — | `setHasDownload` | `getHasDownload` |
| `DownloadTooltip` | String | — | — | `setDownloadTooltip` | `getDownloadTooltip` |
| `HasMenu` | Boolean | False | — | `setHasMenu` | `getHasMenu` |
| `MenuTooltip` | String | — | — | `setMenuTooltip` | `getMenuTooltip` |
| `FlexWrapActions` | Boolean | False | — | `setFlexWrapActions` | `getFlexWrapActions` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |
| `MarginAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | `setMarginAXYTBLR` | `getMarginAXYTBLR` |
| `PaddingAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | `setPaddingAXYTBLR` | `getPaddingAXYTBLR` |
| `RawClasses` | String | — | — | `setClasses` | `getClasses` |
| `RawStyles` | String | — | — | `setStyles` | `getStyles` |
| `RawAttributes` | String | — | — | `setAttributes` | `getAttributes` |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
Where a designer key and method name differ, the method names shown are the source-verified mapping.
## Events
`AlphaClick`, `RowClick`, `HeaderClick`, `ExportToCsv`, `ExportToPdf`, `ExportToXls`, `FileChange`, `Download`, `Custom_FileChange`, `CustomColumn`, `CustomColumnRow`, `CustomButton`, `SelectAll`, `EditRow`, `ExpandRow`, `CloneRow`, `MenuRow`, `DownloadRow`, `UploadRow`, `DeleteRow`, `ChangeRow`, `SelectRow`, `MenuItemRow`, `Help`, `Add`, `SaveSingle`, `DeleteSingle`, `Refresh`, `Back`, `DeleteAll`, `PrevPage`, `NextPage`, `GridView`, `Filter`, `Custom_Prepend_Click`, `Custom_Append_Click`, `Custom_Toggle`, `PrependClick`, `AppendClick`, `Decrement`, `Increment`, `PasswordPrependClick`, `PasswordAppendClick`, `Select_Change`, `Select_Prepend_Click`, `Select_Append_Click`, `DDown_Click`, `SearchClick`, `SearchKeyUp`, `SearchClear`

Wire in parent: `Sub table_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (371)
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `Initialize(CallBack As Object, Name As String, EventName As String)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `GetFiles()` As List _(public)_
- `GetFile()` As Map _(public)_
- `GetFileDataURL()` As String _(public)_
- `Nullify()` _(public)_
- `SetMenuItemColor(c As String)` _(public)_
- `SetMenuItemHoverColor(c As String)` _(public)_
- `SetMenuItemFocusColor(c As String)` _(public)_
- `SetMenuItemActiveColor(c As String)` _(public)_
- `AddDesignerColums()` As 'ignoredeadcode _(public)_
- `AddHeaderRow(rowNumber As String)` As 'ignoredeadcode _(public)_
- `AddHeaderRowTitle(rowNumber As String, name As String, title As String)` _(public)_
- `ClearFilters()` As 'ignoredeadcode _(public)_
- `ClearFilter(name As String)` _(public)_
- `SetColumnVisibleOnColumnChooser(colName As String, colVisible As Boolean)` _(public)_
- `RemoveSearch()` _(public)_
- `RemoveToolBar()` _(public)_
- `RemoveColumnChooser()` _(public)_
- `RemoveHeadings()` _(public)_
- `RemoveFooter()` _(public)_
- `RemoveFooterPagination()` _(public)_
- `SetSearchPlaceholder(s As String)` _(public)_
- `AddToolbarButton(btnID As String, btnCaption As String, btnColor As String)` As SDUI5Button _(public)_
- `AddToolbarActionButton(btnID As String, btnCaption As String, btnColor As String)` As SDUI5Button		'ignoredeadcode _(public)_
- `SetToolbarButtonToolTip(btnID As String, tooltip As String, color As String, position As String)` As 'ignoredeadcode _(public)_
- `AddToolbarButtonIcon(btnID As String, xIcon As String, btnColor As String, iconColor As String)` As SDUI5Button			'ignoredeadcode _(public)_
- `AddToolbarFileUpload(btnID As String, xIcon As String, btnColor As String, bMultiple As Boolean)` As SDUI5Button		'ignoredeadcode _(public)_
- `SetToolbarButtonTextColorWhite(id As String)` _(public)_
- `AddToolbarActionButtonIcon(btnID As String, xIcon As String, btnColor As String, iconColor As String)` As SDUI5Button			'ignoredeadcode _(public)_
- `SetExportToCSVTooltip1(tooltip As String, color As String, position As String)` _(public)_
- `SetExportToPDFTooltip1(tooltip As String, color As String, position As String)` _(public)_
- `SetExportToXLSTooltip1(tooltip As String, color As String, position As String)` _(public)_
- `SetAddNewTooltip1(tooltip As String, color As String, position As String)` _(public)_
- `SetToolbarButtonIconColor(btn As String, value As String)` As 'ignoredeadcode _(public)_
- `SetSaveSingleTooltip1(tooltip As String, color As String, position As String)` _(public)_
- `SetDeleteSingleTooltip1(tooltip As String, color As String, position As String)` _(public)_
- `SetDeleteAllTooltip1(tooltip As String, color As String, position As String)` _(public)_
- `SetUploadToolBarTooltip1(tooltip As String, color As String, position As String)` _(public)_
- `SetDeleteAllEnable(b As Boolean)` _(public)_
- `SetDeleteAllVisible(b As Boolean)` _(public)_
- `ToolBarFileNullify()` _(public)_
- `SetBackTooltip1(tooltip As String, color As String, position As String)` _(public)_
- `MoveBackButton()` As 'ignoredeadcode _(public)_
- `MoveHelpButton()` As 'ignoredeadcode _(public)_
- `SetRefreshTooltip1(tooltip As String, color As String, position As String)` _(public)_
- `SetToolbarButtonDisabled(btn As String, b As Boolean)` _(public)_
- `SetToolbarButtonEnable(btn As String, b As Boolean)` _(public)_
- `SetToolbarButtonLoading(btn As String, b As Boolean)` _(public)_
- `ToolbarButtonLoading(btn As String, b As Boolean)` _(public)_
- `SetToolbarSelectAllChecked(value As Boolean)` _(public)_
- `SetRowSelectChecked(rowPos As Int, value As Boolean)` _(public)_
- `SetToolbarButtonBadge(btn As String, value As String)` _(public)_
- `SetToolbarButtonBadgeColor(btn As String, value As String)` _(public)_
- `SetToolbarButtonBadgeSize(btn As String, value As String)` _(public)_
- `SetToolbarButtonBadgeRound(btn As String)` _(public)_
- `SetToolbarButtonBadgeTextColor(btn As String, value As String)` _(public)_
- `SetToolbarButtonTextColor(btn As String, value As String)` As 'ignoredeadcode _(public)_
- `SetToolbarButtonVisible(btn As String, value As Boolean)` _(public)_
- `SetToolbarButtonColor(btn As String, value As String)` _(public)_
- `ClearToolbarActions()` _(public)_
- `SetPrevPageTooltip(tooltip As String, color As String, position As String)` _(public)_
- `SetNextPageTooltip(tooltip As String, color As String, position As String)` _(public)_
- `PagePause()` _(public)_
- `PageResume()` _(public)_
- `ClearHeadings()` _(public)_
- `ClearFooter()` As 'ignoredeadcode _(public)_
- `ClearRows()` As 'ignoredeadcode _(public)_
- `UpdateColumnVisibility()` _(public)_
- `AddColumnSelectAll()` As 'ignoredeadcode _(public)_
- `GetAllChecked(Status As Boolean)` As List _(public)_
- `GetColumnPosition(colName As String)` As Int _(public)_
- `SetColumnAlignMultiple(salign As String, colNames As List)` _(public)_
- `SetColumnAlign(colName As String, salign As String)` _(public)_
- `SetColumnAvatarColor(colName As String, b As Boolean)` _(public)_
- `SetColumnTextSize(colName As String, sSize As String)` _(public)_
- `RightAlignColumns(colNames As List)` _(public)_
- `CenterAlignColumns(colNames As List)` _(public)_
- `AddColumn(name As String, title As String)` _(public)_
- `FirstColumnName()` As String _(public)_
- `AddColumnPlaceHolder(name As String, title As String)` _(public)_
- `SetColumnVisibleMultiple(Status As Boolean, colNames As List)` _(public)_
- `SetColumnsHidden(cols As List)` _(public)_
- `SetColumnHidden(colName As String)` _(public)_
- `SetColumnVisible(colName As String, Status As Boolean)` _(public)_
- `SetColumnTitle(colName As String, title As String)` _(public)_
- `SetColumnFileSize(colName As String)` _(public)_
- `AddColumnFileSize(name As String, title As String)` _(public)_
- `SetColumnMoney(colName As String)` _(public)_
- `AddColumnMoney(name As String, title As String)` _(public)_
- `SetColumnDate(colName As String)` _(public)_
- `AddColumnDate(name As String, title As String)` _(public)_
- `AddColumnDateTime(name As String, title As String)` _(public)_
- `SetColumnDateTime(colName As String)` _(public)_
- `SetColumnThousand(colName As String)` _(public)_
- `AddColumnThousand(name As String, title As String)` _(public)_
- `SetColumnAction(colName As String, iconName As String, iconColor As String)` _(public)_
- `SetColumnFileAction(colName As String, iconName As String, iconColor As String)` _(public)_
- `SetColumnMenu(colName As String, iconName As String, iconColor As String)` _(public)_
- `AddColumnAction(name As String, title As String, icon As String, color As String, textColor As String)` _(public)_
- `UpdateColumnAction(name As String, title As String, icon As String, color As String, textColor As String)` _(public)_
- `AddColumnFileAction(name As String, title As String, icon As String, color As String)` _(public)_
- `AddColumnDropDown(name As String, title As String, icon As String, color As String, options As Map)` _(public)_
- `AddColumnDropDownIcon(name As String, title As String, icon As String, color As String, options As Map, OptionIcons As Map)` _(public)_
- `SetColumnMinMaxWidth(colName As String, minwidth As String, maxwidth As String)` _(public)_
- `SetColumnDelimiter(colName As String, delimiter As String)` _(public)_
- `SetColumnComputeValue(colName As String, subName As String)` _(public)_
- `SetColumnComputeOptions(colName As String, subName As String)` _(public)_
- `SetColumnComputeRing(colName As String, subName As String)` _(public)_
- `SetColumnComputeBackgroundColor(colName As String, subName As String)` _(public)_
- `SetColumnComputeColor(colName As String, subName As String)` _(public)_
- `SetColumnComputeTextColor(colName As String, subName As String)` _(public)_
- `SetColumnComputeClass(colName As String, subName As String)` _(public)_
- `SetColumnClass(colName As String, className As String)` _(public)_
- `SetColumnWrap(colName As String)` _(public)_
- `SetColumnWrapText(cols As List)` _(public)_
- `AddColumnClass(colName As String, classes As List)` _(public)_
- `SetColumnLink(colName As String, subtitle As String, color As String)` _(public)_
- `AddColumnLink(name As String, title As String, subtitle As String, color As String)` _(public)_
- `SetColumnClickLink(colName As String, subtitle As String, color As String)` _(public)_
- `AddColumnClickLink(name As String, title As String, subtitle As String, color As String)` _(public)_
- `SetColumnEmail(colName As String, subtitle As String, color As String)` _(public)_
- `SetColumnWebsite(colName As String, subtitle As String, color As String)` _(public)_
- `AddColumnEmail(name As String, title As String, subtitle As String, color As String)` _(public)_
- `AddColumnWebsite(name As String, title As String, subtitle As String, color As String)` _(public)_
- `SetColumnIcon(colName As String, ssize As String, color As String)` _(public)_
- `AddColumnIcon(name As String, title As String, ssize As String, color As String)` _(public)_
- `SetColumnButton(colName As String, color As String)` _(public)_
- `SetColumnsSumValues(b As Boolean, cols As List)` _(public)_
- `SetColumnSumValues(colName As String, b As Boolean)` _(public)_
- `AddColumnButton(name As String, title As String, color As String)` _(public)_
- `SetColumnBadge(colName As String, color As String)` _(public)_
- `SetColumnBackgroundColor(colName As String, color As String)` _(public)_
- `AddColumnBadge(name As String, title As String, color As String)` _(public)_
- `SetColumnRating(colName As String, ssize As Int, color As String)` _(public)_
- `AddColumnRating(name As String, title As String, ssize As Int, color As String, mask As String)` _(public)_
- `SetColumnRadialProgress(colName As String, ssize As String, color As String, suffix As String)` _(public)_
- `AddColumnRadialProgress(name As String, title As String, ssize As String, color As String, suffix As String)` _(public)_
- `SetColumnProgress(colName As String, width As Int, maxvalue As Int, color As String)` _(public)_
- `AddColumnProgress(name As String, title As String, width As Int, maxvalue As Int, color As String)` _(public)_
- `SetColumnRange(colName As String, maxvalue As Int, color As String)` _(public)_
- `AddColumnRange(name As String, title As String, maxvalue As Int, color As String)` _(public)_
- `SetColumnCheckBox(colName As String, color As String)` _(public)_
- `SetColumnVisibleOnly(theseOnes As List)` _(public)_
- `SetColumnSelect(colName As String)` _(public)_
- `SetColumnOptions(colname As String, options As Map)` _(public)_
- `SetColumnRadioGroup(colName As String)` _(public)_
- `SetColumnReadOnly(colName As String)` _(public)_
- `AddColumnCheckBox(name As String, title As String, color As String, readOnly As Boolean)` _(public)_
- `AddColumnSelect(name As String, title As String, readOnly As Boolean, bAddNothingSelected As Boolean, options As Map)` _(public)_
- `AddColumnSelectFromList(name As String, title As String, readOnly As Boolean, bAddNothingSelected As Boolean, options As List)` _(public)_
- `SetColumnOptionsFromList(colname As String, options As List)` _(public)_
- `SetColumnOptionsFromListSort(colname As String, options As List)` _(public)_
- `AddColumnSelectFromListSort(name As String, title As String, readOnly As Boolean, bAddNothingSelected As Boolean, options As List)` _(public)_
- `AddColumnRadioGroupFromList(name As String, title As String, readOnly As Boolean, color As String, options As List)` _(public)_
- `AddColumnRadioGroup(name As String, title As String, readOnly As Boolean, color As String, options As Map)` _(public)_
- `SetColumnTextColor(colName As String, color As String)` _(public)_
- `SetColumnTextBox(colName As String)` _(public)_
- `SetColumnTelephone(colName As String)` _(public)_
- `AddColumnTextBox(name As String, title As String, readOnly As Boolean)` _(public)_
- `AddColumnTelephone(name As String, title As String, readOnly As Boolean)` _(public)_
- `SetColumnTextBoxGroup(colName As String, Prefix As String, PrependIcon As String, Suffix As String, AppendIcon As String)` _(public)_
- `SetColumnSelectGroup(colName As String, Prefix As String, PrependIcon As String, Suffix As String, AppendIcon As String)` _(public)_
- `SetColumnPasswordGroup(colName As String)` _(public)_
- `AddColumnTextBoxGroup(name As String, title As String, readOnly As Boolean, Prefix As String, PrependIcon As String, Suffix As String, AppendIcon As String)` _(public)_
- `AddColumnSelectGroup(name As String, title As String, readOnly As Boolean, bAddNothingSelected As Boolean, options As Map, Prefix As String, PrependIcon As String, Suffix As String, AppendIcon As String)` _(public)_
- `AddColumnPasswordGroup(name As String, title As String, readOnly As Boolean)` _(public)_
- `AddColumnDialer(name As String, title As String, readOnly As Boolean, minValue As Int, stepValue As Int, maxValue As Int)` _(public)_
- `SetColumnTextDialer(colName As String, minValue As Int, stepValue As Int, maxValue As Int)` _(public)_
- `AddColumnPassword(name As String, title As String, readOnly As Boolean)` _(public)_
- `SetColumnPassword(colName As String)` _(public)_
- `SetColumnNumber(colName As String)` _(public)_
- `AddColumnNumber(name As String, title As String, readOnly As Boolean)` _(public)_
- `SetColumnFileInput(colName As String)` _(public)_
- `AddColumnFileInput(name As String, title As String)` _(public)_
- `AddColumnFileInputProgressCamCorder(name As String, title As String, xButtonSize As String, xProgressSize As String, xColor As String)` _(public)_
- `AddColumnFileInputProgressCamera(name As String, title As String, xButtonSize As String, xProgressSize As String, xColor As String)` _(public)_
- `AddColumnFileInputProgressMicrophone(name As String, title As String, xButtonSize As String, xProgressSize As String, xColor As String)` _(public)_
- `AddColumnFileInputProgress(name As String, title As String, xButtonSize As String, xProgressSize As String, xIcon As String, xColor As String)` _(public)_
- `SetColumnDatePicker(colName As String, dateFormat As String, altFormat As String, brange As Boolean, bmultiple As Boolean, bNoCalendar As Boolean)` _(public)_
- `SetColumnDateTimePicker(colName As String, dateFormat As String, altFormat As String, slocale As String)` _(public)_
- `AddColumnDatePicker(name As String, title As String, readOnly As Boolean, dateFormat As String, altFormat As String, brange As Boolean, bmultiple As Boolean, bNoCalendar As Boolean, locale As String)` _(public)_
- `SetColumnTimePicker(colName As String, dateFormat As String, bNoCalendar As Boolean)` _(public)_
- `AddColumnDateTimePicker(name As String, title As String, readOnly As Boolean, dateFormat As String, altFormat As String, brange As Boolean, bmultiple As Boolean, bNoCalendar As Boolean, locale As String)` _(public)_
- `AddColumnTimePicker(name As String, title As String, readOnly As Boolean, dateFormat As String, bNoCalendar As Boolean)` _(public)_
- `SetColumnTextArea(colName As String, tRows As String)` _(public)_
- `AddColumnTextArea(name As String, title As String, readOnly As Boolean, tRows As Int)` _(public)_
- `AddColumnToggle(name As String, title As String, color As String, readOnly As Boolean)` _(public)_
- `SetColumnToggle(colName As String, color As String)` _(public)_
- `SetColumnEditTitle(s As String)` _(public)_
- `SetColumnCloneTitle(s As String)` _(public)_
- `SetColumnMenuTitle(s As String)` _(public)_
- `SetColumnDownloadTitle(s As String)` _(public)_
- `SetColumnUploadTitle(s As String)` _(public)_
- `SetColumnDeleteTitle(s As String)` _(public)_
- `SetRowEditEnabled(rowPos As Int, b As Boolean)` _(public)_
- `SetRowCloneEnabled(rowPos As Int, b As Boolean)` _(public)_
- `SetRowMenuEnabled(rowPos As Int, b As Boolean)` _(public)_
- `SetRowDownloadEnabled(rowPos As Int, b As Boolean)` _(public)_
- `SetRowUploadEnabled(rowPos As Int, b As Boolean)` _(public)_
- `SetRowDeleteEnabled(rowPos As Int, b As Boolean)` _(public)_
- `SetRowEditLoading(rowPos As Int, b As Boolean)` _(public)_
- `SetRowCloneLoading(rowPos As Int, b As Boolean)` _(public)_
- `SetRowMenuLoading(rowPos As Int, b As Boolean)` _(public)_
- `SetRowDownloadLoading(rowPos As Int, b As Boolean)` _(public)_
- `SetRowUploadLoading(rowPos As Int, b As Boolean)` _(public)_
- `SetRowDeleteLoading(rowPos As Int, b As Boolean)` _(public)_
- `AddColumnEdit(color As String)` _(public)_
- `AddColumnExpand(color As String)` _(public)_
- `AddColumnClone(color As String)` _(public)_
- `AddColumnMenu(color As String)` _(public)_
- `AddColumnDownload(color As String)` _(public)_
- `AddColumnUpload(color As String)` _(public)_
- `AddColumnDelete(color As String)` _(public)_
- `SetColumnColor(colName As String, subtitle As String)` _(public)_
- `SetColumnLocale(colName As String, slocale As String)` _(public)_
- `SetColumnMaxLength(colName As String, smaxlen As String)` _(public)_
- `AddColumnColor(name As String, title As String, subtitle As String)` _(public)_
- `SetColumnAvatar(colName As String, ssize As String, mask As String)` _(public)_
- `SetColumnAvatarPlaceholder(colName As String, ssize As String, mask As String, color As String)` _(public)_
- `SetColumnAvatarGroup(colName As String, ssize As String, mask As String)` _(public)_
- `SetColumnBadgeGroup(colName As String, sheight As String)` _(public)_
- `SetColumnAvatarRing(colName As String, HasRing As Boolean, Color As String)` _(public)_
- `SetColumnAvatarOnline(colName As String, OnlineField As String)` _(public)_
- `SetColumnImage(colName As String, width As Int, height As Int, mask As String)` _(public)_
- `SetColumnHeightMultiple(height As String, colNames As List)` _(public)_
- `SetColumnHeight(colName As String, height As String)` _(public)_
- `SetColumnWidthMultiple(width As String, colNames As List)` _(public)_
- `SetColumnWidth(colName As String, width As String)` _(public)_
- `SetColumnMaxWidth(colName As String, width As String)` _(public)_
- `SetColumnMinWidth(colName As String, width As String)` _(public)_
- `SetTableColumnHeight(colName As String, height As String)` _(public)_
- `SetTableColumnWidth(colName As String, width As String)` _(public)_
- `AddColumnAvatar(name As String, title As String, ssize As String, mask As String)` _(public)_
- `AddColumnAvatarPlaceholder(name As String, title As String, ssize As String, mask As String, Color As String)` _(public)_
- `AddColumnImage(name As String, title As String, width As Int, height As Int, mask As String)` _(public)_
- `SetColumnAvatarTitle(colName As String, ssize As String, subtitle As String, mask As String)` _(public)_
- `SetColumnIconTitle(colName As String, ssize As String, subtitle As String, color As String)` _(public)_
- `SetColumnTitleIcon(colName As String, ssize As String, subtitle As String, color As String)` _(public)_
- `AddColumnAvatarTitle(name As String, title As String, ssize As String, subtitle As String, mask As String)` _(public)_
- `AddColumnIconTitle(name As String, title As String, ssize As String, subtitle As String, color As String)` _(public)_
- `AddColumnTitleIcon(name As String, title As String, ssize As String, subtitle As String, color As String)` _(public)_
- `AddColumnBadgeAvatarTitle(name As String, title As String, ssize As String, subtitle As String, color As String)` _(public)_
- `SetColumnBadgeAvatarTitle(colName As String, ssize As String, subtitle As String, color As String)` _(public)_
- `SetColumnAvatarTitleSubTitle(colName As String, ssize As String, subtitle As String, subtitle1 As String, mask As String)` _(public)_
- `AddColumnAvatarTitleSubTitle(name As String, title As String, ssize As String, subtitle As String, subtitle1 As String, mask As String)` _(public)_
- `SetColumnTitleSubTitle(colName As String, subtitle As String)` _(public)_
- `AddColumnTitleSubTitle(name As String, title As String, subtitle As String)` _(public)_
- `SetItemsPaginate(xItems As List)` _(public)_
- `ShowTotals(DataSet As List)` _(public)_
- `Find(sfind As String)` _(public)_
- `ShowPage(pgNumber As Int)` _(public)_
- `SetItems(xitems As List)` As 'ignoreDeadCode _(public)_
- `StartsWithAlphabet(Text As String)` As Boolean _(public)_
- `StartsWithNumber(Text As String)` As Boolean _(public)_
- `GetColorFromField(prefix As String, bColor As String, rowData As Map)` As String _(public)_
- `AddRow(rowdata As Map)` _(public)_
- `SetRowColumnAppendLoading(colName As String, rowCnt As Int, b As Boolean)` _(public)_
- `SetRowColumnPrependLoading(colName As String, rowCnt As Int, b As Boolean)` _(public)_
- `SetRowColumnBadgeAvatarTitle(fldName As String, rowCnt As Int, avatar As String, subtitle As String, badgeSize As String, badgeColor As String)` _(public)_
- `Show()` _(public)_
- `Hide()` _(public)_
- `DeleteRow(rowPos As Int)` _(public)_
- `SaveLastAccessedPage()` _(public)_
- `ShowLastAccessedPage()` _(public)_
- `AddColumnAvatarGroup(name As String, title As String, ssize As String, mask As String)` _(public)_
- `AddColumnBadgeGroup(name As String, title As String, sheight As String)` _(public)_
- `AddColumnBadgeGroupColor(name As String, title As String, sheight As String, scolor As String)` _(public)_
- `GetFileFromEvent(e As BANanoEvent)` As Map _(public)_
- `GetFilesFromEvent(e As BANanoEvent)` As List _(public)_
- `LoadJSON(jsonFile As String)` _(public)_
- `Size()` As Int _(public)_
- `LoadComponentJson(designName As String)` _(public)_
- `SetSelectListItems(colName As String, options As List)` _(public)_
- `SetColumnItemsFromList(colName As String, options As List)` _(public)_
- `RowCount()` As Int _(public)_
- `RowsData()` As List _(public)_
- `SetDropDownMapItems(colName As String, options As Map)` _(public)_
- `SetColumnOptionsRunTime(colName As String, options As Map)` _(public)_
- `SetColumnItems(colName As String, options As Map)` _(public)_
- `SetSelectMapItems(colName As String, options As Map)` _(public)_
- `SetSelectListItemsOfRow(colName As String, rowPos As Int, options As List)` _(public)_
- `SetSelectListItemsOfRowSort(colName As String, rowPos As Int, options As List)` _(public)_
- `SetSelectMapItemsOfRow(colName As String, rowPos As Int, options As Map)` _(public)_
- `GetRow(rowCnt As Int)` As Map _(public)_
- `SetRowColumnButtonLoading(colName As String, rowCnt As Int, b As Boolean)` _(public)_
- `SetRowColumnButtonEnabled(colName As String, rowCnt As Int, b As Boolean)` _(public)_
- `AddRowColumnClass(colName As String, rowCnt As Int, className As String)` _(public)_
- `AddRowClass(rowCnt As Int, className As String)` _(public)_
- `AddHeaderClass(colName As String, className As String)` _(public)_
- `SetColumnHeaderVerticalLR(cols As List)` _(public)_
- `SetColumnHeaderVerticalRL(cols As List)` _(public)_
- `SetColumnHeaderSideWaysLR(cols As List)` _(public)_
- `SetColumnHeaderSideWaysRL(cols As List)` _(public)_
- `SetHeaderSideWaysLR(colName As String)` _(public)_
- `SetHeaderSideWaysRL(colName As String)` _(public)_
- `SetHeaderVerticalLR(colName As String)` _(public)_
- `SetHeaderVerticalRL(colName As String)` _(public)_
- `SetRowColumnItems(colName As String, rowCnt As Int, options As Map)` _(public)_
- `SetRowColumnItemsFromList(colName As String, rowPos As Int, options As List)` _(public)_
- `SetRowColumnBy(rowKey As String, rowID As String, colName As String, fldVal As Object)` _(public)_
- `SetRowBy(rowKey As String, rowID As String,rowData As Map)` _(public)_
- `SetRowColumnFileInput(colName As String, rowCnt As Int, fldVal As Object)` _(public)_
- `GetRowColumnFileInput(colName As String, rowCnt As Int)` As Object _(public)_
- `SetRowEnsureVisible(rowPos As Int)` _(public)_
- `SetRowColumn(colName As String, rowCnt As Int, fldVal As Object)` _(public)_
- `GetRowColumn(colName As String, rowCnt As Int)` As String _(public)_
- `FindRowByColumn(colName As String, value As String)` As Int _(public)_
- `SetRow(rowCnt As Int, rowdata As Map)` _(public)_
- `ExportToCSV(quotes As Boolean, delimiter As String, hasHeader As Boolean)` As String _(public)_
- `GetFieldNames()` As List _(public)_
- `GetTitleNames()` As List _(public)_
- `UpdateRow(rowCnt As Int, rowdata As Map)` _(public)_
- `UpdateRowOriginal(rowCnt As Int, rowdata As Map)` _(public)_
- `PositionOf(prop As String, value As String)` As Int _(public)_
- `SetRowBackgroundColor(rowCnt As Int, color As String)` _(public)_
- `SetHeaderBackgroundColor(color As String)` _(public)_
- `SetHeaderAddClass(className As String)` _(public)_
- `SetHeaderStyle(styles As Map)` _(public)_
- `SetHeaderTextColor(color As String)` _(public)_
- `SetHeaderColumnAddClass(colName As String, className As String)` _(public)_
- `SetHeaderColumnStyle(colName As String, styles As Map)` _(public)_
- `SetHeaderColumnTextColor(colName As String, color As String)` _(public)_
- `SetHeaderColumnBackgroundColor(colName As String, color As String)` _(public)_
- `SetRowAddClass(rowCnt As Int, className As String)` _(public)_
- `SetRowColumnAddClass(colName As String, rowCnt As Int, className As String)` _(public)_
- `SetRowStyle(rowCnt As Int, styles As Map)` _(public)_
- `SetEvenRowStyle(styles As Map)` _(public)_
- `SetOddRowStyle(styles As Map)` _(public)_
- `SetColumnStyle(colName As String, styles As Map)` _(public)_
- `SetColumnAddClass(colName As String, className As String)` _(public)_
- `SetRowColumnStyle(colName As String, rowCnt As Int, styles As Map)` _(public)_
- `SetRowTextColor(rowCnt As Int, color As String)` _(public)_
- `SetRowColumnTextColor(colName As String, rowCnt As Int, color As String)` _(public)_
- `SetRowColumnBackgroundColor(colName As String, rowCnt As Int, color As String)` _(public)_
- `SetFooterColumn(colName As String, value As Object)` _(public)_
- `SetFooterColumnsMerge(cols As List)` _(public)_
- `SetFooterRemoveColumns(cols As List)` _(public)_
- `SetFooterTotalSumCountColumns(DataSet As List, cols As List)` As Map _(public)_
- `FileChangeEvent()` _(public)_
- `ShowColumns(cols As List)` _(public)_
- `HideColumns(cols As List)` _(public)_
- `SetRowColumnsMerge(rowPos As Int, cols As List)` _(public)_
- `HideOnSmall()` _(public)_
- `HideOnMedium()` _(public)_
- `HideOnLarge()` _(public)_
- `SetCellPadding(T As String, R As String, B As String, L As String)` _(public)_
- `SetFooterBackgroundColor(color As String)` _(public)_
- `SetFooterAddClass(className As String)` _(public)_
- `SetFooterStyle(styles As Map)` _(public)_
- `SetFooterTextColor(color As String)` _(public)_
- `SetFooterColumnAddClass(colName As String, className As String)` _(public)_
- `SetFooterColumnStyle(colName As String, styles As Map)` _(public)_
- `SetFooterColumnTextColor(colName As String, color As String)` _(public)_
- `SetFooterColumnBackgroundColor(colName As String, color As String)` _(public)_
- `SetComputeRowTextColor(s As String)` _(public)_
- `SetComputeRowBackgroundColor(s As String)` _(public)_
- `SearchByAlphabet(item As String, columnName As String)` As List _(public)_
- `FileChangeSingle()` _(public)_
- `FileChangeMultiple()` _(public)_
- `GetExpandRowID(pos As Int)` As String _(public)_
- `GetExpandColumnID(pos As Int)` As String _(public)_
- `GetExpandColumnDataID(pos As Int)` As String _(public)_
- `ClearRowExpandData(pos As Int)` _(public)_
- `RefreshColumnVisibility()` _(public)_
- `HideColumnsExceptFirst()` _(public)_
- `FirstColumnVisible()` _(public)_
## Key Setters (140)
- `setParentID(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setTableSize(s As String)` As 'ignoredeadcode _(public)_
- `setListViewMode(b As Boolean)` As 'ignoredeadcode _(public)_
- `setIconSize(s As String)` As 'ignoredeadcode _(public)_
- `setIconVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setIcon(s As String)` As 'ignoredeadcode _(public)_
- `setIconColor(s As String)` As 'ignoredeadcode _(public)_
- `setHasExpand(b As Boolean)` _(public)_
- `setAlphaChooserTextColor(s As String)` _(public)_
- `setColumnChooserTextColor(s As String)` _(public)_
- `setShowTotalRecords(b As Boolean)` _(public)_
- `setColumnChooserColor(s As String)` _(public)_
- `setColumnChooserHeight(s As String)` _(public)_
- `setHasColumnChooser(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setSearchWidth(s As String)` As 'ignoredeadcode _(public)_
- `setAddNewTooltip(s As String)` _(public)_
- `setBackTooltip(s As String)` _(public)_
- `setCloneTooltip(s As String)` _(public)_
- `setDeleteAllTooltip(s As String)` _(public)_
- `setDeleteSingleTooltip(s As String)` _(public)_
- `setDeleteTooltip(s As String)` _(public)_
- `setDownloadTooltip(s As String)` _(public)_
- `setEditTooltip(s As String)` _(public)_
- `setExportToCsvTooltip(s As String)` _(public)_
- `setExportToPdfTooltip(s As String)` _(public)_
- `setExportToXlsTooltip(s As String)` _(public)_
- `setMenuTooltip(s As String)` _(public)_
- `setRefreshTooltip(s As String)` _(public)_
- `setSaveSingleTooltip(s As String)` _(public)_
- `setTooltipColor(s As String)` _(public)_
- `setTooltipAlignment(s As String)` _(public)_
- `setUploadToolbarTooltip(s As String)` _(public)_
- `setUploadTooltip(s As String)` _(public)_
- `setWrapHeadings(b As Boolean)` _(public)_
- `setExcelTitle(s As String)` _(public)_
- `setButtonsOutlined(b As Boolean)` _(public)_
- `setBadgesOutlined(b As Boolean)` _(public)_
- `setTitleVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setNormalCase(b As Boolean)` _(public)_
- `setRoundedBox(Status As Boolean)` _(public)_
- `setBorder(Status As Boolean)` _(public)_
- `setBottomBorder(Status As Boolean)` _(public)_
- `setBodyVisible(Status As Boolean)` _(public)_
- `setHeaderVisible(Status As Boolean)` _(public)_
- `setFooterVisible(Status As Boolean)` _(public)_
- `setHasSearch(b As Boolean)` As 'ignoredeadcode _(public)_
- `setSearchValue(s As String)` _(public)_
- `setActionsVisible(b As Boolean)` _(public)_
- `setToolbarVisible(b As Boolean)` _(public)_
- `setHasExportToCsv(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHasExportToPdf(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHasExportToXls(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHasAddNew(b As Boolean)` As 'ignoredeadcode _(public)_
- `setGridTooltip(s As String)` _(public)_
- `setHasGrid(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHasSaveSingle(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHasDeleteSingle(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHasDeleteAll(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHasToolbarDownload(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHasToolbarUpload(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHasHelp(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHelpTooltip(s As String)` _(public)_
- `setHasBack(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHasRefresh(b As Boolean)` As 'ignoredeadcode _(public)_
- `setExportToCsvLoading(b As Boolean)` _(public)_
- `setExportToPdfLoading(b As Boolean)` _(public)_
- `setExportToXlsLoading(b As Boolean)` _(public)_
- `setRefreshLoading(b As Boolean)` _(public)_
- `setRefreshDisabled(b As Boolean)` _(public)_
- `setExportToCsvDisabled(b As Boolean)` _(public)_
- `setExportToPdfDisabled(b As Boolean)` _(public)_
- `setExportToXlsDisabled(b As Boolean)` _(public)_
- `setPrevPageVisible(b As Boolean)` _(public)_
- `setNextPageVisible(b As Boolean)` _(public)_
- `setPrevPageEnabled(b As Boolean)` _(public)_
- `setNextPageEnabled(b As Boolean)` _(public)_
- `setPrevPageDisabled(b As Boolean)` _(public)_
- `setNextPageDisabled(b As Boolean)` _(public)_
- `setAddDisabled(b As Boolean)` _(public)_
- `setAddLoading(b As Boolean)` _(public)_
- `setDeleteAllLoading(b As Boolean)` _(public)_
- `setSaveSingleLoading(b As Boolean)` _(public)_
- `setToolbarUploadLoading(b As Boolean)` _(public)_
- `setToolbarUploadDisabled(b As Boolean)` _(public)_
- `setDeleteSingleLoading(b As Boolean)` _(public)_
- `setDeleteAllDisabled(b As Boolean)` _(public)_
- `setSaveSingleDisabled(b As Boolean)` _(public)_
- `setDeleteSingleDisabled(b As Boolean)` _(public)_
- `setToolbarActions(b As Boolean)` _(public)_
- `setItemsPerPage(i As String)` _(public)_
- `setTitle(t As String)` _(public)_
- `setPagination(b As Boolean)` As 'ignoredeadcode _(public)_
- `setSingleRowSelect(b As Boolean)` _(public)_
- `setHasFilter(b As Boolean)` As 'ignoredeadcode _(public)_
- `setAlphaChooserColumn(s As String)` _(public)_
- `setAlphaChooserHeight(s As String)` _(public)_
- `setHasAlphaChooser(b As Boolean)` _(public)_
- `setLowerCase(b As Boolean)` _(public)_
- `setHover(b As Boolean)` _(public)_
- `setComponentSize(s As String)` _(public)_
- `setButtonSize(s As String)` _(public)_
- `setBadgesSize(s As String)` _(public)_
- `setSearchSize(s As String)` As 'ignoredeadcode _(public)_
- `setGridLines(b As Boolean)` _(public)_
- `setNoHeaderRadius(b As Boolean)` _(public)_
- `setNoFooterRadius(b As Boolean)` _(public)_
- `setBodyFontSize(s As String)` _(public)_
- `setHeaderFontSize(s As String)` _(public)_
- `setFooterFontSize(s As String)` _(public)_
- `setBodyFontFamily(s As String)` _(public)_
- `setHeaderFontFamily(s As String)` _(public)_
- `setFooterFontFamily(s As String)` _(public)_
- `setPageSize(s As String)` _(public)_
- `setFontSize(s As String)` _(public)_
- `setUnit(s As String)` _(public)_
- `setOrientation(s As String)` _(public)_
- `setPageBreakRepeat(s As String)` _(public)_
- `setPdfTheme(s As String)` _(public)_
- `setIsCompact(b As Boolean)` As 'ignoredeadcode _(public)_
- `setIsNormal(b As Boolean)` As 'ignoredeadcode _(public)_
- `setIsZebra(b As Boolean)` As 'ignoredeadcode _(public)_
- `setSelectAll(b As Boolean)` _(public)_
- `setMultipleFiles(b As Boolean)` _(public)_
- `setHasExportMenu(b As Boolean)` _(public)_
- `setExportToXls(b As Boolean)` _(public)_
- `setHasEdit(b As Boolean)` _(public)_
- `setHasClone(b As Boolean)` _(public)_
- `setHasDelete(b As Boolean)` _(public)_
- `setHasUpload(b As Boolean)` _(public)_
- `setHasDownload(b As Boolean)` _(public)_
- `setHasMenu(b As Boolean)` _(public)_
- `setExportToPdf(b As Boolean)` _(public)_
- `setFlexWrapActions(b As Boolean)` As 'ignoredeadcode _(public)_
## Getters (111)
- `getID()` As String _(public)_
- `getHere()` As String _(public)_
- `getVisible()` As Boolean _(public)_
- `getAttributes()` As String _(public)_
- `getStyles()` As String _(public)_
- `getClasses()` As String _(public)_
- `getPaddingAXYTBLR()` As String _(public)_
- `getMarginAXYTBLR()` As String _(public)_
- `getTableSize()` As String _(public)_
- `getListViewMode()` As Boolean _(public)_
- `getIconSize()` As String _(public)_
- `getIconVisible()` As Boolean _(public)_
- `getIcon()` As String _(public)_
- `getIconColor()` As String _(public)_
- `getHasExpand()` As Boolean _(public)_
- `getAlphaChooserTextColor()` As String _(public)_
- `getColumnChooserTextColor()` As String _(public)_
- `getShowTotalRecords()` As Boolean _(public)_
- `getColumnChooserColor()` As String _(public)_
- `getColumnChooserHeight()` As String _(public)_
- `getHasColumnChooser()` As Boolean _(public)_
- `getShadow()` As String _(public)_
- `getSearchWidth()` As String _(public)_
- `getTooltipAlignment()` As String _(public)_
- `getAddNewTooltip()` As String _(public)_
- `getBackTooltip()` As String _(public)_
- `getCloneTooltip()` As String _(public)_
- `getDeleteAllTooltip()` As String _(public)_
- `getDeleteSingleTooltip()` As String _(public)_
- `getDeleteTooltip()` As String _(public)_
- `getDownloadTooltip()` As String _(public)_
- `getEditTooltip()` As String _(public)_
- `getExportToCsvTooltip()` As String _(public)_
- `getExportToPdfTooltip()` As String _(public)_
- `getExportToXlsTooltip()` As String _(public)_
- `getMenuTooltip()` As String _(public)_
- `getRefreshTooltip()` As String _(public)_
- `getSaveSingleTooltip()` As String _(public)_
- `getTooltipColor()` As String _(public)_
- `getUploadToolbarTooltip()` As String _(public)_
- `getUploadTooltip()` As String _(public)_
- `getPageBreakRepeat()` As String _(public)_
- `getExcelTitle()` As String _(public)_
- `getPdfTheme()` As String _(public)_
- `getFontSize()` As String _(public)_
- `getUnit()` As String _(public)_
- `getPageSize()` As String _(public)_
- `getOrientation()` As String _(public)_
- `getWrapHeadings()` As Boolean _(public)_
- `getButtonsOutlined()` As Boolean _(public)_
- `getBadgesOutlined()` As Boolean _(public)_
- `getHeadingID()` As String _(public)_
- `getBodyID()` As String _(public)_
- `getFooterID()` As String _(public)_
- `getColumnChooserID()` As String _(public)_
- `getAlphabetsID()` As String _(public)_
- `getHasSearch()` As Boolean _(public)_
- `getSearchValue()` As String _(public)_
- `getSearchID()` As String _(public)_
- `getToolBarButtonID(btnID As String)` As String _(public)_
- `getGridTooltip()` As String _(public)_
- `getHasGrid()` As Boolean _(public)_
- `getHasToolbarDownload()` As Boolean _(public)_
- `getHasHelp()` As Boolean _(public)_
- `getHelpTooltip()` As String _(public)_
- `getToolBarNextPageID()` As String _(public)_
- `getToolBarPrevPageID()` As String _(public)_
- `getSelectAllID()` As String _(public)_
- `getColumnID(colName As String)` As String _(public)_
- `getFooterColumnID(colName As String)` As String _(public)_
- `getTitleID()` As String _(public)_
- `getHasFilter()` As Boolean _(public)_
- `getAlphaChooserColumn()` As String _(public)_
- `getAlphaChooserHeight()` As String _(public)_
- `getHasAlphaChooser()` As Boolean _(public)_
- `getCurrentPage()` As Int _(public)_
- `getName()` As String _(public)_
- `getButtonSize()` As String _(public)_
- `getBadgesSize()` As String _(public)_
- `getParentID()` As String _(public)_
- `getTitle()` As String _(public)_
- `getTitleVisible()` As Boolean _(public)_
- `getPagination()` As Boolean _(public)_
- `getItemsPerPage()` As String _(public)_
- `getIsCompact()` As Boolean _(public)_
- `getNormalCase()` As Boolean _(public)_
- `getLowerCase()` As Boolean _(public)_
- `getIsNormal()` As Boolean _(public)_
- `getIsZebra()` As Boolean _(public)_
- `getComponentSize()` As String _(public)_
- `getHover()` As Boolean _(public)_
- `getSelectAll()` As Boolean _(public)_
- `getSearchSize()` As String _(public)_
- `getHasAddnew()` As Boolean _(public)_
- `getHasSaveSingle()` As Boolean _(public)_
- `getHasDeleteSingle()` As Boolean _(public)_
- `getHasRefresh()` As Boolean _(public)_
- `getHasDeleteAll()` As Boolean _(public)_
- `getHasToolbarUpload()` As Boolean _(public)_
- `getMultipleFiles()` As Boolean _(public)_
- `getHasExportMenu()` As Boolean _(public)_
- `getExportToPdf()` As Boolean _(public)_
- `getExportToXls()` As Boolean _(public)_
- `getHasBack()` As Boolean _(public)_
- `getHasEdit()` As Boolean _(public)_
- `getHasClone()` As Boolean _(public)_
- `getHasDelete()` As Boolean _(public)_
- `getHasUpload()` As Boolean _(public)_
- `getHasDownload()` As Boolean _(public)_
- `getHasMenu()` As Boolean _(public)_
- `getFlexWrapActions()` As Boolean _(public)_
## Private Methods (48)
- `Class_Globals()` _(private)_
- `BuildRowIcon(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String						'ignore _(private)_
- `BuildRowIconTitle(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String						'ignore _(private)_
- `BuildRowTitleIcon(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String						'ignore _(private)_
- `BuildRowClickLink(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String				'ignore _(private)_
- `BuildRowLink(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowColor(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String					'ignore _(private)_
- `BuildRowWebsite(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowEmail(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowToggle(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowCheckBox(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowRange(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowProgress(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowRadial(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowRadioGroup(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowSelect(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowPasswordGroup(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowSelectGroup(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowTextBoxGroup(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowTelephone(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowDialer(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowTextBox(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowFileInputProgress(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String					'ignore _(private)_
- `BuildRowFileAction(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String			'ignore _(private)_
- `BuildRowFile(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String				'ignore _(private)_
- `BuildRowPassword(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowNumber(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowDatePicker(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowDateTimePicker(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowTimePicker(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowMenu(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String		'ignore _(private)_
- `BuildRowButton(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String			'ignore _(private)_
- `BuildRowBadge(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowRating(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowTextArea(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowAvatar(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowAvatarPlaceholder(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowAvatarGroup(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowBadgeGroup(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowOther(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowAction(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String			'ignore _(private)_
- `BuildRowAvatarTitleSubtitle(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowAvatarTitle(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowBadgeAvatarTitle(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `OnChangeInternal(el As BANanoElement)` _(private)_
- `UpdateRangeText(r As Int, fldName As String, fldVal As Object)` _(private)_
- `BuildRowImage(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
- `BuildRowTitleSubtitle(Module As Object, fldName As String, fldValu As String, rowdata As Map, RowCnt As Int, tc As TableColumn)` As String _(private)_
## Verified Demo Usage

Real syntax from [`pgTable2.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgTable2.bas) (verified demo). `table1` = a SDUI5Table.

```b4j
	table1.Initialize(Me, "table1", "table1")
	table1.ParentID = "SDUI5Column1"
	table1.AddNewTooltip = "Add a new record"
	table1.BackTooltip = "Go back to Dashboard"
	table1.BadgesSize = "sm"
	table1.ButtonSize = "sm"
	table1.CloneTooltip = "Clone record"
	table1.DeleteAllTooltip = "Delete All"
	table1.DeleteSingleTooltip = "Delete a record"
	table1.DeleteTooltip = "Delete record"
	table1.DownloadTooltip = "Download record"
	table1.EditTooltip = "Edit record"
	table1.ExcelTitle = "Personnel"
	table1.ExportToCsvTooltip = "Export to CSV"
	table1.ExportToPdf = True
	table1.ExportToPdfTooltip = "Export to PDF"
	table1.ExportToXls = True
	table1.ExportToXlsTooltip = "Export to XLS"
	table1.GridTooltip = "Show grid"
	table1.HasClone = True
	table1.HasDeleteAll = True
	table1.HasDeleteSingle = True
	table1.HasDownload = True
	table1.HasExportMenu = True
	table1.HasGrid = True
	table1.HasMenu = True
	table1.HasSaveSingle = True
	table1.HasSearch = True
	'   ... (see demo source for the rest)
```

Builder methods, real call order (from `pgContacts.bas`):

```b4j
	tblContacts.AddColumn("fullname", "Full Name")
	tblContacts.AddColumn("mobile", "Mobile")
	tblContacts.AddColumn("telephone", "Telephone")
	tblContacts.SetColumnVisible("telephone", False)
	tblContacts.AddColumnEmail("emailaddress", "Email Address", "emailaddress", App.COLOR_INFO)
	tblContacts.AddColumn("category", "Category")
	tblContacts.SetColumnComputeValue("category", "ComputeValueCategory")
	tblContacts.AddColumn("streetaddress1", "Street Address 1")
	tblContacts.SetColumnVisible("streetaddress1", False)
	tblContacts.AddColumn("streetaddress2", "Street Address 2")
	tblContacts.SetColumnVisible("streetaddress2", False)
	tblContacts.AddColumn("city", "City")
	tblContacts.AddColumn("province", "Province")
	tblContacts.SetColumnComputeValue("province", "ComputeValueProvince")
```

Demo-wired events: `Add`, `AlphaClick`, `Back`, `ChangeRow`, `CloneRow`, `DeleteAll`, `DeleteRow`, `DeleteSingle`, `DownloadRow`, `EditRow`, `ExportToCsv`, `ExportToPdf`, `ExportToXls`, `FileChange`, `GridView`, `HeaderClick`, `MenuItemRow`, `MenuRow`, `NextPage`, `PrevPage`, `Refresh`, `SaveSingle`, `SearchClear`, `SearchClick`, `SearchKeyUp`, `SelectAll`, `SelectRow`, `UploadRow` — handlers named `table1_<Event>`.

Also used in: `pgCategories`, `pgContacts`, `pgExcelToApp`, `pgPHPMySQL`, `pgPHPSQLite`, `pgProvinces`, `pgTable`, `pgTable3`…
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `card card-border w-full bg-base-100`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim table As SDUI5Table
table.Initialize(Me, "SDUI5Table", "SDUI5Table")
table.ParentID = "placeholder"
BANano.Await(table.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


