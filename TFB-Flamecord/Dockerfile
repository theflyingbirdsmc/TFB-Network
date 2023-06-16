FROM openjdk:17-slim

LABEL author="Lucas Christensen & Simon Fugl"

RUN apt-get update; \
    apt-get -y install default-jdk

#install Gradle
WORKDIR /opt/gradle
RUN wget -q https://services.gradle.org/distributions/gradle-7.3-bin.zip \
    && unzip gradle-7.3-bin.zip \
    && rm gradle-7.3-bin.zip

# Set Gradle in the environment variables
ENV PATH="/opt/gradle/gradle-7.3/bin:${PATH}"

RUN gradle server && gradle plugins

COPY * /

CMD  ["java","-Xms128M","-Xmx1024M", "-jar", "server.jar", "nogui"]