#!/usr/bin/env python3
"""Validate basic G0 requirement/test, feature/screen and navigation traceability."""
from __future__ import annotations
import argparse
import re
from pathlib import Path

ID = re.compile(r"\b(?:REQ|CON|BR|ASM|OPEN|FEATURE|SCREEN|JRN|TEST|DATA)-\d{3,}\b")

def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--app-folder", required=True, type=Path)
    ap.add_argument("--write-index", action="store_true",
                    help="Write machine-readable contract/contract.index.json (G0 evidence).")
    args = ap.parse_args()
    root = args.app_folder.resolve()
    errors: list[str] = []
    required = [".agent/PLAN.md", ".agent/STATE.md", ".agent/DECISIONS.md",
                "contract/application.md", "contract/navigation.md",
                "contract/data-contract.md", "contract/business-rules.md",
                "contract/acceptance-tests.md"]
    for rel in required:
        if not (root / rel).is_file(): errors.append(f"Missing required artifact: {rel}")
    screens = list((root / "contract/screens").glob("*.md")) if (root / "contract/screens").exists() else []
    features = list((root / "contract/features").glob("*.md")) if (root / "contract/features").exists() else []
    if not screens: errors.append("No contract/screens/*.md definitions found")
    if not features: errors.append("No contract/features/*.md definitions found")
    texts: dict[str, str] = {}
    for path in [p for p in root.glob("contract/**/*.md") if p.is_file()]:
        texts[path.relative_to(root).as_posix()] = path.read_text(encoding="utf-8-sig")
    app = texts.get("contract/application.md", "")
    acceptance = texts.get("contract/acceptance-tests.md", "")
    nav = texts.get("contract/navigation.md", "")
    critical_reqs = set(re.findall(r"\bREQ-\d{3,}\b", app))
    tested_reqs = set(re.findall(r"\bREQ-\d{3,}\b", acceptance))
    for req in sorted(critical_reqs - tested_reqs): errors.append(f"Critical requirement has no acceptance-test reference: {req}")
    feature_ids = set()
    for p in features:
        body = p.read_text(encoding="utf-8-sig")
        found = re.findall(r"\bFEATURE-\d{3,}\b", body)
        feature_ids.update(found[:1])
        if not found: errors.append(f"Feature file has no FEATURE-* ID: {p.relative_to(root)}")
    for p in screens:
        body = p.read_text(encoding="utf-8-sig")
        sid = re.search(r"\bSCREEN-\d{3,}\b", body)
        owners = set(re.findall(r"\bFEATURE-\d{3,}\b", body))
        if not sid: errors.append(f"Screen file has no SCREEN-* ID: {p.relative_to(root)}")
        if len(owners) != 1: errors.append(f"Screen must name exactly one feature owner: {p.relative_to(root)}")
        elif owners.isdisjoint(feature_ids): errors.append(f"Screen owner has no feature definition: {p.relative_to(root)}")
    declared_screens = {m for p in screens for m in re.findall(r"\bSCREEN-\d{3,}\b", p.read_text(encoding="utf-8-sig"))}
    for sid in sorted(set(re.findall(r"\bSCREEN-\d{3,}\b", nav)) - declared_screens): errors.append(f"Navigation references undefined screen: {sid}")
    open_ids = set(re.findall(r"\bOPEN-\d{3,}\b", app))
    decisions_path = root / ".agent/DECISIONS.md"
    decisions = decisions_path.read_text(encoding="utf-8-sig") if decisions_path.is_file() else ""
    resolved = set(re.findall(r"\bOPEN-\d{3,}\b", decisions))
    for oid in sorted(open_ids - resolved): errors.append(f"Unresolved OPEN item in application contract: {oid}")
    if args.write_index:
        import datetime
        import json
        screens_idx = []
        for p in sorted(screens):
            body = p.read_text(encoding="utf-8-sig")
            sid = re.search(r"\bSCREEN-\d{3,}\b", body)
            owners = sorted(set(re.findall(r"\bFEATURE-\d{3,}\b", body)))
            comps = sorted(set(re.findall(r"\bSDUI5[A-Za-z0-9_]*\b", body)))
            screens_idx.append({"id": sid.group(0) if sid else None,
                                "file": p.relative_to(root).as_posix(),
                                "owner": owners[0] if len(owners) == 1 else owners,
                                "components": comps})
        index = {
            "generated": datetime.datetime.now(datetime.timezone.utc).strftime("%Y-%m-%d %H:%M UTC"),
            "status": "FAIL" if errors else "PASS",
            "requirements": [{"id": r, "tested": r in tested_reqs} for r in sorted(critical_reqs)],
            "features": [{"id": f, "file": p.relative_to(root).as_posix()}
                         for f, p in sorted(((re.findall(r"\bFEATURE-\d{3,}\b", p.read_text(encoding="utf-8-sig"))[:1] or [None])[0], p) for p in features)],
            "screens": screens_idx,
            "open-items": [{"id": o, "resolved": o in resolved} for o in sorted(open_ids)],
        }
        out = root / "contract/contract.index.json"
        out.parent.mkdir(parents=True, exist_ok=True)
        out.write_text(json.dumps(index, indent=2), encoding="utf-8")
        print(f"contract.index.json written: {out}")
    if errors:
        print("G0 CONTRACT: FAIL")
        for error in errors: print(f"- {error}")
        return 1
    print(f"G0 CONTRACT: PASS ({len(critical_reqs)} requirements, {len(features)} features, {len(screens)} screens)")
    return 0

if __name__ == "__main__": raise SystemExit(main())
