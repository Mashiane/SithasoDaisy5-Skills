# Chapter 4: User Feedback, Modals & Loading States (ch04-feedback.md)
## SithasoDaisy5 Web Application Layout Blueprint

This blueprint establishes standard patterns for async feedback, loading skeletons, confirmation dialogues, and toast notifications.

---

## 1. Shimmer Loading Skeletons for Data Views

Never leave the screen completely blank during fetch operations. Mount a shimmer skeleton matching the exact shape of the expected card:

```b4j
Sub ShowLoadingSkeleton(ParentID As String, SkeletonID As String) As SDUI5Container
    Dim contSkeleton As SDUI5Container
    contSkeleton.Initialize(Me, SkeletonID, SkeletonID)
    contSkeleton.ParentID = ParentID
    contSkeleton.Classes = "space-y-4 animate-pulse p-6 bg-base-100 rounded-2xl border border-base-200"
    BANano.Await(contSkeleton.AddComponent)

    ' Title skeleton bar
    Dim skelTitle As SDUI5Skeleton
    skelTitle.Initialize(Me, SkeletonID & "_t", SkeletonID & "_t")
    skelTitle.ParentID = contSkeleton.ID
    skelTitle.Classes = "h-6 w-1/3 rounded-lg"
    BANano.Await(skelTitle.AddComponent)

    ' Body line skeletons
    Dim skelLine1 As SDUI5Skeleton
    skelLine1.Initialize(Me, SkeletonID & "_l1", SkeletonID & "_l1")
    skelLine1.ParentID = contSkeleton.ID
    skelLine1.Classes = "h-4 w-full rounded-md"
    BANano.Await(skelLine1.AddComponent)

    Dim skelLine2 As SDUI5Skeleton
    skelLine2.Initialize(Me, SkeletonID & "_l2", SkeletonID & "_l2")
    skelLine2.ParentID = contSkeleton.ID
    skelLine2.Classes = "h-4 w-2/3 rounded-md"
    BANano.Await(skelLine2.AddComponent)

    Return contSkeleton
End Sub
```

---

## 2. Destructive Action Confirmation via SweetAlert

Per `RULE-INTERACT-004`, all destructive actions (delete, clear, reset) MUST prompt the user for confirmation:

```b4j
Sub btnDelete_Click(e As BANanoEvent)
    Dim confirmed As Boolean = BANano.Await(app.ShowSwalConfirm("Delete Record?", "Are you sure you want to permanently delete this item? This action cannot be undone."))
    If confirmed Then
        ' Proceed with deletion
        PerformDelete
        app.ShowSwalSuccess("Deleted", "Record has been removed successfully.")
    End If
End Sub
```
