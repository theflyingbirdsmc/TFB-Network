FROM openjdk:17-slim
LABEL author="Lucas Christensen & Simon Fugl"

# Copy server files to a tfb folder
COPY . /tfb/

# Define build arguments
# ARG MAVEN_URL
# ARG MAVEN_USERNAME
# ARG MAVEN_PASSWORD

# # Set environment variables using build arguments
# ENV MAVEN_URL=${MAVEN_URL}
# ENV MAVEN_USERNAME=${MAVEN_USERNAME}
# ENV MAVEN_PASSWORD=${MAVEN_PASSWORD}

# RUN ls -a && pwd
# RUN apt-get update; \
#     apt-get -y install default-jdk wget unzip

# #install Gradle
# WORKDIR /opt/gradle
# RUN wget -q https://services.gradle.org/distributions/gradle-7.3-bin.zip \
#     && unzip gradle-7.3-bin.zip \
#     && rm gradle-7.3-bin.zip

# # Set Gradle in the environment variables
# ENV PATH="/opt/gradle/gradle-7.3/bin:${PATH}"
WORKDIR /tfb
# RUN gradle server && gradle plugins
RUN chmod +x *.jar
CMD  ["java","-Xms128M","-Xmx1024M", "-jar", "server.jar", "nogui"]