import os
import ruamel.yaml

live_values = os.environ['LIVE_VALUES']
print(type(live_values))
print(live_values)

# with open('/home/runner/work/TFB-Network/TFB-Network/.github/workflows/scripts/live_values.yml') as f:
#     live_values = yaml.load(f, Loader=yaml.FullLoader)

# print("live values: ", live_values)
# output = {}
# name = 'getvalues_result'

# for file in live_values:
#     if file in live_values:
#         with open('/home/runner/work/TFB-Network/TFB-Network/' + file, 'r') as f:
#             yamlFileFromLive = yaml.unsafe_load(f)
#         output[file] = yamlFileFromLive[live_values[file]]

# with open(os.environ['GITHUB_OUTPUT'], 'a') as fh:
#     print(f'{name}={output}', file=fh)
