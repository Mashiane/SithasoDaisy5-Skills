#!/usr/bin/env python3
"""Regenerate skills-registry.json from skills/*/SKILL.md frontmatter.

Preserves authority/category/depends/recommends/risk/status/platforms from the
existing registry; refreshes name/description/keywords(entry triggers)/version.
Usage: python tools/sync-skills-registry.py [--root .] [--check]
--check exits 1 on any diff (CI gate); otherwise rewrites the file.
"""
from __future__ import annotations
import argparse
import json
import re
import sys
from pathlib import Path

FM = re.compile(r"^---\s*\n(.*?)\n---", re.DOTALL)


def frontmatter(path: Path) -> dict:
    m = FM.match(path.read_text(encoding="utf-8-sig"))
    if not m:
        return {}
    out: dict = {}
    key, buf = None, []
    for line in m.group(1).splitlines():
        if re.match(r"^[A-Za-z_][\w-]*:", line) and not line.startswith(" "):
            if key:
                out[key] = "\n".join(buf).strip()
            key, _, val = line.partition(":")
            buf = [val.strip()]
        elif key:
            buf.append(line)
    if key:
        out[key] = "\n".join(buf).strip()
    for k in ("metadata",):
        out.pop(k, None)
    return out


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--root", default=".", type=Path)
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    root = args.root.resolve()
    plugin = json.loads((root / "plugin.json").read_text(encoding="utf-8-sig"))
    reg_path = root / "skills-registry.json"
    reg = json.loads(reg_path.read_text(encoding="utf-8-sig"))
    by_id = {s["id"]: s for s in reg["skills"]}
    changed = []
    for skill_dir in sorted((root / "skills").iterdir()):
        sk = skill_dir / "SKILL.md"
        if not skill_dir.is_dir() or not sk.is_file():
            continue
        fm = frontmatter(sk)
        entry = by_id.get(skill_dir.name, {})
        new = dict(entry)
        new["id"] = skill_dir.name
        new["name"] = skill_dir.name
        new["entry"] = f"skills/{skill_dir.name}/SKILL.md"
        new["version"] = plugin["version"]
        if fm.get("description"):
            new["description"] = fm["description"].replace("\n", " ")
        trig = re.search(r"triggers:\s*(.+)", fm.get("metadata", "") + "\n" + json.dumps(fm))
        if trig:
            kws = [k.strip() for k in trig.group(1).split(",")][:12]
            if kws:
                new["keywords"] = kws
        if new != entry:
            changed.append(skill_dir.name)
        by_id[skill_dir.name] = new
    reg["skills"] = [by_id[k] for k in sorted(by_id)]
    if args.check:
        if changed:
            print(f"registry stale for: {', '.join(changed)}")
            return 1
        print(f"registry in sync ({len(by_id)} skills)")
        return 0
    reg_path.write_text(json.dumps(reg, indent=2), encoding="utf-8")
    print(f"registry synced: {len(by_id)} skills" + (f" (updated: {', '.join(changed)})" if changed else " (no changes)"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
