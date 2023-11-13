#!/bin/sh

# Create the symlink after the command finishes
ln -sf /tfb/plugins/StreamingDrops/user.yml /tfb/plugins/StreamingDrops/data/user.yml

# Run the original command (Minecraft server in this case)
java -Xms128M -Xmx4096M -jar server.jar nogui