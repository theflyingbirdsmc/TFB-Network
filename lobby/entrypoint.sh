#!/bin/sh
echo "starting ssh as root"
gosu root service ssh start &
#gosu root /usr/sbin/sshd -D &

# Run the original command (Minecraft server in this case)
java -Xms128M -Xmx4096M -jar server.jar nogui