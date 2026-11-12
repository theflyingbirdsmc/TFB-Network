FROM codercom/enterprise-base:ubuntu

# Install mariadb and jdk
RUN sudo apt-get update && \
    sudo apt-get install --yes \
    mariadb-server \
    openjdk-25-jdk

#install Gradle
WORKDIR /opt/gradle
RUN wget -q https://services.gradle.org/distributions/gradle-9.6.1-bin.zip \

    && unzip gradle-9.6.1-bin.zip \
    && rm gradle-9.6.1-bin.zip

# Set Gradle in the environment variables
ENV PATH="/opt/gradle/gradle-9.6.1/bin:${PATH}"
ARG TFB_REGISTRY_URL
ARG TFB_REGISTRY_USERNAME
ARG TFB_REGISTRY_TOKEN

ENV TFB_REGISTRY_URL=$TFB_REGISTRY_URL
ENV TFB_REGISTRY_USERNAME=$TFB_REGISTRY_USERNAME
ENV TFB_REGISTRY_TOKEN=$TFB_REGISTRY_TOKEN

