FROM openjdk:15-jdk-alpine
LABEL maintainer="urehman.bese16seecs@seecs.edu.pk"
VOLUME /tmp
EXPOSE 5200
ARG JAR_FILE=target/rest-api-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} service.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dspring.profiles.active=dev","-jar","/service.jar"]
