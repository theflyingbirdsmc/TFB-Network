import os
import yaml
import json

file_path = os.environ['FILE_PATHS'].split(" ")
print(file_path)

with open('/home/runner/work/TFB-Network/TFB-Network/.github/workflows/scripts/live_values.yml') as f:
    live_values = yaml.load(f, Loader=yaml.FullLoader)

print("live values: ", live_values)
output = {}
name = 'getvalues_result'

for file in file_path:
    if file in live_values:
        with open('/home/runner/work/TFB-Network/TFB-Network/' + file, 'r') as f:
            yamlFileFromLive = yaml.unsafe_load(f)
        output[file] = yamlFileFromLive[live_values[file]]

json_object = {
   "TFB-Creative/plugins/Plan/config.yml":{
      "Type":"SQLite",
      "MySQL":{
         "Host":"localhost",
         "Port":3306,
         "User":"root",
         "Password":"minecraft",
         "Database":"Plan",
         "Launch_options":"?rewriteBatchedStatements=true&useSSL=false&serverTimezone=UTC",
         "Max_connections":8
      }
   },
   "TFB-Flamecord/config.yml":{
      "crowdcontrol":{
         "address":"3333333333.18.0.1:25606",
         "motd":"",
         "restricted": false
      }
   }
}

with open(os.environ['GITHUB_OUTPUT'], 'a') as fh:
    print(f'{name}={json_object}', file=fh)
