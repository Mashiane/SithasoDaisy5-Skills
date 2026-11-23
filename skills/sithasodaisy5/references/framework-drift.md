# Framework Drift and Provenance Refresh

The framework moves after the skill snapshot. Drift is normal; stale docs are not. Detect it, classify it,
refresh from source, and block affected screens until the refresh lands.

## What drift looks like

- Registry modules exceed documented components.
- A component source checksum no longer matches `component-provenance.json`.
- A documented member (property, event, setter, getter, method) was removed or renamed.
- A component was added to `SithasoDaisy5.b4j` but has no `components/<Name>.md`.
- A demo page cited by a component no longer demonstrates the claimed usage.

## Detect

- Run `tools/verify-dist.ps1 -CheckFramework` for module parity and source hashes.
- Run `skills/sd5-web-verify/scripts/check-contract.ps1` for 1:1 registry-to-doc coverage.
- Compare the current member lists with [component-provenance.json](component-provenance.json).
- Read [component-manifest.md](component-manifest.md) for demonstrated versus documented-only status.

## Classify

| Change | Effect | Action |
|---|---|---|
| Module added | Contract gap | Extract the component, write its doc, refresh manifest |
| Member removed | Screen may break | Mark affected screens stale; block G2 until fixed |
| Member renamed | Silent break | Update the doc and the app call sites |
| Behavior changed | Same signature, new result | Re-read source and demo; record the deviation |
| Demo changed | Evidence moved | Re-link or drop the demo citation |

## Refresh procedure

1. Re-extract with the `sd5-book-to-skill` Mode 4 flow against the current framework source.
2. Regenerate the manifest and provenance with the shipped maintenance scripts.
3. Diff member lists, not just checksums. Confirm additions and removals against source.
4. Update affected component docs from source; never hand-edit generated tables.
5. Record an ADR for any behavioral change or accepted gap.
6. Re-run the contract, provenance, doc-structure, and conformance gates.
7. Remove the waiver only after the contract is 1:1 with no missing docs.

## Rules

- Do not delete a component doc, or add a registry waiver, to make the contract pass.
- A checksum mismatch means the doc is `stale`; it does not mean the old member list is still correct.
- Unregistered source notes stay in `components/_unused/` and are not callable from app code.
- A framework gap blocks G2 for affected screens until a dated decision accepts the risk.
- The release gate is 1:1 module coverage with zero checksum or source mismatches.

## See also

- [rules-enforcer.md](rules-enforcer.md)
- [component-manifest.md](component-manifest.md)
- [component-provenance.json](component-provenance.json)
- `tools/verify-dist.ps1 -CheckFramework`
- `skills/sd5-web-verify/scripts/generate_provenance.py`

## Attribution

Extends the provenance rules in the Engineering Constitution, Article VI, with the deprecation and
migration discipline adapted from Addy Osmani's `deprecation-and-migration` skill (MIT).
