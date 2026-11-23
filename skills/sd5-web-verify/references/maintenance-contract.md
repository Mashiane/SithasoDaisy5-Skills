# Maintenance Contract

Gate scripts stay in sync with `rules-enforcer.md` and `ux-master-doctrine.md`. When you:

- add a rule, update `rules-enforcer.md` and the relevant script check;
- add a NEG, update `negative-knowledge.md` and `pre-scan.ps1` when regex-detectable;
- add an ARCH pattern, update `page-architectures.md` and check for false positives;
- add a documented setter, update the `$docSettersLookup` allowlist in `pre-scan.ps1`;
- add or change a gate, update `Evidence.psm1` and both `run-pipeline.ps1` and `check-delivery.ps1`.

If a script is out of sync with the rules, fix the script; do not work around it.

## Which engine, when

- **Gate scripts** (pre-scan, verify-conformance, check-contract, capture-screens, build-banano-app,
  build-watch, production-hardening, check-delivery) are PowerShell. Invoke with
  `powershell.exe -NoProfile -ExecutionPolicy Bypass -File`; Windows PowerShell 5.1+ is sufficient.
  Exit codes 0/1/2.
- **Shipped Python utilities** (`generate_manifest.py`, `generate_provenance.py`,
  `generate_core_index.py`, `validate-contracts.py`, `verify_visual_evidence.py`,
  `component_sections.py`, `component_summary.py`) remain Python stdlib-only.
- **Dev-only book-to-skill scripts** (`extract.py`, `gen_components.py`, `analyze_css.py`,
  `refresh_registered_components.py`) are local maintenance tooling and are not published.
- **Local maintenance tooling** (`crossref_daisyui.py`, citation/case-drift/enrichment
  scripts) is dev-only and excluded from publish.
- **Dev-only one-offs** (`audit_*`, `case*`, `check_*now.py`, `debug_*`, `glob_test.py`,
  `test_specific.py`, `preview_table.py`, `list_*.py`, `find_missing_*`, `fix_case_drift_*`,
  `revert_*`, `reinject_*`) are working notes excluded from publish by the allowlist in
  `create-dist.ps1`; `verify-dist.ps1` fails if any other `.py` ships.
  Do not invoke them during delivery.
