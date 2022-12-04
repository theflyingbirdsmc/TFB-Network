import os
import yaml
import json

file_path = os.environ['FILE_PATHS'].split(" ")
print(file_path)

with open('/home/runner/work/TFB-Network/TFB-Network/.github/workflows/scripts/live_values.yml') as f:
    live_values = yaml.load(f, Loader=yaml.FullLoader)

print("live values: ", live_values)
output = {}
name = 'getvalues_result'

for file in file_path:
    if file in live_values:
        with open('/home/runner/work/TFB-Network/TFB-Network/' + file, 'r') as f:
            yamlFileFromLive = yaml.unsafe_load(f)
        output[file] = yamlFileFromLive[live_values[file]]

json_object = json.dumps(output)

with open(os.environ['GITHUB_OUTPUT'], 'a') as fh:
    print(f'{name}={str(json_object)}', file=fh)
