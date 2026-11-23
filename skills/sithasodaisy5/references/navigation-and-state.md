---
name: navigation-and-state
description: Navigation and state-lifetime doctrine for SithasoDaisy5 web apps. Use when adding pages, dialogs, wizards, auth or onboarding flows, deep-linkable screens, or any data that must survive Back, refresh, or a slow network.
---

# Navigation and State Doctrine

A screenshot cannot show navigation, and a demo cannot show state lifetime. Both are
where generated apps fail after they look right. Use this with
[state-recipes.md](state-recipes.md) (the four visual states) and
[page-architectures.md](page-architectures.md) (composition).

The app shell exposes `app.NavigateTo(url, params)` and the `NavigateToRoot*` family for
page changes, and `PagePause` / `PageResume` as lifecycle hooks. Confirm their exact
route and parameter behaviour in `components/SDUI5App.md` before depending on history
semantics; do not assume a browser framework's behaviour from another stack.

## 1. Choose the presentation before the layout

The same content can be a page, a drawer, or a dialog. Pick by task shape.

| Task shape | Presentation | What Back does |
|---|---|---|
| Peer destination (dashboard, list, settings) | Page / route | Returns to the previous peer |
| Drill-down (record detail, order) | Page / route with the parent underneath | Returns to the list, preserving scroll and filters |
| Self-contained multi-step task (checkout, onboarding, wizard) | Modal with its own Cancel/Done | Closes the modal, not the step history |
| Short interruption (filters, item actions, confirm) | Drawer, popover, or context menu | Dismisses and returns focus to the trigger |
| One-off confirmation | Alert | Cancels the action |
| Something floating over still-visible content | Overlay or lightbox | Dismisses the overlay only |

Two rules decide most cases:

- **If a link could open it, it is a route.** If it only makes sense from the current
  screen, it is an overlay. A dialog driven by local visibility is not deep-linkable;
  a screen that happens to be shown in a drawer is still a page.
- **A sheet that grows a second step was a modal all along.** Multi-step tasks need
  their own Cancel/Done and their own scroll, not an ever-growing drawer.

## 2. History rules

- **Push** when the user will want to return here. **Replace** when returning would
  land in a state the world has moved past: after sign-in, completed onboarding
  (including "skip"), a purchase, a deletion, or a finished session.
- **One-way doors leave the stack.** After an irreversible completion, Back must never
  re-enter the old state. But keep the user's *place*: a sign-in demanded by one action
  (save, follow, buy) returns to that action, unlocked - never to a generic home.
- **Back undoes navigation, never events.** Do not use history to reverse a data
  change; that is a rollback in the data layer, not a page transition.
- **Intercept Back in exactly two cases:** an irreversible request in flight (with
  visible progress), and unsaved work in a modal (ask first). A funnel, a rating
  prompt, or a "complete your profile" trap that blocks Back is a defect.
- **Tabs are peers.** No slide transition between them, each keeps its own state, and
  re-selecting the active tab returns to its root. Full-attention screens (player,
  composer, checkout) belong above the tabs, not inside one.
- **Cold start resolves state before first paint.** Restore session and route before
  the shell renders, so the user never sees a Login flash before Home. `PagePause` and
  `PageResume` are lifecycle hooks, not a router.

## 3. Place state by its lifetime

| State | Owner | Survives Back / refresh? |
|---|---|---|
| Server records | The existing data layer (`SDUIFetch`, `SDUIRestApi`, PocketBase, MySQL) | Refetched or restored by that layer |
| Session and cross-screen preferences | App-level shared state | Yes, by design |
| Open dialog, selection, expanded row, unsaved field edit | The page | No, unless the flow requires it |
| A deliberate draft | Existing storage rules | Only what the product requires |

- **One source per record.** Do not create a parallel cache that can disagree with the
  data layer about the same row.
- **Do not promote transient UI state.** Opening a dialog is not app state.
- **Never persist sensitive values for convenience.** A draft is not permission to
  store secrets, tokens, or private customer data locally.
- **Optimistic updates only for reversible operations** with a real rollback. Payment,
  permission, deletion, and account changes need authoritative confirmation.
- **Guard repeated activation.** A disabled button is not a server guarantee; reuse the
  backend's idempotency support and ignore duplicate submissions while one is pending.
- **A stale response must never overwrite a newer choice.** Tag requests and discard
  out-of-order results for the same field or record.
- **Retry the operation, not the flow.** Do not replay unrelated steps, and never
  silently queue a consequential action while offline.

## 4. Loading preserves orientation

- Keep existing content visible during a partial refresh; replace only the affected
  region. Clearing the screen to show a spinner destroys context and causes reflow.
- Use a skeleton only when the final structure is known. Otherwise show honest progress
  in the region that is actually loading.
- Reserve image dimensions and keep stable row identity so the layout does not jump
  when data arrives.
- Keep the user's scroll position across a refresh unless the content genuinely changed
  length.

## 5. Checklist

- [ ] Each screen is a page, modal, or overlay for a stated reason, not by accident
- [ ] One-way doors replace history; Back cannot re-enter a completed flow
- [ ] Back is intercepted only for in-flight irreversible work or unsaved modal work
- [ ] Re-selecting the active tab returns to its root
- [ ] Cold start resolves session state before rendering
- [ ] Every record has one owner; no parallel cache
- [ ] Pending actions ignore double activation
- [ ] Out-of-order responses cannot overwrite newer state
- [ ] Partial refreshes keep content and scroll position
