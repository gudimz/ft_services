#!/bin/zsh
#Delete old minikube
minikube delete

#Launching the minikube in a virtual machine
minikube start --vm-driver=virtualbox

#Switch docker to work inside the cluster
eval $(minikube docker-env)

#MetalLB
minikube addons enable metallb
kubectl apply -f ./srcs/metallb/metallb.yaml

#nginx
docker build -t nginx_image ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml