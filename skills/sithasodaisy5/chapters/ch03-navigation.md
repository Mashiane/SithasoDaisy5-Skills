# Chapter 3: Navigation, Shells & Command Bars (ch03-navigation.md)
## SithasoDaisy5 Web Application Layout Blueprint

This blueprint covers modern app navigation: sticky glass topbars, collapsible sidebar drawers, breadcrumbs, and mobile bottom docks.

---

## 1. Sticky Frosted Glass Topbar

A clean, modern topbar with brand identity, breadcrumbs, search trigger, and user profile avatar:

```b4j
Sub BuildModernTopNav(ParentID As String, PageTitle As String)
    Dim navbar As SDUI5NavBar
    navbar.Initialize(Me, "mainNav", "mainNav")
    navbar.ParentID = ParentID
    navbar.Classes = "sticky top-0 z-40 bg-base-100/80 backdrop-blur-md border-b border-base-200/80 px-4 lg:px-8 py-3"
    BANano.Await(navbar.AddComponent)

    ' Left Brand / Title slot
    Dim rowBrand As SDUI5Row
    rowBrand.Initialize(Me, "navBrand", "navBrand")
    rowBrand.ParentID = navbar.ID
    rowBrand.Classes = "items-center gap-3"
    BANano.Await(rowBrand.AddComponent)

    Dim lblBrand As SDUI5Text
    lblBrand.Initialize(Me, "lblBrand", "lblBrand")
    lblBrand.ParentID = rowBrand.ID
    lblBrand.ApplyDefaults = False
    lblBrand.Text = "Acme Cloud"
    lblBrand.Classes = "text-lg font-extrabold tracking-tight text-base-content"
    BANano.Await(lblBrand.AddComponent)

    Dim badgeVer As SDUI5Badge
    badgeVer.Initialize(Me, "badgeVer", "badgeVer")
    badgeVer.ParentID = rowBrand.ID
    badgeVer.Size = "xs"
    badgeVer.Color = "primary"
    badgeVer.Style = "soft"
    badgeVer.Text = "v5.2"
    BANano.Await(badgeVer.AddComponent)

    ' Right Action Controls (Search + Notifications + User Avatar)
    Dim rowActions As SDUI5Row
    rowActions.Initialize(Me, "navActions", "navActions")
    rowActions.ParentID = navbar.ID
    rowActions.Classes = "items-center justify-end gap-3"
    BANano.Await(rowActions.AddComponent)

    ' Search Trigger Button
    Dim btnSearch As SDUI5Button
    btnSearch.Initialize(Me, "btnSearch", "btnSearch")
    btnSearch.ParentID = rowActions.ID
    btnSearch.Style = "ghost"
    btnSearch.Size = "sm"
    btnSearch.Classes = "text-base-content/70 hover:text-base-content gap-2"
    btnSearch.Icon = "fa-solid fa-magnifying-glass"
    btnSearch.Text = "Search (Ctrl+K)"
    BANano.Await(btnSearch.AddComponent)

    ' User Profile Avatar
    Dim avatarUser As SDUI5Avatar
    avatarUser.Initialize(Me, "avatarUser", "avatarUser")
    avatarUser.ParentID = rowActions.ID
    avatarUser.Size = "sm"
    avatarUser.Rounded = "full"
    avatarUser.Classes = "ring-2 ring-primary/30"
    ' Initials placeholder or verified asset
    avatarUser.Text = "JD"
    avatarUser.Color = "primary"
    BANano.Await(avatarUser.AddComponent)
End Sub
```

---

## 2. Mobile Bottom Dock (Thumb-Zone Navigation)

On small screens, primary navigation belongs in the bottom thumb zone:

```b4j
Sub BuildMobileBottomDock(ParentID As String)
    Dim dock As SDUI5Dock
    dock.Initialize(Me, "mobileDock", "mobileDock")
    dock.ParentID = ParentID
    dock.Classes = "lg:hidden border-t border-base-200/80 bg-base-100/90 backdrop-blur-md"
    BANano.Await(dock.AddComponent)
    
    ' Add standard dock items (Home, Analytics, Messages, Settings)
    ' Configured per dock item specifications
End Sub
```
