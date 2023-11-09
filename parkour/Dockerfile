FROM openjdk:21-slim
LABEL author="Lucas Christensen & Simon Fugl"

# Copy server files to a tfb folder
COPY . /tfb/

WORKDIR /tfb

RUN chmod +x *.jar
CMD  ["java", "-Xms128M", "-Xmx6144M", "-jar", "server.jar", "nogui"]