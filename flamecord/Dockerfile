FROM eclipse-temurin:17.0.9_9-jre-focal
LABEL author="Lucas Christensen & Simon Fugl"

# Copy server files to a tfb folder
COPY . /tfb/

WORKDIR /tfb

ARG MEMORY
ENV MEMORY=$MEMORY

EXPOSE 25565

RUN chmod +x *.jar
CMD  ["java", "-Xms128M", "-Xmx2048M", "-jar", "server.jar", "nogui"]