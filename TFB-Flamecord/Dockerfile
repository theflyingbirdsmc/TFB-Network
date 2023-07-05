FROM openjdk:17-slim
LABEL author="Lucas Christensen & Simon Fugl"

# Copy server files to a tfb folder
COPY . /tfb/

WORKDIR /tfb

RUN chmod +x *
CMD  ["java","-Xms128M","-Xmx1024M", "-jar", "server.jar", "nogui"]