#!/bin/zsh
#Delete old minikube
minikube delete

#Launching the minikube in a virtual machine
minikube start --vm-driver=virtualbox

#Switch docker to work inside the cluster
eval $(minikube docker-env)

#MetalLB
minikube addons enable metallb
kubectl apply -f ./srcs/yamls/metallb.yaml

#nginx
echo -e "\e[32mStarting NGINX... \e[0m"
docker build -t nginx_image ./srcs/nginx
kubectl apply -f ./srcs/yamls/nginx.yaml

#wordpress
echo -e "\e[32mStarting WORDPRESS... \e[0m"
docker build -t wordpress_image ./srcs/wordpress
kubectl apply -f ./srcs/yamls/wordpress.yaml

#phpmyadmin
echo -e "\e[32mStarting PHPMYADMIN... \e[0m"
docker build -t phpmyadmin_image ./srcs/phpmyadmin
kubectl apply -f ./srcs/yamls/phpmyadmin.yaml

minikube dashboard