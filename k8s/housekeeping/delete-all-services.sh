#!/bin/bash
declare -a deployments=("api-gateway" "audit" "config" "country" "currency-conversion" "currency-exchange" "discovery" "math" "user" "fe" "elasticsearch" "logstash" "kibana" "rabbitmq" "zipkin" "auth-db" "auth-server-io" "db")
for deployment in "${deployments[@]}"
do
  kubectl delete -n default service "$deployment"
done