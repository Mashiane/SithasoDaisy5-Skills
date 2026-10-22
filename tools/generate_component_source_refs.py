#!/usr/bin/env python3
"""Add framework and demo source links to SithasoDaisy5 component skills.

The skill files remain self-contained for code examples. These links point to
the read-only upstream implementation and B4J demo pages for further context.
"""
from __future__ import annotations

import argparse
import re
from pathlib import Path
from urllib.parse import quote


REPO_URL = "https://github.com/Mashiane/SithasoDaisy5"
FRAMEWORK_REPO_PATH = "03. Source Code/SithasoDaisy5"
DEMO_REPO_PATH = "03. Source Code/SithasoDaisy5DemoCode/B4J"
START = "<!-- GENERATED_SOURCE_REFERENCES_START -->"
END = "<!-- GENERATED_SOURCE_REFERENCES_END -->"
TYPE_RE = re.compile(r"\b(?:As|New)\s+([A-Za-z][A-Za-z0-9_]*)\b", re.IGNORECASE)


def github_file(path: str) -> str:
    return f"{REPO_URL}/blob/main/{quote(path, safe='/')}"


def main() -> int:
    repo = Path(__file__).resolve().parents[1]
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--framework-dir", type=Path, default=repo.parent / "0SithasoDaisy5")
    parser.add_argument("--demo-dir", type=Path, default=repo.parent / "0SithasoDaisy5DemoCode" / "B4J")
    parser.add_argument("--skill-dir", type=Path, default=repo / "skills" / "sithasodaisy5")
    parser.add_argument("--check", action="store_true", help="check generated links without writing files")
    args = parser.parse_args()

    for path in (args.framework_dir, args.demo_dir, args.skill_dir / "components"):
        if not path.exists():
            raise SystemExit(f"Required path does not exist: {path}")

    docs = sorted((args.skill_dir / "components").glob("*.md"), key=lambda p: p.stem.casefold())
    source_by_name = {p.stem.casefold(): p for p in args.framework_dir.glob("*.bas")}
    missing = [p.stem for p in docs if p.stem.casefold() not in source_by_name]
    if missing:
        raise SystemExit("No local framework source for component skills: " + ", ".join(missing))

    type_names = {p.stem.casefold(): p.stem for p in docs}
    demo_refs: dict[str, set[str]] = {name: set() for name in type_names}
    pages = sorted(args.demo_dir.glob("pg*.bas"), key=lambda p: p.name.casefold())
    for page in pages:
        text = page.read_text(encoding="utf-8", errors="replace")
        for match in TYPE_RE.finditer(text):
            key = match.group(1).casefold()
            if key in demo_refs:
                demo_refs[key].add(page.name)

    changed: list[Path] = []
    no_demo: list[str] = []
    for path in docs:
        key = path.stem.casefold()
        source_name = source_by_name[key].name
        source_url = github_file(f"{FRAMEWORK_REPO_PATH}/{source_name}")
        refs = sorted(demo_refs[key], key=str.casefold)
        if refs:
            demo_lines = [
                "- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:",
                *[
                    f"  - [`{name}`]({github_file(f'{DEMO_REPO_PATH}/{name}')})"
                    for name in refs
                ],
            ]
        else:
            no_demo.append(path.stem)
            demo_lines = [
                "- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot."
            ]

        block = "\n".join(
            [
                START,
                "## Source References",
                "",
                f"- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`{source_name}`]({source_url})",
                *demo_lines,
                END,
            ]
        )

        text = path.read_text(encoding="utf-8")
        if START in text and END in text:
            before, rest = text.split(START, 1)
            _, after = rest.split(END, 1)
            text = before.rstrip() + "\n\n" + block + after
        else:
            lines = text.splitlines(keepends=True)
            title_index = next((i for i, line in enumerate(lines) if line.startswith("# ")), None)
            if title_index is None:
                raise SystemExit(f"Component skill has no leading H1 title: {path}")
            insertion = title_index + 1
            lines[insertion:insertion] = ["\n", block, "\n"]
            text = "".join(lines)

        # Older skill revisions linked to the right file names under an obsolete
        # repository path. Correct those inline citations as well.
        old_prefixes = (
            f"{REPO_URL}/blob/main/SithasoDaisy5Demo/B4J/",
            f"{REPO_URL}/blob/main/{quote('03. Source Code/SithasoDaisy5Demo/B4J', safe='/')}/",
        )
        new_prefix = f"{REPO_URL}/blob/main/{quote(DEMO_REPO_PATH, safe='/')}/"
        for old_prefix in old_prefixes:
            text = text.replace(old_prefix, new_prefix)

        if args.check:
            original = path.read_text(encoding="utf-8")
            if text != original:
                changed.append(path)
        else:
            if text != path.read_text(encoding="utf-8"):
                path.write_text(text, encoding="utf-8")
                changed.append(path)

    if args.check and changed:
        print("Source-reference blocks need regeneration in:")
        for path in changed:
            print(f"- {path.relative_to(repo)}")
        return 1

    print(
        f"Component source references: {len(docs)} skill files; "
        f"{sum(bool(v) for v in demo_refs.values())} with type-detected demo pages; "
        f"{len(no_demo)} without a direct demo type reference; "
        f"{len(changed)} {'out of date' if args.check else 'updated'}."
    )
    if no_demo:
        print("No direct demo type reference: " + ", ".join(no_demo))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
