# -----------------------------------------------------------------------------------------------
# This file applies rules to item names when renamed on anvil
# and includes rules from global.rs.
#
# For help, see https://github.com/kangarko/ChatControl-Red/wiki/Rules
# -----------------------------------------------------------------------------------------------

@import global

# Prevent renaming items with names longer than the amount of matching letters, here 20.
# Note: Colors & are counted as 2 characters currently.
#match .{21,}
#then warn {prefix_error} Item names cannot be longer than 20 letters!
