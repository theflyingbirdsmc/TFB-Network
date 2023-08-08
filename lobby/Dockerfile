FROM openjdk:17.0.2-slim
LABEL author="Lucas Christensen & Simon Fugl"

# Copy server files to a tfb folder
COPY . /tfb/

ARG STREAMINGDROPS_DISCORD_WEBHOOK
ENV STREAMINGDROPS_DISCORD_WEBHOOK=$STREAMINGDROPS_DISCORD_WEBHOOK

WORKDIR /tfb

RUN chmod +x *.jar
CMD  ["java","-Xms128M", "-Xmx4096M", "-jar", "server.jar", "nogui"]
