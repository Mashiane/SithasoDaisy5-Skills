# Chapter 2: Interactive Forms & Modern Settings (ch02-interactive-forms.md)
## SithasoDaisy5 Web Application Layout Blueprint

This blueprint establishes the standard for crafting clean, human-centered forms, profile settings, and configuration interfaces in SithasoDaisy5.

---

## 1. Two-Column Split Form Layout (Context + Card)

Instead of squishing fields into a narrow centered tube or sprawling across a wide canvas, use a two-column responsive split:

```
+--------------------------------------------------------------+
|  SECTION CONTEXT (4 cols)    |  FIELDSET CARD (8 cols)       |
|  - Section Heading           |  +--------------------------+ |
|  - Explanatory Guidance      |  | Full Name [ input      ] | |
|  - Support / Docs Link       |  | Email     [ input      ] | |
|                              |  | Role      [ select v   ] | |
|                              |  +--------------------------+ |
+--------------------------------------------------------------+
```

```b4j
Sub BuildSettingsSection(ParentContainer As SDUI5Container, SectionTitle As String, SectionDesc As String)
    Dim rowSection As SDUI5Row
    rowSection.Initialize(Me, "rowSection", "rowSection")
    rowSection.ParentID = ParentContainer.ID
    rowSection.Classes = "gap-8 py-8 border-b border-base-200/80"
    BANano.Await(rowSection.AddComponent)

    ' Left Context Column (4 cols on desktop)
    Dim colContext As SDUI5Column
    colContext.Initialize(Me, "colContext", "colContext")
    colContext.ParentID = rowSection.ID
    colContext.Size = "12"
    colContext.SizeLg = "4"
    BANano.Await(colContext.AddComponent)

    Dim lblSecTitle As SDUI5Text
    lblSecTitle.Initialize(Me, "lblSecTitle", "lblSecTitle")
    lblSecTitle.ParentID = colContext.ID
    lblSecTitle.ApplyDefaults = False
    lblSecTitle.Text = SectionTitle
    lblSecTitle.Classes = "text-xl font-bold tracking-tight text-base-content"
    BANano.Await(lblSecTitle.AddComponent)

    Dim lblSecDesc As SDUI5Text
    lblSecDesc.Initialize(Me, "lblSecDesc", "lblSecDesc")
    lblSecDesc.ParentID = colContext.ID
    lblSecDesc.ApplyDefaults = False
    lblSecDesc.Text = SectionDesc
    lblSecDesc.Classes = "text-sm text-base-content/70 mt-2 leading-relaxed"
    BANano.Await(lblSecDesc.AddComponent)

    ' Right Field Card Column (8 cols on desktop)
    Dim colFields As SDUI5Column
    colFields.Initialize(Me, "colFields", "colFields")
    colFields.ParentID = rowSection.ID
    colFields.Size = "12"
    colFields.SizeLg = "8"
    BANano.Await(colFields.AddComponent)

    Dim cardFields As SDUI5Card
    cardFields.Initialize(Me, "cardFields", "cardFields")
    cardFields.ParentID = colFields.ID
    cardFields.Border = False
    cardFields.Shadow = "none"
    cardFields.Classes = "bg-base-100 border border-base-200/80 rounded-2xl p-6 shadow-sm space-y-6"
    cardFields.Title = ""
    cardFields.Content = ""
    BANano.Await(cardFields.AddComponent)
End Sub
```

---

## 2. Setting Toggle with Title & Caption

Never render an unlabelled bare toggle switch. Always pair the toggle with a title and helper description:

```b4j
Sub AddToggleSetting(ParentID As String, ID As String, Label As String, Description As String, IsChecked As Boolean)
    Dim rowToggle As SDUI5Row
    rowToggle.Initialize(Me, ID & "_row", ID & "_row")
    rowToggle.ParentID = ParentID
    rowToggle.Classes = "items-center justify-between py-3 border-b border-base-200/50 last:border-0"
    BANano.Await(rowToggle.AddComponent)

    ' Text descriptions (left)
    Dim colText As SDUI5Column
    colText.Initialize(Me, ID & "_colText", ID & "_colText")
    colText.ParentID = rowToggle.ID
    colText.Size = "9"
    BANano.Await(colText.AddComponent)

    Dim lblTitle As SDUI5Text
    lblTitle.Initialize(Me, ID & "_lbl", ID & "_lbl")
    lblTitle.ParentID = colText.ID
    lblTitle.ApplyDefaults = False
    lblTitle.Text = Label
    lblTitle.Classes = "text-sm font-semibold text-base-content"
    BANano.Await(lblTitle.AddComponent)

    Dim lblCaption As SDUI5Text
    lblCaption.Initialize(Me, ID & "_cap", ID & "_cap")
    lblCaption.ParentID = colText.ID
    lblCaption.ApplyDefaults = False
    lblCaption.Text = Description
    lblCaption.Classes = "text-xs text-base-content/60"
    BANano.Await(lblCaption.AddComponent)

    ' Switch Toggle (right)
    Dim colToggle As SDUI5Column
    colToggle.Initialize(Me, ID & "_colToggle", ID & "_colToggle")
    colToggle.ParentID = rowToggle.ID
    colToggle.Size = "3"
    colToggle.Classes = "flex justify-end"
    BANano.Await(colToggle.AddComponent)

    Dim toggle As SDUI5Toggle
    toggle.Initialize(Me, ID, ID)
    toggle.ParentID = colToggle.ID
    toggle.Color = "primary"
    toggle.Checked = IsChecked
    BANano.Await(toggle.AddComponent)
End Sub
```
