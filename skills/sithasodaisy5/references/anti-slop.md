---
name: anti-slop
description: Bounded visual critique for SithasoDaisy5 screens. Use for audit, polish, or G6 triage. Caps findings at three, separates reviewing from fixing, and forbids redesign disguised as polish.
---

# Anti-Slop Review

One file for visual triage. Load this and nothing else from the design references
while triaging. Use [design-quality-playbook.md](design-quality-playbook.md) for the
Creative Brief and the 0-4 score, and
[ux-review.md](../../sd5-web-orchestrator/references/ux-review.md) for the scored
release gate. Do not load all three to answer "does this look right?".

The failure this file prevents is not ugly UI. It is critique that either says nothing
useful or tries to rebuild the screen. Both waste the revision budget.

## Pick one mode

| Mode | When | May edit? |
|---|---|---|
| **audit** | The user asks what is wrong, or asks for a review of work they own | No |
| **polish** | The user asks to refine or fix a screen that already exists | Yes, within existing scope |
| **review** | G6 inside the orchestrator, on freshly generated work | Yes, through the revision loop |
| **distill** | The screen works but carries excess | Yes, removal only |

State the mode in the first line of your response. If the user asked for an audit and
then asks for fixes, that is a second, separate request - do not silently continue into
editing.

## Hard rules

1. **At most three material findings.** Order by user impact. Everything else goes to a
   short "noted, not blocking" list or is dropped. A wall of findings is not rigor; it
   hides the one defect that matters.
2. **Evidence, then the smallest correction.** Each finding names what is observable in
   the rendered result (region, viewport, screenshot) and the narrowest change that
   resolves it. "Review the layout" is not a finding.
3. **Audit does not modify.** A review of existing work changes nothing unless the user
   also asked for the fix. Report, stop.
4. **Polish does not conceal a redesign.** Preserve the product's visual language,
   content, behavior, and scope. If the correct fix is a new art direction, say so and
   ask; do not deliver a redesign under a polish request.
5. **One coherent pass.** Fix related issues together. Leave regions that already work
   alone. No speculative cleanup and no opportunistic restyling.
6. **Do not present a style menu.** Do not offer "we could do brutalist or
   glassmorphic". Commit to one direction that serves the brief. The archetypes and
   exemplars in `design-craft-guide.md` are diagnostic lenses, not presets - use at most
   one, and only when it fits the product.
7. **Stop when it is coherent.** Do not add process, scoring ceremony, or extra passes
   once the requested surface works and holds together.

## Distill (subtractive pass)

When the screen works but carries excess, remove before adding.

- Remove repeated copy, duplicate actions, decorative noise, and containers that do not
  clarify grouping.
- Reduce unnecessary variation in color, type sizes, button styles, spacing, and
  surface treatments.
- Keep one obvious primary action and a small number of clearly subordinate ones.
- Use progressive disclosure for advanced or infrequent controls, but keep essential
  information visible.

Never remove any of the following to make a screen look calmer: required actions behind
hidden interactions, labels, focus states, accessibility semantics, error messages, or
recovery paths. Do not flatten genuinely complex information until it becomes harder to
understand. Prefer spacing and alignment over nested cards, and plain language over
explanatory copy.

Verify the simplified result still supports the whole task and its states at every
required viewport. If removal makes the task harder, it was not simplification.

## Calibration (default bans)

These are defaults, not absolutes. Override one only when the brand asks for it and you
can say why it fits this product.

- **One accent, locked.** One hue carries primary interaction on every screen.
  Neutrals carry the app; the accent is spent on action, active state, and progress.
- **One grey family.** Warm greys or cool greys, never both in one app.
- **Shape lock.** State the radius scale ("actions are pills, cards 16, inputs 8") and
  never violate it. Mixed radii without a stated rule read as assembled from parts.
- **One label per intent.** "Get started", "Start now", and "Begin" are one intent.
  Pick one phrasing and use it everywhere.
- **Emphasis stays in the family.** Emphasize a word with weight or italic of the same
  typeface. A serif word injected into a sans headline is noise, not interest.
- **Materials are not the default.** Glass belongs over content that must remain
  visible; a gradient needs a brand reason. Do not put glass on every card, a mesh
  gradient behind every hero, a purple-to-indigo glow on the primary action, confetti
  for a minor event, or sparkles in a heading. Those are the model's house style, not
  design.

## Mechanical pre-flight

Before a screen reaches the visual gate, count. A failed count is a fix, not a
judgment call.

| Count | Must be |
|---|---|
| distinct accent hues | 1 |
| corner radii outside the stated scale | 0 |
| emoji in UI chrome | 0 |
| gradients without a brand reason | 0 |
| phrasings for one intent | 1 |
| duplicate primary actions per viewport | 1 |

`SLOP-004` machine-checks repeated CTA labels. The rest are review-time counts; record
the numbers in the critique so they are not relitigated on the next pass.

## Defect shortlist

Check these before writing a finding. Escalate to the 0-4 score in
`design-quality-playbook.md` only when G6 requires it.

| Visible symptom | Likely cause | Smallest correction |
|---|---|---|
| Default-looking colored cards, no product character | Theme used as the whole art direction | Rewrite the visual thesis and surface strategy first; polish cards second |
| Large dead zones, content stranded at the top | Fixed heights, or one viewport reviewed | Content-led layout; compare desktop and phone captures |
| Horizontal scrollbar or clipped control | `w-screen`, nested widths, long content | Fix the owning container; verify zero page-level overflow at 390px |
| Tiny or unlabeled fields | Screenshot review skipped form affordances | Persistent labels, readable sizing, visible focus |
| Broken, irrelevant, or placeholder imagery | Asset path or purpose never verified in the render | Correct path, confirm a successful load, choose an image that serves the story |
| Polished palette that still reads as machine-made | Generic copy, no editorial rhythm, repeated modules | Replace filler content with product-specific copy and one signature detail |
| Motion that feels janky or unwanted | `transition-all`, or no reduced-motion guard | Composite-only transitions and `motion-safe:` guards (see `design-craft-guide.md` section 9) |

## Deterministic backstop

Judgment has a floor. `skills/sd5-web-verify/scripts/pre-scan.ps1` reports `SLOP-*`
findings for the machine-checkable subset: `transition-all`, motion utilities without a
`motion-safe:` guard, repeated CTA labels, placeholder image services, data-loading
modules with no `SDUI5Skeleton`, no curated font in `pgIndex.bas`, and no boundary
container. They are `WARN` by default; pass `-StrictSlop` to make them `FAIL` for a
release gate. Do not restate those findings as your own; cite the rule id.

## Not a replacement for

Accessibility review, security review, product validation, or project tests. A clean
anti-slop pass is a visual verdict, not a release decision.
