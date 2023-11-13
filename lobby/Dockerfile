FROM eclipse-temurin:17.0.9_9-jre-focal
LABEL author="Lucas Christensen & Simon Fugl"

COPY . /tfb/
WORKDIR /tfb

RUN touch /tfb/plugins/StreamingDrops/data/user.yml && ln -sf /tfb/plugins/StreamingDrops/user.yml /tfb/plugins/StreamingDrops/data/user.yml

ARG STREAMINGDROPS_DISCORD_WEBHOOK
ENV STREAMINGDROPS_DISCORD_WEBHOOK=$STREAMINGDROPS_DISCORD_WEBHOOK

ARG MEMORY
ENV MEMORY=$MEMORY

EXPOSE 25565

RUN chmod +x *.jar
CMD  ["java", "-Xms128M", "-Xmx4096M", "-jar", "server.jar", "nogui"]