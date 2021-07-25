kubectl delete -n default persistentvolumeclaim elasticsearch-pvc
kubectl delete persistentvolume elasticsearch-pv

kubectl delete -n default persistentvolumeclaim mysql-pvc
kubectl delete persistentvolume mysql-pv

kubectl delete -n default persistentvolumeclaim auth-db-pvc
kubectl delete persistentvolume auth-db-pv