import os
import ruamel.yaml

file_path = os.environ['FILE_PATH']
yaml = ruamel.yaml.YAML()
yaml.preserve_quotes = True

with open('./scripts/live_values.yml') as fp:
    live_values = yaml.load(fp)

for element in live_values:
  if file_path in element:
    print(element)


print("File path:", file_path)
