---
name: component-creation-patterns
description: Mount-sequence patterns for every SDUI5* component. Standard 3-step for most; container deviations for SDUI5Stat, SDUI5Dock, SDUI5Carousel, SDUI5Timeline, SDUI5Accordion, SDUI5SweetAlert.
---

# SithasoDaisy5 — Component Creation Patterns

Standardized mount sequences. Every component follows one of two patterns:

1. **Standard 3-Step** — most components
2. **Container Deviation** — for components that hold children (Stat, Dock, Carousel, Timeline, Accordion, SweetAlert)

**Verify your pattern** matches the per-component `.md` before generating.

---

## 1. Standard 3-Step (Most Components)

Applies to: `SDUI5Button`, `SDUI5Badge`, `SDUI5Alert`, `SDUI5Card`, `SDUI5Toggle`, `SDUI5Select`, `SDUI5CheckBox`, `SDUI5Radio`, `SDUI5Range`, `SDUI5Rating`, `SDUI5Progress`, `SDUI5RadialProgress`, `SDUI5Stat`, `SDUI5Avatar`, `SDUI5TextBox`, `SDUI5TextArea`, `SDUI5FieldSet`, `SDUI5FileInput`, `SDUI5Image`, `SDUI5Divider`, `SDUI5Skeleton`, `SDUI5Loading`, `SDUI5ToolTip`, etc.

```b4j
' Step 1: Initialize
Component.Initialize(Me, "ComponentEventName")

' Step 2: Set Properties (variant, size, text, icon, etc.)
Button.Color = "primary"           ' SDUI5Button variant; follow the specific component's color list
Component.Size = "md"              ' optional: xs|sm|md|lg|xl
Component.Text = "Button Text"     ' optional
Component.Icon = "./assets/img.svg"' optional: asset path
Component.Title = "Title"          ' optional
Component.Width = "full"           ' component-specific: "full" or numeric (none preferred)

' Step 3: Mount to parent hierarchy
Component.ParentID = "SDUI5Column1"' must reference existing parent
BANano.Await(Component.AddComponent)' must call AddComponent after ParentID set
```

### Critical Order Requirements

| Step | Must Be Completed Before | Failure Mode |
|---|---|---|
| Initialize | Parent component exists in hierarchy | `Initialize` succeeds but `AddComponent` throws "Parent not found" |
| Set Properties | After Initialize | None — properties set before Initialize also work |
| AddComponent | ParentID set to existing parent | Runtime error: "Parent not found" or silent failure |

### Prefer Matching Designer Properties to Utility Classes

Before adding a utility to `.Classes`, inspect the component reference and use its typed designer property when it represents the same behavior. Examples:

```b4j
Card.Height = "full"                 ' use Height instead of h-full when supported
Avatar.Shadow = "lg"                  ' use Shadow instead of shadow-lg when supported
Text.FontWeight = "semibold"          ' use FontWeight instead of font-semibold
Text.MarginAXYTBLR = "a=?; x=?; y=?; t=6; b=?; l=?; r=?" ' use root spacing property
Text.Opacity = 70                     ' use Opacity instead of opacity-70
```

Use only properties listed for that exact component. `MarginAXYTBLR` and `PaddingAXYTBLR` affect the outer component element; use `BodyClasses`, `ContentClasses`, or another named inner-region property for styles on a compound component's child region. Keep breakpoint utilities (for example `md:py-8`), min/max sizing, flex/grid layout, and utilities with no equivalent component property in `.Classes`. `RawClasses` is the underlying raw-class channel; it is not a substitute for typed designer properties. Use `RawStyles` for exceptional inline CSS and `RawAttributes` for HTML attributes.

---

## 2. Container Deviations

These components require **non-standard** mount sequences. Read the per-component `.md` before using.

### 2.1 SDUI5Stat (Stat container)

```b4j
' Stat requires structural properties BEFORE AddComponent
SDUI5Stat1.Initialize(Me, "stat1")
SDUI5Stat1.Direction = "horizontal"     ' "horizontal" or "vertical"
SDUI5Stat1.AlignHorizontal = "center"
SDUI5Stat1.Boxed = True
SDUI5Stat1.ParentID = "SDUI5Column1"
BANano.Await(SDUI5Stat1.AddComponent)

' Items added AFTER AddComponent
SDUI5StatItem1.Initialize(Me, "item1")
SDUI5StatItem1.Title = "Page Views"
SDUI5StatItem1.Value = "31,200"
SDUI5Stat1.AddItem(SDUI5StatItem1)    ' STAT-SPECIFIC: AddItem after mount
```

