#! /bin/sh

# Minikube update script file
minikube delete
sudo rm -rf /usr/local/bin/minikube
sudo curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo chmod +x minikube
sudo cp minikube /usr/local/bin/
sudo rm minikube
minikube start

# Enabling addons
minikube addons enable dashboard
minikube addons enable default-storageclass
minikube addons enable storage-provisioner
minikube addons enable ingress

# Showing enabled addons
printf '\n\n\033[4;33m Enabled Addons \033[0m'
minikube addons list | grep STATUS && minikube addons list | grep enabled && \

# Showing current status of Minikube
printf '\n\n\033[4;33m Current status of Minikube \033[0m' && minikube status

printf '\n\n Installing Kubectl'
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
sudo rm -rf kubectl