import os
import ruamel.yaml

file_path = os.environ['FILE_PATH']
yaml = ruamel.yaml.YAML()
yaml.preserve_quotes = True

with open('./scripts/live_values.yml') as fp:
    live_values = yaml.load(fp)

for k,v in live_values:
  print("k:" + k + " v: " + v)

print("File path:", file_path)
