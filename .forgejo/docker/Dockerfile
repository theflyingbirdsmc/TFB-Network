FROM docker.io/library/node:lts

USER root

RUN apt-get update && \
    apt-get install --yes \
    openjdk-25-jdk \
    ca-certificates \
    curl

RUN curl -fsSL https://get.docker.com -o get-docker.sh && \
    sh get-docker.sh

WORKDIR /opt/gradle

RUN wget -q https://services.gradle.org/distributions/gradle-9.6.1-bin.zip \
    && unzip gradle-9.6.1-bin.zip \
    && rm gradle-9.6.1-bin.zip \
    
ENV PATH="/opt/gradle/gradle-9.6.1/bin:${PATH}"

USER 1000:1000

WORKDIR /data