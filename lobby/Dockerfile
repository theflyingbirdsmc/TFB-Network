FROM eclipse-temurin:17-jre-focal

LABEL author="Lucas Christensen & Simon Fugl"

COPY . /tfb/
WORKDIR /tfb

EXPOSE 25565

RUN chmod +x *.jar
CMD  ["java", "-Xms128M", "-Xmx2048M", "-jar", "server.jar", "nogui"]