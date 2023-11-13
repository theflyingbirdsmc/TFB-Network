FROM eclipse-temurin:17.0.9_9-jre-focal
LABEL author="Lucas Christensen & Simon Fugl"

# Install rsync
RUN apt-get update && apt-get install -y rsync

COPY . /tfb/
WORKDIR /tfb

RUN rsync -avu /tfb/plugins/StreamingDrops/user.yml /tfb_data/

ARG STREAMINGDROPS_DISCORD_WEBHOOK
ENV STREAMINGDROPS_DISCORD_WEBHOOK=$STREAMINGDROPS_DISCORD_WEBHOOK

ARG MEMORY
ENV MEMORY=$MEMORY

EXPOSE 25565

RUN chmod +x *.jar
CMD  ["java", "-Xms128M", "-Xmx4096M", "-jar", "server.jar", "nogui"]