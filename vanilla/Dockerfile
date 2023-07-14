FROM openjdk:17.0.2-slim
LABEL author="Lucas Christensen & Simon Fugl"

# Copy server files to a tfb folder
COPY . /tfb/

WORKDIR /tfb

RUN chmod +x *.jar
CMD  ["java","-Xms128M","-Xmx1024M", "-jar", "server.jar", "nogui"]
#CMD ["sh", "-c", "while true; do sleep 1000; done"]
