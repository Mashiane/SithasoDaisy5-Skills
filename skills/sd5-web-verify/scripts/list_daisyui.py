from pathlib import Path
d = Path(r'C:\b4a\workspace\0SithasoDaisyUIKit\daisyui-master\skills\daisyui\components')
daisyui = sorted([f.stem for f in d.glob('*.md')])
print(f'daisyUI components ({len(daisyui)}):')
for c in daisyui: print(f'  {c}')