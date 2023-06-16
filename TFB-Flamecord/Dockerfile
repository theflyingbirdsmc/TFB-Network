FROM openjdk:17-slim

LABEL author="Lucas Christensen & Simon Fugl"

RUN apt-get install gradle
COPY * /

CMD  ["java","-Xms128M","-Xmx1024M", "-jar", "server.jar", "nogui"]