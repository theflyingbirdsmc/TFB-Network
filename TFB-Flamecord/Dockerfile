FROM openjdk:17-slim

RUN sudo apt-get gradle
COPY * /

RUN gradle server && gradle plugins

CMD  ["java","-Xms128M","-Xmx1024M", "-jar", "server.jar", "nogui"]