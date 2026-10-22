#!/usr/bin/env python3
"""Generate skills/sithasodaisy5/references/component-provenance.json.

Level-3 truth (Constitution Art I/VI): per-component provenance derived only
from framework source + registry + demos. Generated, never hand-edited.
Re-run after a library bump (see sd5-book-to-skill Mode 4).

Usage:
  python generate_provenance.py --components-json <workdir>/components.json ^
    --framework-project C:/b4j/workspace/0SithasoDaisy5/SithasoDaisy5.b4j ^
    --demo-dir C:/b4j/workspace/0SithasoDaisy5DemoCode/B4J ^
    --out ../sithasodaisy5/references/component-provenance.json
"""
from __future__ import annotations
import argparse
import hashlib
import json
import re
from datetime import datetime, timezone
from pathlib import Path

MOD_RE = re.compile(r"^Module\d+\s*=\s*(.+)$", re.IGNORECASE)
USE_RE = re.compile(r"\b(?:As|New)\s+([A-Za-z_][A-Za-z0-9_]*)")


def normalize(mod: str) -> str:
    mod = mod.strip().strip('"')
    for sep in ("|", "\\", "/"):
        if sep in mod:
            mod = mod.split(sep)[-1]
    return mod


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--components-json", required=True, type=Path)
    ap.add_argument("--framework-project", required=True, type=Path)
    ap.add_argument("--demo-dir", required=True, type=Path)
    ap.add_argument("--out", required=True, type=Path)
    args = ap.parse_args()

    registered: list[str] = []
    for line in args.framework_project.read_text(encoding="utf-8-sig").splitlines():
        m = MOD_RE.match(line.strip())
        if m:
            registered.append(normalize(m.group(1)))
    reg_set = set(registered)
    reg_lower = {r.lower(): r for r in registered}

    demo_use: dict[str, list[str]] = {}
    demo_files = sorted(args.demo_dir.glob("*.bas")) if args.demo_dir.is_dir() else []
    for demo in demo_files:
        try:
            body = demo.read_text(encoding="utf-8-sig")
        except OSError:
            continue
        for name in set(USE_RE.findall(body)):
            demo_use.setdefault(name, []).append(demo.name)

    comps = json.loads(args.components_json.read_text(encoding="utf-8-sig"))
    out_comps: dict[str, dict] = {}
    for c in comps:
        name = c.get("name", "")
        src = Path(c.get("file", ""))
        sha = None
        if src.is_file():
            sha = hashlib.sha256(src.read_bytes()).hexdigest()
        kind = "ui" if name.startswith("SDUI5") else "support"
        reg_name = None
        if name in reg_set:
            reg_name = name
        elif name.lower() in reg_lower:
            reg_name = reg_lower[name.lower()]
        out_comps[name] = {
            "source-file": str(src),
            "sha256": sha,
            "source-lines": c.get("lines", 0),
            "registered": reg_name is not None,
            "registry-name": reg_name,
            "kind": kind,
            "name-case-differs": bool(reg_name and reg_name != name),
            "has-designer-create-view": bool(c.get("has_designer_create_view", False)),
            "init-sig": c.get("init_sig", ""),
            "counts": {
                "props": len(c.get("props", [])),
                "events": len(c.get("events", [])),
                "setters": len(c.get("setters", [])),
                "getters": len(c.get("getters", [])),
                "methods": len(c.get("methods", [])),
            },
            "props": [p if isinstance(p, str) else p.get("key", p.get("name", "")) for p in c.get("props", [])],
            "events": c.get("events", []),
            "setters": [s if isinstance(s, str) else s.get("name", "") for s in c.get("setters", [])],
            "getters": [g if isinstance(g, str) else g.get("name", "") for g in c.get("getters", [])],
            "designer-classes": c.get("designer_classes", []),
            "designer-colors": c.get("designer_colors", []),
            "designer-rounded": c.get("designer_rounded", []),
            "designer-shadows": c.get("designer_shadows", []),
            "doc": f"components/{name}.md",
            "demo-pages": sorted(demo_use.get(name, [])),
        }

    ui = sum(1 for n, v in out_comps.items() if v["kind"] == "ui" and v["registered"])
    doc_only = sorted(n for n, v in out_comps.items()
                      if v["kind"] == "ui" and v["registered"] and not v["demo-pages"])
    payload = {
        "generated": datetime.now(timezone.utc).strftime("%Y-%m-%d %H:%M UTC"),
        "method": "extraction (sd5-book-to-skill components.json) + sha256 of framework .bas + ModuleN registry + case-sensitive As|New type-reference grep over demo pg*.bas. B4J is case-insensitive: entries flagged name-case-differs are the same component as registry-name; their demo-pages may undercount when demos use registry casing. component-manifest.md remains the authority for demo-backed status; this file is the authority for source checksums and member lists.",
        "framework-project": str(args.framework_project),
        "registered-modules": len(reg_set),
        "ui-registered": ui,
        "documented-only-ui": doc_only,
        "components": out_comps,
    }
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(json.dumps(payload, indent=2), encoding="utf-8")
    print(f"provenance: {len(out_comps)} components, {len(reg_set)} registered, "
          f"{len(doc_only)} documented-only UI -> {args.out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
