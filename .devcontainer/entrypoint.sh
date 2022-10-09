#!/bin/sh
# entrypoint.sh
# PROJECT=papermc
#Install Python3.10
# cd /home/container
# wget https://www.python.org/ftp/python/3.10.5/Python-3.10.5.tar.xz
# ls -l
# tar -xf Python-3.10.5.tar.xz
# #apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev pkg-config make -y
# cd ./Python-3.10.5
# ./configure --enable-optimizations --enable-shared
# make -j 6
# make altinstall
# ldconfig /home/container/Python3.10.5
# python3.10 --version

# Install submodules
echo -e "Cloning down pluGET & FlameCord"
#echo -e $GITHUB_REPOSITORY
# git clone --recursive ${GITHUB_REPOSITORY} && git_dir="$(basename "$_" .git)"

cd /home/container/TFB

git config --global --add safe.directory /home/container/TFB # Seriously..?
git config --global core.filemode false # Ignore file permissions
git config --global core.autocrlf input # To make sure it works on Linux from Windows
git config --global user.email "$GITHUB_EMAIL"
git config --global user.name "$GITHUB_USERNAME"
git clone https://github.com/Neocky/pluGET.git pluGET
git clone https://github.com/2lstudios-mc/FlameCord.git FlameCord
rm -rf FlameCord/.git/ pluGET/.git/ # We only want the files not the repo.
git init
git remote add origin https://github.com/theflyingbirdsmc/TFB-Network.git


echo -e "installing pluGET requirements.."
#chown -R 777 ./pluGET
cd ./pluGET
chmod +x install_requirements_LINUX.sh
chmod +x pluget.py
echo "Installing Python packages and dependencies from requirements.txt... Please wait."
pip install -r requirements.txt
#python3 -m pip install --upgrade pip
#pip3 install -r requirements.txt
#./install_requirements_LINUX.sh
#python3 -m pip install -r requirements.txt
# cd /home/container/TFB

cd FlameCord/
chmod +x flamecord
# ./flamecord b
# mv ./FlameCord-Proxy/bootstrap/target/FlameCord.jar /home/container/TFB/server.jar
# elif [[ ! -f server.jar && -f "/home/container/TFB/paper.yml" ]]; then
# VER_EXISTS=`curl -s https://papermc.io/api/v2/projects/${PROJECT} | jq -r --arg VERSION $MINECRAFT_VERSION '.versions[] | contains($VERSION)' | grep true`
# 	LATEST_VERSION=`curl -s https://papermc.io/api/v2/projects/${PROJECT} | jq -r '.versions' | jq -r '.[-1]'`

# 	if [ "${VER_EXISTS}" == "true" ]; then
# 		echo -e "Version is valid. Using version ${MINECRAFT_VERSION}"
# 	else
# 		echo -e "Using the latest ${PROJECT} version"
# 		MINECRAFT_VERSION=${LATEST_VERSION}
# 	fi
	
# 	BUILD_EXISTS=`curl -s https://papermc.io/api/v2/projects/${PROJECT}/versions/${MINECRAFT_VERSION} | jq -r --arg BUILD ${BUILD_NUMBER} '.builds[] | tostring | contains($BUILD)' | grep true`
# 	LATEST_BUILD=`curl -s https://papermc.io/api/v2/projects/${PROJECT}/versions/${MINECRAFT_VERSION} | jq -r '.builds' | jq -r '.[-1]'`
	
# 	if [ "${BUILD_EXISTS}" == "true" ]; then
# 		echo -e "Build is valid for version ${MINECRAFT_VERSION}. Using build ${BUILD_NUMBER}"
# 	else
# 		echo -e "Using the latest ${PROJECT} build for version ${MINECRAFT_VERSION}"
# 		BUILD_NUMBER=${LATEST_BUILD}
# 	fi
	
# 	JAR_NAME=${PROJECT}-${MINECRAFT_VERSION}-${BUILD_NUMBER}.jar
	
# 	echo "Version being downloaded"
# 	echo -e "MC Version: ${MINECRAFT_VERSION}"
# 	echo -e "Build: ${BUILD_NUMBER}"
# 	echo -e "JAR Name of Build: ${JAR_NAME}"
# 	DOWNLOAD_URL=https://papermc.io/api/v2/projects/${PROJECT}/versions/${MINECRAFT_VERSION}/builds/${BUILD_NUMBER}/downloads/${JAR_NAME}
#     cd /home/container/TFB
#     echo -e "Running curl -o ${SERVER_JARFILE} ${DOWNLOAD_URL}"
#     curl -o ${SERVER_JARFILE} ${DOWNLOAD_URL}

cd /home/container/TFB
find /home/container/TFB/ -type f -iname "*.sh" -exec chmod +x {} \; # Make all .sh files executeable
#tmux new -s mysession -n console && tmux ls
#java -Xms128M -Xmx1024M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -Dterminal.jline=false -Dterminal.ansi=true -jar server.jar nogui
exec tail -f /dev/null