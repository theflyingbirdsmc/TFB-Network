FROM ubuntu:24.04

RUN apt-get update \
	&& apt-get install -y \
	curl \
	git \
	sudo \
	vim \
	wget \
	zip \ 
	unzip \
	mariadb-server \
	openjdk-21-jre \
	&& rm -rf /var/lib/apt/lists/*

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

EXPOSE 25565
EXPOSE 30001

ARG USER=coder

RUN useradd --groups sudo --no-create-home --shell /bin/bash ${USER} \
	&& echo "${USER} ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/${USER} \
	&& chmod 0440 /etc/sudoers.d/${USER}
	
USER ${USER}
WORKDIR /home/${USER}