FROM eclipse-temurin:17.0.14_7-jre-focal
LABEL author="Lucas Christensen & Simon Fugl"

COPY . /tfb/
WORKDIR /tfb

ARG MEMORY
ENV MEMORY=$MEMORY

EXPOSE 25565

RUN chmod +x *.jar
CMD  ["java", "-Xms128M", "-Xmx8196M", "-jar", "server.jar", "nogui"]