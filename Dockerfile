ARG BASE_IMAGE=eclipse-temurin:17.0.14_7-jre-focal
FROM ${BASE_IMAGE}

LABEL author="Lucas Christensen & Simon Fugl"

WORKDIR /tfb
EXPOSE 25565

RUN chmod +x *.jar
CMD  ["java", "-Xms128M", "-Xmx2048M", "-jar", "server.jar", "nogui"]