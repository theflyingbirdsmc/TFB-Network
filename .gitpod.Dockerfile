# You can find the new timestamped tags here: https://hub.docker.com/r/gitpod/workspace-full/tags
FROM gitpod/workspace-java-17

# Install custom tools, runtime, etc.
RUN sudo apt-get update && sudo apt-get -y upgrade