# Review Checklist (pre-merge)

Use this before merging any change, whether written by an agent or a human. It complements the
build, runtime, and visual gates; it does not replace them. Write the verdict to `.agent/REVIEW.md`.

## Five axes

| Axis | Questions |
|---|---|
| Correctness | Does it match the contract and acceptance checks? Are edge and error paths handled? |
| Readability | Can another engineer follow it without the author? Are names and control flow clear? |
| Architecture | Does it fit existing patterns? Any duplicate helper, feature logic in a shared module, or needless abstraction? |
| Security | Is untrusted input validated? Any secret, raw HTML, or unsafe output? See `security-hardening.md`. |
| Performance | Any new render-blocking asset, unbounded list, or layout shift? See `performance-budget.md`. |

## B4J/BANano checks

- Every `Sub Show` starts with `BANano.Await(app.ClearPageView)` and ends with `pgIndex.UpdateTitle`.
- Designer properties before `.Classes`; suffix-only size and elevation values (RULE-PROP-001/002).
- Component APIs exist in `components/<Name>.md`; manifest status is acceptable.
- Companion children mount into their designated parent (RULE-LAYOUT-005).
- No raw HTML, no `Raw*` properties, no capital `Set*` designer calls.
- No app-authored asset path without `./assets/` and an extension (RULE-ASSET-001).
- Framework and demo source are unchanged.

## Severity labels

| Prefix | Meaning | Action |
|---|---|---|
| `Critical:` | Blocks merge | Security, data loss, broken behavior |
| *(no prefix)* | Required | Fix before merge |
| `Optional:` / `Consider:` | Suggestion | Author decides |
| `Nit:` | Minor style | May ignore |
| `FYI` | Information | No action |

Lead with correctness and security. A structural problem outranks ten nits.

## Change sizing

| Changed lines | Guidance |
|---|---|
| ~100 | Good; reviewable in one sitting |
| ~300 | Acceptable for one logical change |
| ~1000 | Split it |

Separate refactoring from behavior changes. Review dependency upgrades one package at a time and read the
changelog; a lockfile bump is a behavior change you did not write.

## Verification story

The change must state what was run: static gates, build, runtime capture, visual review, regression.
Missing evidence is an open gate, not a pass. A screenshot is visual evidence, not build or runtime proof.

## Dead code and dependencies

- List newly unused code and ask before deleting it.
- Prefer the existing helper over a near-duplicate.
- No new dependency without a reason, size check, maintenance check, license check, and audit.

## Verdict

`APPROVE`, `REQUEST CHANGES`, or `BLOCKED`. A `Critical` or Required finding keeps the change open.
Record the verdict, findings, and evidence paths in `.agent/REVIEW.md`.

## See also

- [security-hardening.md](../../sd5-web-verify/references/security-hardening.md)
- [performance-budget.md](../../sd5-web-verify/references/performance-budget.md)
- [sd5-code-smells](../../sd5-code-smells/SKILL.md)

## Attribution

Adapted from Addy Osmani's `code-review-and-quality` skill (MIT, `addyosmani/agent-skills`),
rewritten for the B4J/BANano suite.
