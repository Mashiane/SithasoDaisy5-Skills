---
name: visual-evidence
description: Optional machine-checkable receipt for SithasoDaisy5 visual verification. Records the scope, source hashes, inspected states, capture artifacts and unresolved checks so a visual pass is auditable instead of asserted.
---

# Visual Evidence Receipt

A screenshot proves a file exists. It does not prove which source produced it, which
state it shows, or whether anyone looked at it. This receipt records that context in one
small JSON file that can be checked mechanically.

It is **optional and advisory**. The authoritative visual gate remains
[ux-review.md](../../sd5-web-orchestrator/references/ux-review.md). A validated receipt
establishes integrity only: it does not judge taste, prove a person inspected the pixels,
or replace the scored review.

## What to record

Write one receipt per change scope beside its captures, for example
`ux-review/visual-evidence.json`. Keep it out of public app assets.

| Field | Content |
|---|---|
| `schemaVersion` | `sithaso.visual-evidence.v1` |
| `scope` | The change being verified, in one line |
| `platform` | `web` (this suite), or `ios` / `android` when relevant |
| `sources` | Affected `.bas`, style and asset files with SHA-256 of the bytes used for the final render |
| `comparison` | `existing-system`, or `target` with the target image and its path/hash |
| `requiredChecks` | The checks you decided on before the final pass |
| `checks` | Each check's status, state, environment, observation, and artifacts |
| `unresolved` | Every check that is blocked or failing, with the reason |

## Rules

1. **Hashes come from real files.** Compute them with the host's tools; never write a
   plausible-looking value.
2. **Name the states before the final pass.** Primary path, affected empty/loading/
   error/recovery states, the reported failing viewport, and relevant zoom or theme
   settings. A check you never declared is coverage you do not have.
3. **A blocked check stays blocked.** Keep it in `unresolved` with the reason. Removing
   it to obtain a pass is falsifying evidence.
4. **A still cannot prove motion.** A `motion` check needs a recorded video and the
   interaction steps. Compare the key states in motion.
5. **Interaction checks need steps and an image.** Assigning state directly is not
   exercising a control.
6. **Later edits invalidate affected checks.** Re-render, re-inspect, then update the
   hashes. Changing a hash alone is not revalidation.
7. **Invalid captures are not evidence.** Blank, half-loaded, wrong-screen, or
   wrong-size captures must be recaptured, not recorded as findings.

## Validate

```sh
python skills/sd5-web-verify/scripts/verify_visual_evidence.py ux-review/visual-evidence.json
```

Exit codes:

| Code | Meaning |
|---|---|
| 0 | Receipt valid, every required check passed |
| 1 | Receipt valid, but blocked or failing checks remain (gate not passed) |
| 2 | Bad arguments or unreadable receipt |
| 3 | Integrity failure: missing artifact, stale hash, or malformed receipt |

If Python is unavailable, keep the same receipt shape and inspect the links manually.
Report that integrity validation did not run. Do not claim a complete visual pass while
required evidence is blocked or missing.
