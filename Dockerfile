FROM docker.io/library/adoptopenjdk:11-jdk-openj9
EXPOSE 8080
WORKDIR /app
VOLUME /app
ADD README.md .gitignore pom.xml mvnw mvnw.cmd /app/
ADD .mvn /app/.mvn
ADD src /app/src
RUN /app/mvnw install
ENTRYPOINT /bin/sh
# podman build -t simple-java-dev-image:latest .