### 2.2 SDUI5Dock (Bottom navigation)

```b4j
' Set tab properties BEFORE AddComponent
SDUI5Dock1.Initialize(Me, "dock1")
SDUI5Dock1.AddHomeTab("home", "Home", "./assets/home.svg")
SDUI5Dock1.AddSearchTab("search", "Search", "./assets/search.svg")
SDUI5Dock1.AddProfileTab("profile", "Profile", "./assets/profile.svg")
SDUI5Dock1.ActiveTab = "home"
SDUI5Dock1.ParentID = "SDUI5Container1"
BANano.Await(SDUI5Dock1.AddComponent)
```

### 2.3 SDUI5Carousel / SDUI5Swiper (Carousel + items)

```b4j
' Standard init for carousel
SDUI5Carousel1.Initialize(Me, "carousel1")
SDUI5Carousel1.Rounded = "rounded-box"
SDUI5Carousel1.Width = "full"
SDUI5Carousel1.ParentID = "SDUI5Column1"
BANano.Await(SDUI5Carousel1.AddComponent)

' Items registered AFTER AddComponent (CAROUSEL-SPECIFIC)
Dim itm As SDUI5CarouselItem
itm.Initialize(Me, "item1")
itm.Source = "./assets/slide1.jpg"
itm.Title = "Slide 1"
SDUI5Carousel1.AddItem(itm)        ' CAROUSEL-SPECIFIC
SDUI5Carousel1.Refresh              ' CAROUSEL-SPECIFIC: re-render with new items
```

### 2.4 SDUI5Timeline (Timeline + items)

```b4j
SDUI5Timeline1.Initialize(Me, "timeline1")
SDUI5Timeline1.ParentID = "SDUI5Column1"
BANano.Await(SDUI5Timeline1.AddComponent)

' Items added AFTER AddComponent
Dim item As SDUI5TimelineItem
item.Initialize(Me, "item1")
item.Title = "Event 1"
item.Date = "Jan 15, 2024"
SDUI5Timeline1.AddItem(item)         ' TIMELINE-SPECIFIC
```

### 2.5 SDUI5Accordion / SDUI5Collapse (Header + content)

```b4j
SDUI5Accordion1.Initialize(Me, "accordion1")
SDUI5Accordion1.ParentID = "SDUI5Column1"
BANano.Await(SDUI5Accordion1.AddComponent)

' Items with header + content
Dim item As SDUI5AccordionItem
item.Initialize(Me, "acc1")
item.Title = "Section 1"
item.Content = "Content for section 1"
SDUI5Accordion1.AddItem(item)        ' ACCORDION-SPECIFIC
SDUI5Accordion1.Refresh              ' ACCORDION-SPECIFIC
```

### 2.6 SDUI5SweetAlert / SDUI5Swal (Modal dialog)

```b4j
' SweetAlert uses 3-argument Initialize, NOT the standard 2-argument
SDUI5Swal1.Initialize(Me, "swal", Root)  ' NOTE: 3 args, not 2
SDUI5Swal1.Header = "Confirmation"
SDUI5Swal1.Text = "Are you sure?"
SDUI5Swal1.AddButton("cancel", "No", "cancel", "")
SDUI5Swal1.AddButton("confirm", "Yes", "confirm", "")
SDUI5Swal1.ParentID = "body"              ' NOT: pageScroll.Panel
' OR: SDUI5Swal1.Show                      ' alternative: show directly

' Event handling
' Wait For SDUI5Swal1_EventName(result)    ' async
' result = True/False based on button clicked
```

### 2.7 SDUI5Modal

These follow standard 3-step BUT mount into a wrapper, not directly into the page hierarchy. It's designed to host child controls.

```b4j
SDUI5Modal1.Initialize(Me, "modal1")
SDUI5Modal1.Title = "Edit Profile"
SDUI5Modal1.ParentID = "SDUI5Column1"
BANano.Await(SDUI5Modal1.AddComponent)

' Children mount into the modal's named regions (e.g., SDUI5Modal1_actions)
SDUI5Button1.Initialize(Me, "ok_btn")
SDUI5Button1.ParentID = "SDUI5Modal1_actions"   ' modal's named action slot
SDUI5Button1.Color = "primary"
SDUI5Button1.Text = "OK"
BANano.Await(SDUI5Button1.AddComponent)
```

For a dialog (`IsCard = False`), open it with `SDUI5Modal1.Show`. Call `Close` in every action handler that should dismiss the dialog, including Cancel:

