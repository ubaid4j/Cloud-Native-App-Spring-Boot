kubectl delete -n default deployment elasticsearch
kubectl delete -n default deployment logstash
kubectl delete -n default deployment kibana

kubectl delete -n default deployment rabbitmq-deployment
kubectl delete -n default deployment zipkin-deployment

kubectl delete -n default deployment auth-db
kubectl delete -n default deployment auth-server-deployment

kubectl delete -n default deployment mysql
kubectl delete -n default deployment config-deployment
kubectl delete -n default deployment discovery
