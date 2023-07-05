FROM openjdk:17-slim
LABEL author="Lucas Christensen & Simon Fugl"

# Copy server files to a tfb folder
COPY . /tfb/

WORKDIR /tfb

RUN chmod +x *.jar
CMD ["java", "-Xms$MIN_MEMORY", "-Xmx$MAX_MEMORY", "-jar", "server.jar", "nogui"]