import os
import ruamel.yaml

yaml = ruamel.yaml.YAML()
yaml.preserve_quotes = True

live_values = os.environ.get('LIVE_VALUES')
print("live values: ", live_values)

with open('/home/runner/work/TFB-Network/TFB-Network/.github/workflows/scripts/live_values.yml') as f:
    live_values = yaml.load(f)

output = {}

for value in live_values:
    if value.startswith("TFB-"):
        with open('/home/runner/work/TFB-Network/TFB-Network/' + value) as f:
            yamlFileFromDev = yaml.load(f)
        for elem in yamlFileFromDev:
            print(str(elem), str(live_values[value]))
            if str(elem) == str(live_values[value]):
                print("FOUND IT!")
                yamlFileFromDev[elem] = live_values[value]
                # yaml.dump(yamlFileFromDev)
                break
        # Save the updated dictionary to the YAML file
        with open("/home/runner/work/TFB-Network/TFB-Network/" + value, "w") as file:
            yaml.dump(yamlFileFromDev, file)

name = 'getvalues_result'
with open(os.environ['GITHUB_OUTPUT'], 'a') as fh:
    print(f'{name}={output}', file=fh)


# Load the YAML file into a dictionary
with open("data.yaml", "r") as file:
  yaml = YAML()
  data = yaml.load(file)

# Define the dictionary to replace the keys
replacements = {
  "key1": {
    "subkey1": "value1",
    "subkey2": "value2"
  },
  "key2": {
    "subkey1": "value3",
    "subkey2": "value4"
  }
}

# Replace the keys in the dictionary with the dictionaries in the replacements
for key, value in replacements.items():
  data[key] = value

# Save the updated dictionary to the YAML file
with open("data.yaml", "w") as file:
  yaml.dump(data, file)