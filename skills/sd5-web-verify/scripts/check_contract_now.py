#!/usr/bin/env python3
"""Portable equivalent of check-contract.ps1 for maintenance environments."""
from __future__ import annotations

import argparse
import re
from pathlib import Path


def modules_from(project: Path) -> set[str]:
    text = project.read_text(encoding="utf-8", errors="replace")
    names = set()
    for match in re.finditer(r"^Module\d+=(.+)$", text, re.MULTILINE):
        value = match.group(1).strip()
        if value.startswith("|"):
            value = re.sub(r"^\|[^|]*\|", "", value)
        name = value.replace("\\", "/").rstrip("/").split("/")[-1]
        name = re.sub(r"\.[^.]+$", "", name)
        if name:
            names.add(name)
    return names


def main() -> int:
    repo = Path(__file__).resolve().parents[3]
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--framework-project", type=Path,
                        default=repo.parent / "0SithasoDaisy5" / "SithasoDaisy5.b4j")
    parser.add_argument("--skill-folder", type=Path, default=repo / "skills" / "sithasodaisy5")
    args = parser.parse_args()
    if not args.framework_project.is_file() or not args.skill_folder.is_dir():
        parser.error("framework project and skill folder must exist")

    registered = modules_from(args.framework_project)
    docs = {p.stem for p in (args.skill_folder / "components").glob("*.md")}
    missing = sorted(registered - docs)
    extra = sorted(docs - registered)
    ui = {n for n in registered if n.startswith("SDUI5")}
    print(f"Registered modules: {len(registered)} ({len(ui)} UI, {len(registered-ui)} support)")
    print(f"Top-level component docs: {len(docs)}")
    print(f"Missing: {len(missing)} | Extra: {len(extra)}")
    if missing:
        print("Missing docs:", ", ".join(missing))
    if extra:
        print("Extra docs:", ", ".join(extra))
    if missing or extra:
        return 1
    print("PASS — normalized registry and docs match")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
