import os
from ruamel.yaml import YAML

yaml = YAML()
live_values = os.environ.get('LIVE_VALUES')
print("live values: ", live_values)

# with open('/home/runner/work/TFB-Network/TFB-Network/.github/workflows/scripts/live_values.yml') as f:
#     live_values = yaml.load(f)


for value in live_values:
    if value.startswith("TFB-"):
        with open('/home/runner/work/TFB-Network/TFB-Network/' + value) as f:
            yamlFileFromDev = yaml.load(f)
        for elem in yamlFileFromDev:
            print(str(elem), str(live_values[value]))
            if elem == live_values[value]:
                print("FOUND IT!")
                # yaml.dump(yamlFileFromDev)
                break

# name = 'getvalues_result'
# with open(os.environ['GITHUB_OUTPUT'], 'a') as fh:
#     print(f'{name}={yamlFileFromDev}', file=fh)


# Save the updated dictionary to the YAML file
# with open("data.yaml", "w") as file:
#   yaml.dump(data, file)



# import ruamel.yaml

# yaml = ruamel.yaml.YAML()
# yaml.preserve_quotes = True

# live_values = os.environ.get('LIVE_VALUES')
# print("live values: ", live_values)

# with open('/home/runner/work/TFB-Network/TFB-Network/.github/workflows/scripts/live_values.yml') as f:
#     live_values = yaml.load(f)

# output = {}

# for value in live_values:
#     if value.startswith("TFB-"):
#         with open('/home/runner/work/TFB-Network/TFB-Network/' + value) as f:
#             yamlFileFromDev = yaml.load(f)
#         for elem in yamlFileFromDev:
#             print(str(elem), str(live_values[value]))
#             if elem == value:
#                 print("FOUND IT!")
#                 # yaml.dump(yamlFileFromDev)
#                 break

