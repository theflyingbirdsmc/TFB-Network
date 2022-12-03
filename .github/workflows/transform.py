import os
import yaml

file_path = os.environ['FILE_PATH']

with open('/home/runner/work/TFB-Network/TFB-Network/.github/workflows/scripts/live_values.yml') as f:
    live_values = yaml.load_all(f, Loader=yaml.FullLoader)

print("live values: ", live_values)
for k, v in live_values:
    print(k, "->", v)