```b4j
SDUI5Modal1.Show

Sub SDUI5Modal1_Yes_Click(e As BANanoEvent)
    SDUI5Modal1.Close
End Sub

Sub SDUI5Modal1_Cancel_Click(e As BANanoEvent)
    SDUI5Modal1.Close
End Sub
```

Do not use `SDUI5Modal1.Open = True/False` or `setOpen` for dialog visibility. `Show` and `Close` keep the modal's hidden checkbox synchronized with its close and backdrop controls.

### 2.8 SDUI5TreeView

```b4j
SDUI5TreeView1.Initialize(Me, "tree1")
SDUI5TreeView1.ParentID = "SDUI5Column1"
BANano.Await(SDUI5TreeView1.AddComponent)

' Add nodes via AddNode or set Items
SDUI5TreeView1.AddNode("root", "", "Root")   ' parentId, beforeId, label
SDUI5TreeView1.AddNode("child1", "root", "Child 1")
SDUI5TreeView1.Refresh
```

### 2.9 SDUI5List (Virtualized)

```b4j
SDUI5List1.Initialize(Me, "list1")
SDUI5List1.ParentID = "SDUI5Column1"
BANano.Await(SDUI5List1.AddComponent)

' Items added via SetItems
SDUI5List1.SetItems(myDataList)     ' accepts B4J List of Maps
```

### 2.10 SDUI5Drawer / SDUI5Modal (Overlay positioning)

Drawer/Modal components often render into `body` not the page hierarchy:

```b4j
SDUI5Modal1.Initialize(Me, "modal1")
SDUI5Modal1.ParentID = "body"        ' render at root level, not in page tree
BANano.Await(SDUI5Modal1.AddComponent)
' OR use Show() for one-shot display
SDUI5Modal1.Show
```

---

## 3. Decision Flowchart

```
Need a child component?
  ├─ Is it a leaf (Button, Input, Badge, Image, ...)?
  │    → Standard 3-step: Initialize → Properties → AddComponent
  ├─ Is it a leaf that goes INTO a container (Modal action, Drawer body, etc.)?
  │    → Standard 3-step but ParentID = <container>_<slot>
  └─ Is it a CONTAINER holding children (Stat, Dock, Carousel, Timeline, Accordion)?
       → Container pattern: container mounts first, then AddItem/Refresh

Is the component dialog-y (SweetAlert, Modal, Drawer)?
  → Check parent placement — may be `body` not page hierarchy
```

---

## 4. Anti-Patterns

| Anti-pattern | Why |
|---|---|
| Skipping `ParentID = ...` before `AddComponent` | "Parent not found" runtime error |
| Skipping `Initialize` | Component has no mCallBack/mName/mEventName — events can't fire |
| Setting properties AFTER `AddComponent` | Most properties work, but `Size`/`Color` are usually rendered during AddComponent. Verify per-component. |
| Mixing `Initialize(Me, "x")` with `Initialize(Me, "x", "x")` | First form is correct. Second form (`3-argument`) is SweetAlert-only. Wrong count = compile/runtime error. |
| Adding child without parent `AddComponent` | `ParentID` references a DOM node that doesn't exist yet |

---

## 5. Quick Reference Table

| Component | Standard 3-step | Container deviation | Notes |
|---|---|---|---|
| `SDUI5Button`, `SDUI5TextBox`, etc. | ✅ | — | most common |
| `SDUI5Stat` | — | AddItem after AddComponent | holds StatItems |
| `SDUI5Dock` | — | AddHomeTab/Search/etc. before AddComponent | holds tabs |
| `SDUI5Carousel` | — | AddItem + Refresh after AddComponent | holds CarouselItems |
| `SDUI5Timeline` | — | AddItem after AddComponent | holds TimelineItems |
| `SDUI5Accordion` | — | AddItem + Refresh after AddComponent | holds AccordionItems |
| `SDUI5Collapse` | — | Similar to Accordion | holds CollapseItems |
| `SDUI5SweetAlert` | — | 3-arg Initialize; mounts to body | async dialog |
| `SDUI5Modal` | ✅ | children mount into modal's named slots | overlay |
| `SDUI5TreeView` | — | AddNode + Refresh | tree structure |
| `SDUI5List` | — | SetItems | virtualized |
| `SDUI5Table` | ✅ | SetItems / SetItemsPerPage | — |

---

## 6. References

- `references/ux-master-doctrine.md` — quantitative design laws + DoD
- `references/rules-enforcer.md` — RULE-MOUNT-* rules citing this doc
- `references/negative-knowledge.md` — anti-patterns
- `components/<Name>.md` — per-component authoritative mount sequence
