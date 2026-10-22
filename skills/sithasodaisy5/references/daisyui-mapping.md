---
name: daisyui-mapping
description: How upstream daisyUI was studied and recreated as SithasoDaisy5 B4X wrappers. Name mapping, class-verification protocol with worked samples, and observations from upstream's own agent skills.
---

# daisyUI → SithasoDaisy5 mapping

Background (library author): the daisyUI framework was studied component by
component at https://daisyui.com, then each component was recreated as a B4X
class for BANano. Local study copies: `daisyui-master/` (extracted upstream
repo, git-ignored working material) and `daisyui-master.zip` (tracked
archive). Upstream skill: `daisyui-master/skills/daisyui/` (SKILL.md +
install/usage/config/colors/components guides).

## 1. Name mapping rule

`SDUI5<Name>` wraps `daisyui.com/components/<name>` (lowercase). Verified
examples: `SDUI5Button→button`, `SDUI5Card→card`, `SDUI5Modal→modal`,
`SDUI5Alert→alert`, `SDUI5Drawer→drawer`, `SDUI5Dock→dock`, `SDUI5Tabs→tabs`.
Exceptions are documented per component (e.g. composite components that mount
`card` styling inside `modal`). Case: source files keep native casing
(`SDUI5Megamenu.bas`); registry/docs use `MegaMenu` — identical in B4J.

## 2. Class-verification protocol

Every class in a component's `Emits` section must resolve to one of:

1. **Upstream taxonomy** for the wrapped component (`component/part/style/
   behavior/color/size/placement/direction/modifier` in
   `daisyui-master/skills/daisyui/components/<name>.md`).
2. **Owning-component classes** when composing (e.g. `join-item` from join,
   `dock-active` from dock used on button).
3. **daisyUI v5 tokens/utilities** (`rounded-box/field/selector`, semantic
   colors) and **Tailwind utilities** (layout, spacing, `!`-prefixed
   important overrides per v5 usage rules).
4. **Responsive variants** (`sm:/md:/lg:/xl:` prefixes of 1–3).

Anything else is an invented class — reject it. `crossref_daisyui.py`
checks this mechanically (currently pointed at the `C:\b4a\…` upstream copy;
the local `daisyui-master/` is an equivalent alternative).

## 3. Worked samples (checked 2026-10-11)

- **SDUI5Button → button**: `btn` + full color/style/behavior/size/modifier
  set matches upstream taxonomy exactly. Extras resolve: `join-item`,
  `dock-active` (rule 2), `rounded-field` (rule 3, v5 token), `inline-flex
  !items-center !justify-center text-center` (rule 3, Tailwind + `!` per
  upstream rule 3 of usage). PASS.
- **SDUI5Card → card**: `card/border/dash`, `image-full`, responsive
  `card-side` match upstream; `rounded-box`, `shrink` are utilities. PASS.
- **SDUI5Modal → modal**: `modal`, `modal-open` upstream; `card/border/dash`,
  `rounded-box`, `overflow-y-auto` are documented composition (modal body
  uses card styling). PASS with noted composition.

## 4. Upstream-skill observations (future study, not adopted)

- Upstream `SKILL.md` uses a **"references you must read" table**
  (task → guide, graded must/conditional) — stronger than our prose
  discovery pointers. Candidate improvement for `sithasodaisy5/SKILL.md`
  "How to Use" section.
- Upstream ships `find-bugs` and `pr-review` agent skills beside the
  component skill — precedent for splitting review out of the verify skill
  if ours grows.
- Upstream component files carry `Rules` + `Syntax` blocks with
  `{MODIFIER}` grammar — our `Emits` + `patterns.md` cover the same ground
  in B4J terms; no change needed.
