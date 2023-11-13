#!/bin/sh
cp /tfb/plugins/StreamingDrops/data/user.yml /tfb/plugins/StreamingDrops/user.yml
# Create the symlink after the command finishes
ln -hf /tfb/plugins/StreamingDrops/user.yml /tfb/plugins/StreamingDrops/data/user.yml

# Run the original command (Minecraft server in this case)
java -Xms128M -Xmx4096M -jar server.jar nogui