import os
from ruamel.yaml import YAML

live_values = os.environ.get('LIVE_VALUES')
print("live values: ", live_values)

# with open('/home/runner/work/TFB-Network/TFB-Network/.github/workflows/scripts/live_values.yml') as f:
#     live_values = yaml.load(f)


for live_value in live_values:
    if live_value.startswith("TFB-"):

    # Load the YAML file into a dictionary
        with open('/home/runner/work/TFB-Network/TFB-Network/' + live_value, "r") as file:
            yamlFileFromDev = YAML()
    # Replace the keys in the dictionary with the dictionaries in the replacements
        for key, value in yamlFileFromDev.items():
            print("Key: " + str(key) + "value: " + str(value))
        # yamlFileFromDev[key] = value
    # with open("/home/runner/work/TFB-Network/TFB-Network/" + live_key, "w") as file:
    #     yaml.dump(yamlFileFromDev, file)

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
name = 'getvalues_result'
with open(os.environ['GITHUB_OUTPUT'], 'a') as fh:
    print(f'{name}={output}', file=fh)
