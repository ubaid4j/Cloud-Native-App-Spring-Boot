#!/bin/bash
declare -a microservices=("api-gateway" "audit" "config" "country" "currency-conversion" "currency-exchange" "discovery" "math" "user")
APP_VERSION=0.0.3-SNAPSHOT
for microservice in "${microservices[@]}"
do
  echo pulling ubaidurehman/"$microservice":$APP_VERSION
  docker pull ubaidurehman/"$microservice":$APP_VERSION
done