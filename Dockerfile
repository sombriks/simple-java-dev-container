FROM docker.io/library/adoptopenjdk:11-jdk-openj9
EXPOSE 8080
WORKDIR /app
VOLUME /app
ADD README.md src .gitignore pom.xml .mvn mvnw /app/
ENTRYPOINT /app/mvnw install ; /bin/sh
# podman build -t simple-java-dev-image:latest .
