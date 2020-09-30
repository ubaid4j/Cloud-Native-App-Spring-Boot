FROM openjdk:15-jdk-alpine
LABEL maintainer="urehman.bese16seecs@seecs.edu.pk"
VOLUME /tmp
EXPOSE 8755
ARG JAR_FILE=target/netflix-zuul-api-gateway-server-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} apiGatewayServer.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dspring.profiles.active=dev","-jar","/apiGatewayServer.jar"]
