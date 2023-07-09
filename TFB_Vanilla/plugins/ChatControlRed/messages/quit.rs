# ---------------------------------------------------------------------------------
# Quit messages. Uses the same syntax as files in rules/ folder but operators
# are slightly different. For documentation and a quick tutorial, see:
# https://github.com/kangarko/ChatControl-Red/wiki/messages
#
# Rules in this file are read from top to bottom. Set 'Stop_On_First_Match' 
# key in settings.yml only send the first message we can, to the player (based on
# operator conditions).
# ---------------------------------------------------------------------------------

group default
message:
- &7{player} &fhas quit the game
