FROM codercom/enterprise-base:ubuntu

RUN sudo apt-get update && \
    sudo apt-get install --yes \
    mariadb-server \
    openjdk-21-jre

#install Gradle
WORKDIR /opt/gradle
RUN wget -q https://services.gradle.org/distributions/gradle-8.4-bin.zip \
    && unzip gradle-8.4-bin.zip \
    && rm gradle-8.4-bin.zip

# Set Gradle in the environment variables
ENV PATH="/opt/gradle/gradle-8.4/bin:${PATH}"
ARG MAVEN_URL
ARG MAVEN_USERNAME
ARG MAVEN_PASSWORD

ENV MAVEN_URL=$MAVEN_URL
ENV MAVEN_USERNAME=$MAVEN_USERNAME
ENV MAVEN_PASSWORD=$MAVEN_PASSWORD
