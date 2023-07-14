FROM ubuntu:22.04

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
	openjdk-17-jre \
	&& rm -rf /var/lib/apt/lists/*

# Download the init.sql file from GitHub
# WORKDIR /docker-entrypoint-initdb.d
# RUN sudo wget https://raw.githubusercontent.com/theflyingbirdsmc/TFB-Network/dev/.devcontainer/init.sql
# RUN sudo chown -R mysql:mysql /docker-entrypoint-initdb.d && sudo chmod -R 700 /docker-entrypoint-initdb.d

#install Gradle
WORKDIR /opt/gradle
RUN wget -q https://services.gradle.org/distributions/gradle-7.3-bin.zip \
    && unzip gradle-7.3-bin.zip \
    && rm gradle-7.3-bin.zip

# Set Gradle in the environment variables
ENV PATH="/opt/gradle/gradle-7.3/bin:${PATH}"

ENV MAVEN_URL=$MAVEN_URL
ENV MAVEN_USERNAME=$MAVEN_USERNAME
ENV MAVEN_PASSWORD=$MAVEN_PASSWORD

EXPOSE 25565
# EXPOSE 3306

# RUN sudo service mariadb start && sudo mysql -u root < /docker-entrypoint-initdb.d/init.sql
ARG USER=coder
RUN useradd --groups sudo --no-create-home --shell /bin/bash ${USER} \
	&& echo "${USER} ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/${USER} \
	&& chmod 0440 /etc/sudoers.d/${USER}
USER ${USER}
WORKDIR /home/${USER}

COPY        ./entrypoint.sh /
ENTRYPOINT  ["/entrypoint.sh"]