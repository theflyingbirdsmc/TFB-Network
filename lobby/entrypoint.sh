#!/bin/sh

# Create the symlink after the command finishes
ln -s /external-folder/user.yml /tfb/plugins/StreamingDrops/user.yml

# Run the original command (Minecraft server in this case)
java -Xms128M -Xmx4096M -jar server.jar nogui