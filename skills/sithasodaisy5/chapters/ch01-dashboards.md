# Chapter 1: Modern Dashboards, Analytics & KPI Workspaces (ch01-dashboards.md)
## SithasoDaisy5 Web Application Layout Blueprint

This blueprint provides the canonical, copy-ready B4J/BANano implementation of modern, high-density dashboard screens and KPI statistics workspaces using SithasoDaisy5 and TailwindCSS.

---

## 1. Executive KPI Metric Grid with Trend Badges

Instead of raw unstyled stats, assemble metric cards using elevated `SDUI5Card` containers with subtle borders, custom typography, and trend delta pills.

```b4j
Sub BuildKpiRow(ParentContainer As SDUI5Container)
    Dim rowKpi As SDUI5Row
    rowKpi.Initialize(Me, "rowKpi", "rowKpi")
    rowKpi.ParentID = ParentContainer.ID
    rowKpi.Classes = "gap-4 mb-8"
    BANano.Await(rowKpi.AddComponent)

    ' 4 KPI Cards: 12 cols on mobile, 6 on tablet, 3 on desktop
    CreateKpiCard(rowKpi.ID, "colKpi1", "cardKpi1", "TOTAL REVENUE", "$148,290", "+14.8%", True)
    CreateKpiCard(rowKpi.ID, "colKpi2", "cardKpi2", "ACTIVE USERS", "14,820", "+8.3%", True)
    CreateKpiCard(rowKpi.ID, "colKpi3", "cardKpi3", "CONVERSION RATE", "3.64%", "-0.4%", False)
    CreateKpiCard(rowKpi.ID, "colKpi4", "cardKpi4", "AVG RESPONSE", "184ms", "-22ms", True)
End Sub

Sub CreateKpiCard(ParentRowID As String, ColID As String, CardID As String, Title As String, Value As String, Delta As String, IsPositive As Boolean)
    Dim col As SDUI5Column
    col.Initialize(Me, ColID, ColID)
    col.ParentID = ParentRowID
    col.Size = "12"
    col.SizeSm = "6"
    col.SizeLg = "3"
    BANano.Await(col.AddComponent)

    Dim card As SDUI5Card
    card.Initialize(Me, CardID, CardID)
    card.ParentID = col.ID
    card.Border = False
    card.Shadow = "none"
    card.Classes = "bg-base-100 border border-base-200/80 rounded-2xl p-5 hover:shadow-md hover:border-base-300 transition-all duration-200"
    ' Clear framework defaults so no "Card Title" / "Card Content" renders
    card.Title = ""
    card.Content = ""
    BANano.Await(card.AddComponent)

    ' Eyebrow Label
    Dim lblTitle As SDUI5Text
    lblTitle.Initialize(Me, CardID & "_title", CardID & "_title")
    lblTitle.ParentID = card.ID
    lblTitle.ApplyDefaults = False
    lblTitle.Text = Title
    lblTitle.Classes = "text-xs font-semibold tracking-wider uppercase text-base-content/60"
    BANano.Await(lblTitle.AddComponent)

    ' Metric Value
    Dim lblVal As SDUI5Text
    lblVal.Initialize(Me, CardID & "_val", CardID & "_val")
    lblVal.ParentID = card.ID
    lblVal.ApplyDefaults = False
    lblVal.Text = Value
    lblVal.Classes = "text-3xl font-extrabold tracking-tight text-base-content mt-1 mb-3"
    BANano.Await(lblVal.AddComponent)

    ' Trend Delta Badge Pill
    Dim badgeTrend As SDUI5Badge
    badgeTrend.Initialize(Me, CardID & "_badge", CardID & "_badge")
    badgeTrend.ParentID = card.ID
    badgeTrend.Size = "sm"
    If IsPositive Then
        badgeTrend.Classes = "badge badge-sm font-semibold bg-success/15 text-success border-0 gap-1"
        badgeTrend.Text = "&uarr; " & Delta & " vs last mo"
    Else
        badgeTrend.Classes = "badge badge-sm font-semibold bg-error/15 text-error border-0 gap-1"
        badgeTrend.Text = "&darr; " & Delta & " vs last mo"
    End If
    BANano.Await(badgeTrend.AddComponent)
End Sub
```

---

## 2. Analytics Split: Chart Panel + Activity Feed

```b4j
Sub BuildAnalyticsSplit(ParentContainer As SDUI5Container)
    Dim rowSplit As SDUI5Row
    rowSplit.Initialize(Me, "rowSplit", "rowSplit")
    rowSplit.ParentID = ParentContainer.ID
    rowSplit.Classes = "gap-6 mb-8"
    BANano.Await(rowSplit.AddComponent)

    ' Left Column: Main Chart Card (8 cols)
    Dim colChart As SDUI5Column
    colChart.Initialize(Me, "colChart", "colChart")
    colChart.ParentID = rowSplit.ID
    colChart.Size = "12"
    colChart.SizeLg = "8"
    BANano.Await(colChart.AddComponent)

    Dim cardChart As SDUI5Card
    cardChart.Initialize(Me, "cardChart", "cardChart")
    cardChart.ParentID = colChart.ID
    cardChart.Border = False
    cardChart.Shadow = "none"
    cardChart.Classes = "bg-base-100 border border-base-200/80 rounded-2xl p-6 shadow-sm"
    cardChart.Title = ""
    cardChart.Content = ""
    BANano.Await(cardChart.AddComponent)

    ' Chart Card Header with Title and Range Tabs
    Dim rowChartHeader As SDUI5Row
    rowChartHeader.Initialize(Me, "rowChartHeader", "rowChartHeader")
    rowChartHeader.ParentID = cardChart.ID
    rowChartHeader.Classes = "items-center justify-between mb-6"
    BANano.Await(rowChartHeader.AddComponent)

    Dim lblChartTitle As SDUI5Text
    lblChartTitle.Initialize(Me, "lblChartTitle", "lblChartTitle")
    lblChartTitle.ParentID = rowChartHeader.ID
    lblChartTitle.ApplyDefaults = False
    lblChartTitle.Text = "Performance Velocity"
    lblChartTitle.Classes = "text-lg font-bold text-base-content"
    BANano.Await(lblChartTitle.AddComponent)

    ' Right Column: Real-time Activity Card (4 cols)
    Dim colFeed As SDUI5Column
    colFeed.Initialize(Me, "colFeed", "colFeed")
    colFeed.ParentID = rowSplit.ID
    colFeed.Size = "12"
    colFeed.SizeLg = "4"
    BANano.Await(colFeed.AddComponent)

    Dim cardFeed As SDUI5Card
    cardFeed.Initialize(Me, "cardFeed", "cardFeed")
    cardFeed.ParentID = colFeed.ID
    cardFeed.Border = False
    cardFeed.Shadow = "none"
    cardFeed.Classes = "bg-base-100 border border-base-200/80 rounded-2xl p-6 shadow-sm"
    cardFeed.Title = ""
    cardFeed.Content = ""
    BANano.Await(cardFeed.AddComponent)
End Sub
```
