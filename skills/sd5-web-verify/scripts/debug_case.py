import os
files = os.listdir(r'C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5\components')
print('Files matching SDUI5F*:', [f for f in files if f.startswith('SDUI5F')])
print('Files matching SDUI5T*:', [f for f in files if f.startswith('SDUI5T') and 'ext' in f.lower()])