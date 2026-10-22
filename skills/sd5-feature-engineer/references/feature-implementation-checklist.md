# Feature implementation checklist

## Before editing

- [ ] Requirement IDs and acceptance checks exist.
- [ ] Screen has exactly one owning feature and a primary task.
- [ ] Data source is explicit: static sample, local persistence, or verified API.
- [ ] Existing app conventions and known failing gates are recorded when applicable.
- [ ] Component candidates are registered and their call patterns are evidenced.

## During implementation

- [ ] Each module is wired in the `.b4j` project and counts match.
- [ ] `Show` borrows `pgIndex.App`, awaits `ClearPageView`, creates parents before children, and updates the title.
- [ ] Optional `UsesX` loader runs before its component.
- [ ] Component property/method names, types, and values match references/source.
- [ ] Static data is labeled as sample; no fake backend or credential assumptions.
- [ ] Loading/empty/error/offline states are implemented where data behavior requires them.
- [ ] Visual instructions map to sanctioned theme or style channels documented in `design-tokens.md`.
- [ ] Acceptance checks cite observable source or runtime evidence.

## Handoff

List changed files, requirement/feature IDs, tests and gates run, pass/fail evidence, and any unavailable build/browser/toolchain verification. Distinguish pre-existing failures from changes introduced by the feature.
