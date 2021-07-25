#!/bin/bash
declare -a deployments=("api-gateway" "audit" "config" "country" "currency-conversion" "currency-exchange" "discovery" "math" "user" "fe" "elasticsearch" "logstash" "kibana" "rabbit-mq" "zipkin" "auth-db" "auth-server" "app-db")
for deployment in "${deployments[@]}"
do
  kubectl delete -n default deployment "$deployment"
done