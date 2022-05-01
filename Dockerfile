FROM docker.io/library/adoptopenjdk:11-jdk-openj9

ENV DB_URL=
ENV DB_USERNAME=
ENV DB_PASSWORD=

EXPOSE 8080
VOLUME /app
ADD init_app.sh /root
ADD starter /root/starter
WORKDIR /root/starter
RUN /root/starter/mvnw compile
WORKDIR /app
ENTRYPOINT /bin/sh /root/init_app.sh
# podman build -t simple-java-dev-image:latest .
