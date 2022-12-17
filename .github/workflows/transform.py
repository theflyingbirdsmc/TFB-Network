import os
import ruamel.yaml
from collections import OrderedDict
import json

yaml = ruamel.yaml.YAML()
yaml.preserve_quotes = False
decoder = json.JSONDecoder(object_pairs_hook=collections.OrderedDict)

# root_path = "/home/runner/work/TFB-Network/TFB-Network/"
root_path = "E:/The Flying Birds/TFB-Dev/TFB-Network/"
# string_input_data = os.environ.get('LIVE_VALUES')
# input_data = decoder.decode(string_input_data)  # type: ignore
input_data = OrderedDict([('TFB-Creative/plugins/Plan/config.yml', OrderedDict([('Database', ordereddict([('Type', 'SQLite'), ('MySQL', ordereddict([('Host', 'localhost'), ('Port', 3306), ('User', 'root'), ('Password', 'minecraft'), ('Database', 'Plan'), ('Launch_options', '?rewriteBatchedStatements=true&useSSL=false&serverTimezone=UTC'), ('Max_connections', 8)]))]))])), ('TFB-Flamecord/config.yml', {'servers': ordereddict([('crowdcontrol', ordereddict([('address', '172.18.0.1:25606'), ('motd', ''), ('restricted', False)])), ('factions', ordereddict([('address', '172.18.0.1:25603'), ('motd', ''), ('restricted', False)])), ('kitpvp', ordereddict([('address', '172.18.0.1:25607'), ('motd', ''), ('restricted', False)])), ('lobby', ordereddict([('address', '172.18.0.1:25600'), ('motd', ''), ('restricted', False)])), ('museum', ordereddict([('address', '172.18.0.1:25605'), ('motd', ''), ('restricted', False)])), ('parkour', ordereddict([('address', '172.18.0.1:25604'), ('motd', ''), ('restricted', False)])), ('vanilladk', ordereddict([('address', '172.18.0.1:25700'), ('motd', ''), ('restricted', False)]))])})])
print("live values: ", type(input_data))

# with open('/home/runner/work/TFB-Network/TFB-Network/.github/workflows/scripts/live_values.yml') as f:
#     live_values = yaml.load(f)

for file_path, file_data in input_data.items():
    # Load the file using the YAML class
    keys = list(file_data.keys())
    print("FILE PATHS: " + str(file_path))
    print("FILE KEY: " + str(keys[0]))
    print("FILE DATA: " + str(file_data.get(keys[0])))
    # yaml = YAML()
    with open(root_path + file_path, "r") as file:
        config_data = yaml.load(file)
    print("LOCAL: " + str(config_data))

    # Loop through the keys in the input data for the current file
    for key, value in file_data.items():
        # Check if the key is "Database"
        if key in keys:
            print("FOUND " + key + " WITH VALUE " + str(value))
            #  Replace the values in the file with the values from the input data
            config_data[key] = value

    # # Save the updated file
    with open(root_path + file_path, "w") as file:
        yaml.dump(config_data, file)

# name = 'getvalues_result'
# with open(os.environ['GITHUB_OUTPUT'], 'a') as fh:
#     print(f'{name}={output}', file=fh)