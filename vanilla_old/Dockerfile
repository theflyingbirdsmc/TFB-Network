FROM openjdk:17.0.2-slim
LABEL author="Lucas Christensen & Simon Fugl"

# Copy server files to a tfb folder
COPY . /tfb/

WORKDIR /tfb

RUN chmod +x *.jar
CMD  ["java", "-XX:ParallelGCThreads=4", "-Xms128M", "-Xmx8192M", "-jar", "server.jar", "nogui"]