import os
import ruamel.yaml
from io import StringIO
import json
from datetime import datetime

yaml = ruamel.yaml.YAML()
yaml.preserve_quotes = False
yaml.indent(mapping=2, sequence=2, offset=0)

root_path = "/home/runner/work/TFB-Network/TFB-Network/"
# root_path = "/home/container/TFB/" # Use in container
# root_path = "E:/The Flying Birds/TFB-Dev/TFB-Network/"  # Use locally

now = datetime.now()
# dd/mm/YY H:M:S
dt_string = now.strftime("%d/%m/%Y %H:%M:%S")

log = open('./transformlog.txt', "w+")
log.write(dt_string + " - If any files have been edited they will be shown here\n")

with open(root_path + '.github/workflows/scripts/livevalues.yml') as f:
    live_values = yaml.load(f) or {} # If livevalues.yml returns none we want empty directory instead

for file_path, file_data in live_values.items():
    # Load the file using the YAML class
    keys = list(file_data.keys())
    print("FILE PATHS: " + str(file_path))
    print("FILE KEY: " + str(keys[0]))
    print("FILE DATA: " + str(file_data.get(keys[0])))

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
        log.write("UPDATED THE FILE: " + str(file_path) + " WITH THE DATA: " + str(config_data) + "\n")
