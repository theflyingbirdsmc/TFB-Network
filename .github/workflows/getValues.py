import os
import ruamel.yaml as yaml
import json

file_path = os.environ['FILE_PATHS'].split(" ")
print(file_path)

with open('/home/runner/work/TFB-Network/TFB-Network/.github/workflows/scripts/live_values.yml') as fp:
    live_values = yaml.load(fp)

print("live values: ", live_values)
output = {}
result = {}
name = 'getvalues_result'

for file in file_path:
    if file in live_values:
        with open('/home/runner/work/TFB-Network/TFB-Network/') as fp:
            yamlFileFromLive = yaml.round_trip_load(fp)
        result[live_values[file]] = yamlFileFromLive[live_values[file]]
        output[file] = result
        result = {}

print("OUTPUT: " + str(output))
with open(os.environ['GITHUB_OUTPUT'], 'a') as fh:
    print(f'{name}={str(output)}', file=fh)
