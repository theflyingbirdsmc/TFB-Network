FROM eclipse-temurin:17.0.9_9-jre-focal
LABEL author="Lucas Christensen & Simon Fugl"

# SSH
RUN apt-get update && apt-get -y install openssh-server
RUN mkdir -p /var/run/sshd

# authorize SSH connection with root account
# RUN sed -i '/^#/!s/PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config
# RUN service ssh restart
# Create a user named "tfb"
RUN useradd -m -s /bin/bash tfb

# change password root
RUN echo "tfb:TFB123" | chpasswd

# Set the working directory
WORKDIR /tfb

# Copy files to the /tfb directory
COPY . /tfb/

# Set environment variables
ARG STREAMINGDROPS_DISCORD_WEBHOOK
ENV STREAMINGDROPS_DISCORD_WEBHOOK=$STREAMINGDROPS_DISCORD_WEBHOOK

# Expose the Minecraft and ssh server port
EXPOSE 25565
EXPOSE 22

# Give execute permission to JAR files
RUN chmod +x *.jar

# Use an entrypoint script
# COPY entrypoint.sh /tfb/
# RUN chmod +x /tfb/entrypoint.sh

# ENTRYPOINT ["/tfb/entrypoint.sh"]
CMD  ["java", "-Xms128M", "-Xmx8196M", "-jar", "server.jar", "nogui"]