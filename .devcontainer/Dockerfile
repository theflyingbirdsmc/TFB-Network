FROM codercom/enterprise-base:ubuntu

# Install mariadb and jdk
RUN sudo apt-get update && \
    sudo apt-get install --yes \
    mariadb-server \
    openjdk-21-jre

#install Gradle
WORKDIR /opt/gradle
RUN wget -q https://services.gradle.org/distributions/gradle-9.6.1-bin.zip \

    && unzip gradle-9.6.1-bin.zip \
    && rm gradle-9.6.1-bin.zip

# Set Gradle in the environment variables
ENV PATH="/opt/gradle/gradle-9.6.1/bin:${PATH}"
ARG MAVEN_URL
ARG MAVEN_USERNAME
ARG MAVEN_PASSWORD

ENV MAVEN_URL=$MAVEN_URL
ENV MAVEN_USERNAME=$MAVEN_USERNAME
ENV MAVEN_PASSWORD=$MAVEN_PASSWORD

