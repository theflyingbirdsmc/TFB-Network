# ---------------------------------------------------------------------------------
# Join messages. Uses the same syntax as files in rules/ folder but operators
# are slightly different. For documentation and a quick tutorial, see:
# https://github.com/kangarko/ChatControl-Red/wiki/messages
#
# Rules in this file are read from top to bottom. Set 'Stop_On_First_Match' 
# key in settings.yml only send the first message we can, to the player (based on
# operator conditions).
# ---------------------------------------------------------------------------------


# An example of First Join Message for 1.13+ versions. Uncomment the lines below if your server runs MC 1.13 or greater.
# Please make sure to keep your first join message at the top of the file, above any other join message to avoid any issues.
#group firstjoinmessage
#require sender script player.getStatistic(Java.type("org.bukkit.Statistic").PLAY_ONE_MINUTE) <= 1
#message: 
#- &7Welcome to the server &c{player} &7!

# An example of First Join Message for 1.7 to 1.12. Uncomment the lines below if your server runs MC 1.12 or older.
# Please make sure to keep your first join message at the top of the file, above any other join message to avoid any issues.
#group firstjoinmessage
#require sender script player.getStatistic(Java.type("org.bukkit.Statistic").PLAY_ONE_TICK) <= 1
#message: 
#- &7Welcome to the server &c{player} &7!

group default
message:
- &7{player} &fhas joined the game
