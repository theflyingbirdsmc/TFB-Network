#
# This file manages rules applying for player tags: nick, prefix and suffix
#

@import global

# Prevent certain words being used as nicks.
#match Notch
#require tag nick
#then warn {prefix_error}This tag has been disallowed!
#then deny

# Prevent players writing variables to their tags.
match [({|%)]([^{}]+)[(}|%)]
then warn {prefix_error}You cannot use variables in your tag!
then deny
