# -----------------------------------------------------------------------------------------------
# Welcome to the main rules configuration file
# -----------------------------------------------------------------------------------------------
#
# Rules are regular expressions tested against every message and, when matched, they can execute
# numerous operators you define.
#
# The rules/ folder contains files for all aspects of the game, with rules in the global file
# being applied for everything.
#
# We apply rules from top to bottom order.
#
# You can remove/edit everything in rules/ as you wish.
#
# -----------------------------------------------------------------------------------------------

# IP filter. 
match [0-9]{1,3}(\.|dot|\(dot\)|-|;|:|,|(\W|\d|_)*\s)+[0-9]{1,3}(\.|dot|\(dot\)|-|;|:|,|(\W|\d|_)*\s)+[0-9]{1,3}(\.|dot|\(dot\)|-|;|:|,|(\W|\d|_)*\s)+[0-9]{1,3}
name ip
# Remove the specified characters using regex (or replace them with dots) BEFORE the message is checked.
before replace dot|\[|\]|\{|\}|\(|\) with .
before replace [\(\[\]\)]|\s*
group advertisement

# Domain/URL filter.
match [a-zA-Z0-9\-\.]+\s?(\.|dot|\(dot\)|-|;|:|,)\s?(c(| +)o(| +)m|o(| +)r(| +)g|n(| +)e(| +)t|c(| +)z|(?<! )c(| +)o|u(| +)k|s(| +)k|b(| +)i(| +)z|m(| +)o(| +)b(| +)i|x(| +)x(| +)x|e(| +)u|(?<! )m(| +)e|i(| +)o)\b
# If you want to ignore your server, put it at the end of ignore string below like: minecraft.net|youtube.com|yourserver.com
ignore string minecraft.net|youtube.com|imgur.com
# You can also uncomment this operator to allow email addresses. Credit: http://emailregex.com/
#ignore string (?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])
name url
before replace dot|\[|\]|\{|\}|\(|\) with .
before replace [\(\[\]\)]
group advertisement

# Here is the previous version of the domain filter above which is easier to modify but does not block: t e s t . c o m, etc.
# You can add new domains to be blocked by inserting '|your_domain' after '|me' (e.g. '|me|io' for also blocking '.io' domains)
#match [a-zA-Z0-9\-\.]+\s?(\.|dot|\(dot\)|-|;|:|,)\s?(com|org|net|cz|co|uk|sk|biz|mobi|xxx|eu|me|io)\b

# -----------------------------------------------------------------------------------------------
# Anti spam
#
# Those filter are commented out by default, as they might cause unwanted catches.
# -----------------------------------------------------------------------------------------------

# Restrict one same character to max. two repeats
# example: aaaaaaaaaa to aa
#match (.)(?=\1\1+)
#then replace

# Restrict two same characters to max. two repeats
# example: hahahaha to haha
#match (..)(?=\1\1+)
#then replace

# Restrict three same characters to max. two repeats
# example: lollollol to lollol
#match (...)(?=\1\1+)
#then replace

# -----------------------------------------------------------------------------------------------
# Predefined swear & content filters are found below. Credits to owenmaple for contributing.
#
# [TIP] To match swear words with whitespace inside, like 'f u c k'
# add the following line under 'match (..)': before strip \s*
# -----------------------------------------------------------------------------------------------

# Swastika filter
match \u534D|\u5350
then kick &cDisallowed characters in the chat
then notify chatcontrol.notify.rulesalert &8[&7Swastika&8] &7{player}: &f{original_message}
then deny

# Bitch filter - commented out just to show you example of usage. It is filtered in more advanced way below.
#match \bb(i|!)tch
#name swear
#then warn &cWatch your language please.
# Line below requires warning points enabled in settings.yml
#then points swear 1
#then notify chatcontrol.notify.rulesalert &8[&7{rule_name}&8] &7{player}: &f{original_message}
#then replace fridge|bridge

# Blocks 'fuck'
match \b(f+(\W|\d|_)*u+(\W|\d|_)*c+(\W|\d|_)*k+(\W|\d|_)*)
group swear

# Blocks 'horny'
match \b(h+(\W|\d|_)*o+(\W|\d|_)*r+(\W|\d|_)*n+(\W|\d|_)*y+(\W|\d|_)*)
group swear

# Blocks 'hentai'
match \b(h+(\W|\d|_)*e+(\W|\d|_)*n+(\W|\d|_)*t+(\W|\d|_)*a+(\W|\d|_)*i+(\W|\d|_)*)
group swear

