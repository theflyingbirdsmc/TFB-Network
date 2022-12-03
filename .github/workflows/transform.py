import os
import ruamel.yaml

file_path = os.environ['FILE_PATH']
yaml = ruamel.yaml.YAML()
yaml.preserve_quotes = True

with open('/home/runner/work/TFB-Network/TFB-Network/.github/workflows/scripts/live_values.yml') as fp:
    live_values = yaml.load(fp)
print(live_values)
for element in live_values:
  if file_path in element:
    print(element[0]) 
    print(element[0][0])
