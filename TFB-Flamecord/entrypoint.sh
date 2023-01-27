apk update && apk add python3 py3-pip && pip3 install virtualenv

# Install pluGET
if [ ! -d pluGET ]; then
    echo -e "Cloning down pluGET"
    git clone https://github.com/theflyingbirdsmc/pluGET.git
fi

echo -e "installing pluGET requirements"
chown -R 777 ./pluGET
cd pluGET/
chmod +x launcher.sh
python3 -m pip install --upgrade pip
pip3 install -r requirements.txt
#python3 -m pip install -r requirements.txt

#java -Xms128M -Xmx512M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -Dterminal.jline=false -Dterminal.ansi=true -jar FlameCord.jar nogui
