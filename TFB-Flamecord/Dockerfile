FROM openjdk:17-slim

RUN sudo apt-get gradle
LABEL author="Lucas Christensen & Simon Fugl"
COPY * /

CMD  ["java","-Xms128M","-Xmx1024M", "-jar", "server.jar", "nogui"]