import os
import ruamel.yaml
from collections import OrderedDict
from io import StringIO

yaml = ruamel.yaml.YAML()
yaml.preserve_quotes = False
file_path = os.environ['FILE_PATHS'].split(" ")
# file_path = ['.github/workflows/getValues.py', '.github/workflows/live.yml', '.github/workflows/transform.py', 'TFB-Creative/plugins/Plan/config.yml', 'TFB-Flamecord/config.yml']
print(file_path)

root_path = '/home/runner/work/TFB-Network/TFB-Network/'
# root_path = 'E:/The Flying Birds/TFB-Dev/TFB-Network/'

# remove resolver entries for True/False
# for ch in "TtFf":
#     if len(Resolver.yaml_implicit_resolvers[ch]) == 1:
#         del Resolver.yaml_implicit_resolvers[ch]
#     else:
#         Resolver.yaml_implicit_resolvers[ch] = [x for x in
#                 Resolver.yaml_implicit_resolvers[ch] if x[0] != 'tag:yaml.org,2002:bool']
with open(root_path + '.github/workflows/scripts/live_values.yml', "r") as file:
    live_values = yaml.load(file)

# print("live values: ", live_values)
output = OrderedDict()
result = OrderedDict()
name = 'getvalues_result'

for file in file_path:
    print('FILE PATH: ' + file)
    if file in live_values:
        with open(root_path + file, 'r') as f:
            yamlFileFromLive = yaml.load(f)
        result[live_values[file]] = yamlFileFromLive[live_values[file]]
        output[file] = result
        result= {}

# Use the StringIO class to create a file-like object in memory
yaml_str = StringIO()

# Use the ruamel.yaml.dump() function to generate a string representation of the object
yaml.dump(output, yaml_str)

# Print the contents of the StringIO object to the console
print(yaml_str.getvalue())

with open(os.environ['GITHUB_OUTPUT'], 'a') as fh:
    print(f'{name}={yaml_str}', file=fh)
