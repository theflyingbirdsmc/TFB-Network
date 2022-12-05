import os
import ruamel.yaml
import json

yaml = ruamel.yaml.YAML()
yaml.preserve_quotes = True

live_values = os.environ.get('LIVE_VALUES')
print(type(live_values))
print(live_values)

res = json.loads(live_values)
print(str(res))
# with open('/home/runner/work/TFB-Network/TFB-Network/.github/workflows/scripts/live_values.yml') as f:
#     live_values = yaml.load(f, Loader=yaml.FullLoader)

# print("live values: ", live_values)
# output = {}
# name = 'getvalues_result'

# for key, value in live_values:
#     if key.startswith("TFB-"):
#         with open('/home/runner/work/TFB-Network/TFB-Network/' + key, 'r') as f:
#             yamlFileFromDev = yaml.load(f)
#         if 

# with open(os.environ['GITHUB_OUTPUT'], 'a') as fh:
#     print(f'{name}={output}', file=fh)
