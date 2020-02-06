FROM openjdk:13-alpine
LABEL maintainer="urehman.bese16seecs@seecs.edu.pk"
VOLUME /tmp
EXPOSE 8761
ARG JAR_FILE=target/netflix-eureka-naming-server-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} service.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","service.jar"]
