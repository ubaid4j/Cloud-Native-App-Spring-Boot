#!/bin/bash
declare -a microservices=("api-gateway" "audit" "config" "country" "currency-conversion" "currency-exchange" "discovery" "math" "user")
APP_VERSION=0.0.3-SNAPSHOT
for microservice in "${microservices[@]}"
do
  echo buidling image of "$microservice"
  mvn spring-boot:build-image -DskipTests -f "$microservice"
  echo tagging "$microservice":$APP_VERSION to ubaidurehman/"$microservice":$APP_VERSION
  docker tag "$microservice":$APP_VERSION ubaidurehman/"$microservice":$APP_VERSION
done