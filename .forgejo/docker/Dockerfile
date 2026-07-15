FROM code.forgejo.org/forgejo/runner:12.13

RUN apk update && \
    apk add --yes \
    openjdk-25-jdk \
    ca-certificates \
    curl && \
    curl -fsSL https://get.docker.com -o get-docker.sh && \
    sh get-docker.sh

WORKDIR /opt/gradle
RUN wget -q https://services.gradle.org/distributions/gradle-9.6.1-bin.zip \
    && unzip gradle-9.6.1-bin.zip \
    && rm gradle-9.6.1-bin.zip

ENV PATH="/opt/gradle/gradle-9.6.1/bin:${PATH}"