# Blocks 'slut'
match \b(s+(\W|\d|_)*l+(\W|\d|_)*u+(\W|\d|_)*t+(\W|\d|_)*)
group swear

# Blocks 'slag'
match \b(s+(\W|\d|_)*l+(\W|\d|_)*a+(\W|\d|_)*g+(\W|\d|_)*)
ignore string \blag
group swear

# Blocks 'boob'
match \b(b+(\W|\d|_)*o+(\W|\d|_)*o+(\W|\d|_)*b+(\W|\d|_)*)
group swear

# Blocks 'pussy'
match \b(p+(\W|\d|_)*u+(\W|\d|_)*s+(\W|\d|_)*s+(\W|\d|_)*y+(\W|\d|_)*)
group swear

# Blocks 'vagina'
match \b(v+(\W|\d|_)*a+(\W|\d|_)*g+(\W|\d|_)*i+(\W|\d|_)*n+(\W|\d|_)*a+(\W|\d|_)*)
group swear

# Blocks 'penis'
match \b(p+(\W|\d|_)*e+(\W|\d|_)*n+(\W|\d|_)*i+(\W|\d|_)*s+(\W|\d|_)*)
group swear

# Blocks 'bugger'
match \b(b+(\W|\d|_)*u+(\W|\d|_)*g+(\W|\d|_)*g+(\W|\d|_)*e+(\W|\d|_)*r+(\W|\d|_)*)
group swear

# Blocks 'bastard'
match \b(b+(\W|\d|_)*a+(\W|\d|_)*s+(\W|\d|_)*t+(\W|\d|_)*a+(\W|\d|_)*r+(\W|\d|_)*d+(\W|\d|_)*)
group swear

# Blocks 'cunt'
match \b(c+(\W|\d|_)*u+(\W|\d|_)*n+(\W|\d|_)*t+(\W|\d|_)*)
group swear

# Blocks 'jerk'
match \b(j+(\W|\d|_)*e+(\W|\d|_)*r+(\W|\d|_)*k+(\W|\d|_)*)
group swear

# Blocks 'anal'
match \b(a+(\W|\d|_)*n+(\W|\d|_)*a+(\W|\d|_)*l+(\W|\d|_)*)
ignore string analog|an all
group swear

# Blocks 'wanker'
match \b(w+(\W|\d|_)*a+(\W|\d|_)*n+(\W|\d|_)*k+(\W|\d|_)*e+(\W|\d|_)*r+(\W|\d|_)*)
group swear

# Blocks 'tosser'
match \b(t+(\W|\d|_)*o+(\W|\d|_)*s+(\W|\d|_)*s+(\W|\d|_)*e+(\W|\d|_)*r+(\W|\d|_)*)
group swear

# Blocks 'shit'
match \b(s+(\W|\d|_)*h+(\W|\d|_)*i+(\W|\d|_)*t+(\W|\d|_)*)
group swear

# Blocks 'rape'
match \b(r+(\W|\d|_)*a+(\W|\d|_)*p+(\W|\d|_)*e+(\W|\d|_)*)
group swear

# Blocks 'rapist'
match \b(r+(\W|\d|_)*a+(\W|\d|_)*p+(\W|\d|_)*i+(\W|\d|_)*s+(\W|\d|_)*t+(\W|\d|_)*)
group swear

# Blocks 'dick'
match \b(d+(\W|\d|_)*i+(\W|\d|_)*c+(\W|\d|_)*k+(\W|\d|_)*)
group swear

# Blocks 'cock'
match \b(c+(\W|\d|_)*o+(\W|\d|_)*c+(\W|\d|_)*k+(\W|\d|_)*)
group swear

# Blocks 'whore'
match \b(w+(\W|\d|_)*h+(\W|\d|_)*o+(\W|\d|_)*r+(\W|\d|_)*e+(\W|\d|_)*)
group swear

# Blocks 'bitch'
match \b(b+(\W|\d|_)*i+(\W|\d|_)*t+(\W|\d|_)*c+(\W|\d|_)*h+(\W|\d|_)*)
group swear

# Blocks 'asshole'
match \b(a+(\W|\d|_)*s+(\W|\d|_)*s+(\W|\d|_)*h+(\W|\d|_)*o+(\W|\d|_)*l+(\W|\d|_)*e+(\W|\d|_)*)
group swear

# Blocks 'twat'
match \b(t+(\W|\d|_)*w+(\W|\d|_)*a+(\W|\d|_)*t+(\W|\d|_)*)
group swear

# Blocks 'titt'
match \b(t+(\W|\d|_)*i+(\W|\d|_)*t+(\W|\d|_)*(t|s)+(\W|\d|_)*)
ignore string title
group swear

