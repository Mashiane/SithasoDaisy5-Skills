#!/usr/bin/env python3
"""Revert the 7 partial citations from the first (narrow-regex) run.

Remove the 'Verified Demo' line + 2 blank lines that were inserted.
"""
import re
from pathlib import Path

skill = Path(r'C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5\components')

n = 0
for md_file in skill.glob('*.md'):
    text = md_file.read_text(encoding='utf-8', errors='replace')
    # The citation line + 2 blank lines (one before, one after)
    pattern = re.compile(r'\n\n\*\*Verified Demo\*\*[^\n]*\n\n', re.MULTILINE)
    new_text, count = pattern.subn('\n', text, count=1)
    if count > 0:
        md_file.write_text(new_text, encoding='utf-8')
        n += 1
print(f'Reverted {n} files')