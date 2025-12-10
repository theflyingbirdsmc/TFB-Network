FROM eclipse-temurin:17.0.15_6-jre-focal
LABEL author="Lucas Christensen & Simon Fugl"

COPY . /tfb/
WORKDIR /tfb

# ARG MEMORY
# ENV MEMORY=$MEMORY

EXPOSE 25565

RUN chmod +x *.jar
CMD  ["java", "-Xms128M", "-Xmx8192M", "-jar", "server.jar", "nogui"]