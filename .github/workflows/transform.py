import os
import yaml

file_path = os.environ['FILE_PATHS'].split(" ")
print(file_path)

with open('/home/runner/work/TFB-Network/TFB-Network/.github/workflows/scripts/live_values.yml') as f:
    live_values = yaml.load(f, Loader=yaml.FullLoader)

print("live values: ", live_values)
output = {}

for file in file_path:
    if file in live_values:
        with open('/home/runner/work/TFB-Network/TFB-Network/' + file, 'r') as f:
            yamlFileFromLive = yaml.unsafe_load(f)
        output[file] = yamlFileFromLive[live_values[file]]
        print(output)
        # for value in live_values[file_path]