# Blocks 'piss'
match \b(p+(\W|\d|_)*i+(\W|\d|_)*s+(\W|\d|_)*s+(\W|\d|_)*)
group swear

# Blocks 'gay'
match \b(g+(\W|\d|_)*a+(\W|\d|_)*y+(\W|\d|_)*)
group swear

# Blocks 'lesbian'
match \b(l+(\W|\d|_)*e+(\W|\d|_)*s+(\W|\d|_)*b+(\W|\d|_)*i+(\W|\d|_)*a+(\W|\d|_)*n+(\W|\d|_)*)
group swear

# Blocks 'homo'
#match \b(h+(\W|\d|_)*o+(\W|\d|_)*m+(\W|\d|_)*o+(\W|\d|_)*)
#group swear

# Blocks 'homosexual'
match \b(h+(\W|\d|_)*o+(\W|\d|_)*m+(\W|\d|_)*o+(\W|\d|_)*s+(\W|\d|_)*e+(\W|\d|_)*x+(\W|\d|_)*u+(\W|\d|_)*a+(\W|\d|_)*l+(\W|\d|_)*)
group swear

# Blocks 'intercourse'
match \b(i+(\W|\d|_)*n+(\W|\d|_)*t+(\W|\d|_)*e+(\W|\d|_)*r+(\W|\d|_)*c+(\W|\d|_)*o+(\W|\d|_)*u+(\W|\d|_)*r+(\W|\d|_)*s+(\W|\d|_)*e+(\W|\d|_)*)
group swear

# Blocks 'cum'
#match \b(c+(\W|\d|_)*u+(\W|\d|_)*m+(\W|\d|_)*) 
#group swear

# Blocks 'sperm'
match \b(s+(\W|\d|_)*p+(\W|\d|_)*e+(\W|\d|_)*r+(\W|\d|_)*m+(\W|\d|_)*) 
group swear

# Blocks 'spunk'
match \b(s+(\W|\d|_)*p+(\W|\d|_)*u+(\W|\d|_)*n+(\W|\d|_)*k+(\W|\d|_)*) 
group swear

# Blocks 'testicle'
match \b(t+(\W|\d|_)*e+(\W|\d|_)*s+(\W|\d|_)*t+(\W|\d|_)*i+(\W|\d|_)*c+(\W|\d|_)*l+(\W|\d|_)*e+(\W|\d|_)*) 
group swear

# Blocks 'milf'
match \b(m+(\W|\d|_)*i+(\W|\d|_)*l+(\W|\d|_)*f+(\W|\d|_)*) 
group swear

# Blocks 'retard'
match \b(r+(\W|\d|_)*e+(\W|\d|_)*t+(\W|\d|_)*a+(\W|\d|_)*r+(\W|\d|_)*d+(\W|\d|_)*) 
group swear

# Blocks 'anus'
match \b(a+(\W|\d|_)*n+(\W|\d|_)*u+(\W|\d|_)*s+(\W|\d|_)*) 
group swear

# Blocks 'dafuq'
match \b(d+(\W|\d|_)*a+(\W|\d|_)*f+(\W|\d|_)*u+(\W|\d|_)*q+(\W|\d|_)*) 
group swear

#Blocks 'prick'
match \b(p+(\W|\d|_)*r+(\W|\d|_)*i+(\W|\d|_)*c+(\W|\d|_)*k+(\W|\d|_)*)
group swear

#Blocks 'douche'
match \b(d+(\W|\d|_)*o+(\W|\d|_)*u+(\W|\d|_)*c+(\W|\d|_)*h+(\W|\d|_)*e+(\W|\d|_)*)
group swear

# Blocks 'prostitute'
#match \b(p+(\W|\d|_)*r+(\W|\d|_)*o+(\W|\d|_)*s+(\W|\d|_)*t+(\W|\d|_)*i+(\W|\d|_)*t+(\W|\d|_)*u+(\W|\d|_)*t+(\W|\d|_)*e+(\W|\d|_)*) 
#group swear

# Blocks 'wtf'
#match \b(w+(\W|\d|_)*t+(\W|\d|_)*f+(\W|\d|_)*) 
#group swear

# Blocks 'ffs'
#match \b(f+(\W|\d|_)*f+(\W|\d|_)*s+(\W|\d|_)*) 
#group swear

# Blocks 'pedo'
#match \b(p+(\W|\d|_)*e+(\W|\d|_)*d+(\W|\d|_)*o+(\W|\d|_)*) 
#group swear
