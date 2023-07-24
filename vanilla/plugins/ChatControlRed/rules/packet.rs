# ----------------------------------------------------------------------------------------------
# This file applies to all messages sent from the server to the player. That way, you can
# filter ANY message, including those from other plugins or the server itself.
#
# There are limitations to this, such as all hover/click events will get removed if you 
# want to change the message.
#
# *Important* This file EXCLUDES global rules and it is highly recommended not to import them
# due to server crashes and players being kicked out/crashed. Packets are dangerous territory.
#
# You need ProtocolLib to use packet rules.
#
# For help, see the header in the global.rs file.
# -----------------------------------------------------------------------------------------------

# Hide unknown command message.
#match ^Unknown command.*
#then deny
#dont verbose

# Rewrite message from Bukkit or Essentials.
match ^I'm sorry, but you do not have permission to perform this.*|^You do not have access to that command.
then rewrite &cInsufficient permission.
#then rewritein hardcore &cThis command is not accessible in {world} world.
dont verbose

# Troll users accessing /version command
# You can use the $ + group number as a variable that will be replaced by the matching group
match (git-Paper-)(.*)(Implementing API version .*)
then replace JesusSpigot-$2 (Implementing API version 1.19-R0.1-EXPERIMENTAL-SNAPSHOT)
dont verbose

# Replace the /plugins message.
match ^Plugins \(([0-9]+)\): (.*)$
then replace &2There are &6$1 &2plugins: &7$2
dont verbose
