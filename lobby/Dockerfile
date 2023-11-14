FROM eclipse-temurin:17.0.9_9-jre-focal
LABEL author="Lucas Christensen & Simon Fugl"

# Set the working directory
WORKDIR /tfb

# Copy files to the /tfb directory
COPY . /tfb/

# Set environment variables
ARG STREAMINGDROPS_DISCORD_WEBHOOK
ENV STREAMINGDROPS_DISCORD_WEBHOOK=$STREAMINGDROPS_DISCORD_WEBHOOK

# Expose the Minecraft server port
EXPOSE 25565

# Give execute permission to JAR files
RUN chmod +x *.jar

# Use an entrypoint script
# COPY entrypoint.sh /tfb/
# RUN chmod +x /tfb/entrypoint.sh

# ENTRYPOINT ["/tfb/entrypoint.sh"]
CMD  ["java", "-Xms128M", "-Xmx8196M", "-jar", "server.jar", "nogui"]