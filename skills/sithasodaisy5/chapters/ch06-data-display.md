# Chapter 6: Data Display, Rich Tables & Timelines (ch06-data-display.md)
## SithasoDaisy5 Web Application Layout Blueprint

This blueprint establishes patterns for displaying rich tabular data, avatar badges, status indicators, and timelines in SithasoDaisy5.

---

## 1. High-Density Modern Data Table

A data table wrapped in a subtle elevated card with search controls and pagination:

```b4j
Sub BuildTableCard(ParentContainer As SDUI5Container)
    Dim rowTable As SDUI5Row
    rowTable.Initialize(Me, "rowTable", "rowTable")
    rowTable.ParentID = ParentContainer.ID
    rowTable.Classes = "mb-8"
    BANano.Await(rowTable.AddComponent)

    Dim colTable As SDUI5Column
    colTable.Initialize(Me, "colTable", "colTable")
    colTable.ParentID = rowTable.ID
    colTable.Size = "12"
    BANano.Await(colTable.AddComponent)

    Dim cardTable As SDUI5Card
    cardTable.Initialize(Me, "cardTable", "cardTable")
    cardTable.ParentID = colTable.ID
    cardTable.Border = False
    cardTable.Shadow = "none"
    cardTable.Classes = "bg-base-100 border border-base-200/80 rounded-2xl shadow-sm overflow-hidden"
    cardTable.Title = ""
    cardTable.Content = ""
    BANano.Await(cardTable.AddComponent)

    ' Table Toolbar Header (Search input + Export button)
    Dim rowToolbar As SDUI5Row
    rowToolbar.Initialize(Me, "rowToolbar", "rowToolbar")
    rowToolbar.ParentID = cardTable.ID
    rowToolbar.Classes = "items-center justify-between p-6 border-b border-base-200/80"
    BANano.Await(rowToolbar.AddComponent)

    Dim lblTableTitle As SDUI5Text
    lblTableTitle.Initialize(Me, "lblTableTitle", "lblTableTitle")
    lblTableTitle.ParentID = rowToolbar.ID
    lblTableTitle.ApplyDefaults = False
    lblTableTitle.Text = "Recent Transactions"
    lblTableTitle.Classes = "text-lg font-bold text-base-content"
    BANano.Await(lblTableTitle.AddComponent)

    ' Data Table Host
    Dim tableData As SDUI5Table
    tableData.Initialize(Me, "tableData", "tableData")
    tableData.ParentID = cardTable.ID
    tableData.Classes = "table-zebra w-full"
    BANano.Await(tableData.AddComponent)
End Sub
```

---

## 2. Status Pill Formatter for Table Rows

Use semantic status pills instead of plain text strings in table status columns:

```b4j
Sub GetStatusPillHtml(Status As String) As String
    Select Case Status.ToLowerCase
        Case "completed", "active", "paid"
            Return "<span class='badge badge-success badge-sm gap-1 bg-success/15 text-success border-0 font-medium'><span class='h-1.5 w-1.5 rounded-full bg-success'></span>" & Status & "</span>"
        Case "pending", "processing"
            Return "<span class='badge badge-warning badge-sm gap-1 bg-warning/15 text-warning border-0 font-medium'><span class='h-1.5 w-1.5 rounded-full bg-warning'></span>" & Status & "</span>"
        Case "failed", "cancelled", "overdue"
            Return "<span class='badge badge-error badge-sm gap-1 bg-error/15 text-error border-0 font-medium'><span class='h-1.5 w-1.5 rounded-full bg-error'></span>" & Status & "</span>"
        Case Else
            Return "<span class='badge badge-neutral badge-sm font-medium'>" & Status & "</span>"
    End Select
End Sub
```
