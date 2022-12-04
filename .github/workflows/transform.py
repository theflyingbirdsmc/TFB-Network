import os
import yaml

file_path = os.environ['FILE_PATH']
print(file_path)

with open('/home/runner/work/TFB-Network/TFB-Network/.github/workflows/scripts/live_values.yml') as f:
    live_values = yaml.load(f, Loader=yaml.FullLoader)

print("live values: ", live_values)
if file_path in live_values:
    with open('/home/runner/work/TFB-Network/TFB-Network/' + file_path) as f:
        yamlFileFromLive = yaml.load(f, Loader=yaml.FullLoader)
    for value in live_values[file_path]:
        
    print(live_values[file_path][0])
