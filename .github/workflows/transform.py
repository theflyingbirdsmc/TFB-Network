import os
import ruamel.yaml

yaml = ruamel.yaml.YAML()
yaml.preserve_quotes = True

live_values = os.environ.get('LIVE_VALUES')
print("live values: ", live_values)

with open('/home/runner/work/TFB-Network/TFB-Network/.github/workflows/scripts/live_values.yml') as f:
    live_values = yaml.load(f, Loader=yaml.FullLoader)

output = {}

for key, value in live_values:
    if key.startswith("TFB-"):
        with open('/home/runner/work/TFB-Network/TFB-Network/' + key, 'r') as f:
            yamlFileFromDev = yaml.load(f)
        for elem in yamlFileFromDev:
            if elem == value:
                elem[value] = value[0]
                output = yaml.dump(yamlFileFromDev)
                yaml.dump(yamlFileFromDev)
                break 
name = 'getvalues_result'
with open(os.environ['GITHUB_OUTPUT'], 'a') as fh:
    print(f'{name}={output}', file=fh)
