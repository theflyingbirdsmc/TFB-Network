import os
import yaml
from yaml.resolver import Resolver
import re

file_path = os.environ['FILE_PATHS'].split(" ")
print(file_path)

# remove resolver entries for True/False
# for ch in "TtFf":
#     if len(Resolver.yaml_implicit_resolvers[ch]) == 1:
#         del Resolver.yaml_implicit_resolvers[ch]
#     else:
#         Resolver.yaml_implicit_resolvers[ch] = [x for x in
#                 Resolver.yaml_implicit_resolvers[ch] if x[0] != 'tag:yaml.org,2002:bool']

with open('/home/runner/work/TFB-Network/TFB-Network/.github/workflows/scripts/live_values.yml') as f:
    live_values = yaml.load(f, Loader=yaml.BaseLoader)

# print("live values: ", live_values)
output = {}
result = {}
name = 'getvalues_result'

for file in file_path:
    if file in live_values:
        with open('/home/runner/work/TFB-Network/TFB-Network/' + file, 'r') as f:
            yamlFileFromLive = yaml.load(f, Loader=yaml.BaseLoader)
            print(yamlFileFromLive)
        result[live_values[file]] = yamlFileFromLive[live_values[file]]
        output[file] = result
        result= {}

with open(os.environ['GITHUB_OUTPUT'], 'a') as fh:
    print(f'{name}={output}', file=fh)
