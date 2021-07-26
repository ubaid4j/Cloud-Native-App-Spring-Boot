What is minikube
--------
For Local Development we use `minikube`. `minikube` is a single-node Kubernetes cluster.

`minikube` has following important commands
- `minikube start` to bootstrap Kubernetes single node cluster
- `minikube status` check status of Kubernetes single node cluster status
- `minikube stop` to stop Kubernetes cluster
- `minikube ssh` to ssh into minikube
- `minikube dashboard` to view the dashboard
- `minikube ip` to view the IP address of minikube node
- `minikube service ${servcie-name}` open the service in the browser
- `minikube addons enable ${addon-name}` to enable any addon (such as ingress etc)

What is Kubectl
---------------
The Kubernetes command-line tool, kubectl, allows you to run commands against Kubernetes clusters. You can use kubectl to deploy applications, inspect and manage cluster resources, and view logs

`kubectl` commands
1. `kubectl config view` to view the kube config file `~/.kube/config`
2. `kubectl cluster-info` to view cluster info
3. `kubectl proxy` to access dashboard from `http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/#/overview?namespace=default`
4. `kubectl create namespace ${name}` to create namespace of name ${name}
5. `kubectl create -f ${signing-request.yaml}` to create signing request object
6. `kubectl get csr` to get all certificate signing request
7. `kubectl certificate approve ${csr-name}` to approve certificate signing request
8. `kubectl get deployments` to get all deployments in default namespace
9. `kubectl get replicasets` to get all replicasets in default namespace
10. `kubectl get pods` to get all pods in default namespace
11. `kubectl describe pod ${pod-name}` to view the config info of given pod
12. `kubectl get pods -L ${col1},${col2}` we can add number of columns along `-L` argument
13. `kubectl get pods -l ${selector}` we can get the pods using the selector
14. `kubectl delete deployments ${deployment-name}` to delete the deployment
15. `kubectl create -f ${fileName.yml}` to create any object mentioned in the `.yml` file.

Kubernetes Pod
--------------
A Pod is the smallest and simplest Kubernetes object. It is the unit of deployment in Kubernetes, which represents a single instance of the application. A Pod is a logical collection of one or more containers, which:

1. Are scheduled together on the same host with the Pod
2. Share the same network namespace, meaning that they share a single IP address originally assigned to the Pod
3. Have access to mount the same external storage (volumes).

Kubernetes Service
------------------
A Service offers a single DNS entry for a containerized application managed by the Kubernetes cluster, regardless of the number of replicas, by providing a common load balancing access point to a set of pods logically grouped and managed by a controller such as a Deployment, ReplicaSet, or DaemonSet

Kubernetes Probes
-----------------
1. Liveness (checking health)
2. Readiness (waiting for certain condition to meet)