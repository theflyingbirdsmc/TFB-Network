yaml_file="/TFB-Flamecord/config.yml"
key="disabled_commands"
new_value="'- disabledcommandhere'"

sed -r "s/^(\s*${key}\s*:\s*).*/\1${new_value}/" -i "$yaml_file"