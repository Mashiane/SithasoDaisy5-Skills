# Chapter 5: Media, Visual Surfaces & Bento Cards (ch05-media-cards.md)
## SithasoDaisy5 Web Application Layout Blueprint

This blueprint covers rich visual components: modern Bento cards, high-conversion split heroes, and e-commerce product cards with glass surfaces.

---

## 1. High-Craft Bento Feature Card

```b4j
Sub BuildBentoHeroCard(ParentRowID As String, ColID As String, CardID As String)
    Dim col As SDUI5Column
    col.Initialize(Me, ColID, ColID)
    col.ParentID = ParentRowID
    col.Size = "12"
    col.SizeLg = "8"
    BANano.Await(col.AddComponent)

    Dim card As SDUI5Card
    card.Initialize(Me, CardID, CardID)
    card.ParentID = col.ID
    card.Border = False
    card.Shadow = "none"
    card.Classes = "bg-base-100 border border-base-200/80 rounded-3xl p-8 shadow-sm hover:shadow-xl transition-all duration-300 relative overflow-hidden"
    card.Title = ""
    card.Content = ""
    BANano.Await(card.AddComponent)

    ' Eyebrow Badge
    Dim badge As SDUI5Badge
    badge.Initialize(Me, CardID & "_badge", CardID & "_badge")
    badge.ParentID = card.ID
    badge.Color = "primary"
    badge.Style = "soft"
    badge.Size = "sm"
    badge.Icon = "fa-solid fa-star"
    badge.Text = "Intelligence Engine"
    badge.Classes = "mb-4 font-semibold"
    BANano.Await(badge.AddComponent)

    ' Title
    Dim lblTitle As SDUI5Text
    lblTitle.Initialize(Me, CardID & "_title", CardID & "_title")
    lblTitle.ParentID = card.ID
    lblTitle.ApplyDefaults = False
    lblTitle.Text = "Automated Workflows that Scale With You"
    lblTitle.Classes = "text-2xl md:text-3xl font-extrabold tracking-tight text-base-content mb-3"
    BANano.Await(lblTitle.AddComponent)

    ' Subtitle
    Dim lblDesc As SDUI5Text
    lblDesc.Initialize(Me, CardID & "_desc", CardID & "_desc")
    lblDesc.ParentID = card.ID
    lblDesc.ApplyDefaults = False
    lblDesc.Text = "Trigger event-driven actions, synchronize data across enterprise silos, and visualize throughput in real-time."
    lblDesc.Classes = "text-base text-base-content/70 max-w-xl mb-6"
    BANano.Await(lblDesc.AddComponent)

    ' Simulated Interactive Preview Box (Inside the card)
    Dim previewBox As SDUI5Container
    previewBox.Initialize(Me, CardID & "_preview", CardID & "_preview")
    previewBox.ParentID = card.ID
    previewBox.Classes = "bg-base-200/50 border border-base-300/50 rounded-2xl p-4 shadow-inner"
    BANano.Await(previewBox.AddComponent)
End Sub
```

---

## 2. Modern E-Commerce Product Card

A product card with image presentation, brand badge, product title, star rating, formatted price, and single add-to-cart action:

```b4j
Sub BuildProductCard(ParentRowID As String, ColID As String, CardID As String, ImgUrl As String, Brand As String, Title As String, Price As String, RatingVal As Double)
    Dim col As SDUI5Column
    col.Initialize(Me, ColID, ColID)
    col.ParentID = ParentRowID
    col.Size = "12"
    col.SizeSm = "6"
    col.SizeLg = "4"
    BANano.Await(col.AddComponent)

    Dim card As SDUI5Card
    card.Initialize(Me, CardID, CardID)
    card.ParentID = col.ID
    card.Border = False
    card.Shadow = "none"
    card.Classes = "bg-base-100 border border-base-200/80 rounded-3xl overflow-hidden shadow-sm hover:shadow-xl hover:-translate-y-1 transition-all duration-300 flex flex-col"
    card.Title = ""
    card.Content = ""
    BANano.Await(card.AddComponent)

    ' Image Slot
    Dim imgBox As SDUI5Image
    imgBox.Initialize(Me, CardID & "_img", CardID & "_img")
    imgBox.ParentID = card.ID
    imgBox.Src = ImgUrl
    imgBox.Classes = "h-56 w-full object-cover rounded-t-3xl"
    BANano.Await(imgBox.AddComponent)

    ' Card Content Body Container
    Dim body As SDUI5Container
    body.Initialize(Me, CardID & "_body", CardID & "_body")
    body.ParentID = card.ID
    body.Classes = "p-6 flex-1 flex flex-col justify-between"
    BANano.Await(body.AddComponent)

    ' Header: Brand Pill + Title
    Dim lblBrand As SDUI5Text
    lblBrand.Initialize(Me, CardID & "_brand", CardID & "_brand")
    lblBrand.ParentID = body.ID
    lblBrand.ApplyDefaults = False
    lblBrand.Text = Brand.ToUpperCase
    lblBrand.Classes = "text-xs font-bold tracking-widest text-primary mb-1"
    BANano.Await(lblBrand.AddComponent)

    Dim lblTitle As SDUI5Text
    lblTitle.Initialize(Me, CardID & "_title", CardID & "_title")
    lblTitle.ParentID = body.ID
    lblTitle.ApplyDefaults = False
    lblTitle.Text = Title
    lblTitle.Classes = "text-lg font-bold text-base-content line-clamp-1 mb-2"
    BANano.Await(lblTitle.AddComponent)

    ' Price and CTA Row
    Dim rowBuy As SDUI5Row
    rowBuy.Initialize(Me, CardID & "_buy", CardID & "_buy")
    rowBuy.ParentID = body.ID
    rowBuy.Classes = "items-center justify-between mt-4 pt-4 border-t border-base-200/80"
    BANano.Await(rowBuy.AddComponent)

    Dim lblPrice As SDUI5Text
    lblPrice.Initialize(Me, CardID & "_price", CardID & "_price")
    lblPrice.ParentID = rowBuy.ID
    lblPrice.ApplyDefaults = False
    lblPrice.Text = Price
    lblPrice.Classes = "text-xl font-extrabold text-base-content"
    BANano.Await(lblPrice.AddComponent)

    Dim btnAdd As SDUI5Button
    btnAdd.Initialize(Me, CardID & "_btnAdd", CardID & "_btnAdd")
    btnAdd.ParentID = rowBuy.ID
    btnAdd.Color = "primary"
    btnAdd.Size = "sm"
    btnAdd.Classes = "rounded-xl font-bold shadow-md shadow-primary/20"
    btnAdd.Text = "Add to Bag"
    BANano.Await(btnAdd.AddComponent)
End Sub
```
