kubectl delete -n default configmap kibana-config
kubectl delete -n default configmap logstash-pipeline
kubectl delete -n default configmap logstash-config
kubectl delete -n default configmap elastic-search-config
kubectl delete -n default configmap audit-db-init-config