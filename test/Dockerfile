# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java
# Minimum Panel Version: 0.6.0
# ----------------------------------
#
# Copyright (c) 2021 Matthew Penner
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
FROM 		--platform=$TARGETOS/$TARGETARCH openjdk:17-slim

LABEL       author="Simon Fugl" maintainer="fuglenbusiness@gmail.com"
LABEL 		org.opencontainers.image.source="https://github.com/theflyingbirdsmc/pluGET"

RUN 		apt-get update -y \
 			&& apt-get install -y curl ca-certificates python3 python3-pip nano python3-venv openssl openssh-client openssh-server git tar sqlite3 fontconfig libfreetype6 tzdata iproute2 libstdc++6 \
 			&& useradd -d /home/container -m container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

#RUN mkdir /home/container/plugins
COPY --chown=container . /home/container

# Install Redcraft Plugin Updater
# RUN cd /home/container/
# RUN git clone https://github.com/redcraft-org/redcraft_plugins_updater.git
# COPY --chown=container ./test redcraft_plugins_updater/test
# RUN cd /home/container/redcraft_plugins_updater \
# && pip3 install virtualenv \
# && pip3 install python-dotenv \
# && rm .env.example \
# && mv ./test .env \
# && rm test_plugins.json
# COPY --chown=container ./test_plugins.json redcraft_plugins_updater/test_plugins.json
# RUN cd /home/container/redcraft_plugins_updater/
# RUN python3 -m venv env
# RUN . env/bin/activate
# RUN pip3 install -r /home/container/redcraft_plugins_updater/requirements.txt

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
ENTRYPOINT  ["java","-Xms128M","-Xmx512M","-XX:+UseG1GC", "-XX:+ParallelRefProcEnabled", "-XX:MaxGCPauseMillis=200", "-XX:+UnlockExperimentalVMOptions", "-XX:+DisableExplicitGC", "-XX:+AlwaysPreTouch", "-XX:G1NewSizePercent=30", "-XX:G1MaxNewSizePercent=40", "-XX:G1HeapRegionSize=8M", "-XX:G1ReservePercent=20", "-XX:G1HeapWastePercent=5", "-XX:G1MixedGCCountTarget=4", "-XX:InitiatingHeapOccupancyPercent=15", "-XX:G1MixedGCLiveThresholdPercent=90", "-XX:G1RSetUpdatingPauseTimePercent=5", "-XX:SurvivorRatio=32", "-XX:+PerfDisableSharedMem", "-XX:MaxTenuringThreshold=1", "-Dusing.aikars.flags=https://mcflags.emc.gs", "-Daikars.new.flags=true", "-Dterminal.jline=false -Dterminal.ansi=true", "-jar", "FlameCord.jar", "nogui"]
