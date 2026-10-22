from pathlib import Path
sd5_dir = Path(r'C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5\components')
sd5_unused = Path(r'C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5\components\_unused')
for name in ['SDUI5TextBox', 'SDUI5Pagination', 'SDUI5TextArea', 'SDUI5Accordion', 'SDUI5FAB', 'SDUI5Fab']:
    in_main = (sd5_dir / f'{name}.md').exists()
    in_unused = (sd5_unused / f'{name}.md').exists()
    print(f'{name:30s} components/: {in_main}  _unused/: {in_unused}')