import os
import ruamel.yaml
import json

file_path = os.environ['FILE_PATHS'].split(" ")
print(file_path)

with open('/home/runner/work/TFB-Network/TFB-Network/.github/workflows/scripts/live_values.yml') as fp:
    live_values = ruamel.yaml.safe_load(fp)

print("live values: ", live_values)
output = {}
result = {}
name = 'getvalues_result'

for file in file_path:
    if file in live_values:
        with open('/home/runner/work/TFB-Network/TFB-Network/' + file) as fp:
            yamlFileFromLive = ruamel.yaml.round_trip_load(fp)
            print(type(yamlFileFromLive))
        result[live_values[file]] = yamlFileFromLive[live_values[file]]
        output[file] = result
        result = {}

finalResult = ruamel.yaml.round_trip_dump(output)
with open(os.environ['GITHUB_OUTPUT'], 'a') as fh:
    print(f'{name}={output}', file=fh)
