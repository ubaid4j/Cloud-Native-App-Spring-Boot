How to run this Cloud Native Application in Kubernetes
======================================================

Requirements
------------
1. [Docker](../../resource/install-require-softwares.md#install-docker)
2. `minikube` and `kubectl` (please execute `k8s/minikube/install_minikube_kubectl.sh` to install both `minikube` and `kubectl`)
3. Add following lines in your `/etc/hosts` file.
   ```
       192.168.49.2 auth-server-io
       192.168.49.2 currency-converter.io
       192.168.49.2 currency-converter.api-gateway.io
    ```
   Where `192.168.49.2` is the **IP address** of `minikube`. You can check the **IP address** of your `minikube` by executing `minikue ip` command.

**Warning**: `k8s/minikube/install_minikube_kubectl.sh` delete already existed minikube cluster from your local machine.

How to run
----------
Execute the following script and all of **17** services will start running on `minikube` cluster.
* `k8s/k8s-up.sh`

Kubernetes Dashboard
--------------------
You can access the kubernetes dashboard to check the status of all services just deployed by executing following script
*  `minikube dashboard`

Web UI
-----
As soon all services are up, you can access the following UIs by just clicking on the below links:

* [Access UI](http://currency-converter.io)
* [Access Swagger](http://currency-converter.api-gateway.io)
* [Access Auth Server](http://auth-server-io)

Stop all services
-----------------
Just execute the following script to stop all services running in `minikube` cluster.
* `k8s/k8s-down.sh`

[More Info](moreinfo.md)
---------
