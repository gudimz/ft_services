#!/bin/zsh
#Delete old minikube
minikube delete

#Launching the minikube in a virtual machine
minikube start --vm-driver=virtualbox

#Switch docker to work inside the cluster
eval $(minikube docker-env)

#MetalLB
minikube addons enable metallb
kubectl apply -f ./srcs/yamls/MetalLB.yaml

#nginx
echo -e "\e[32mStarting Nginx... \e[0m"
docker build -t nginx_image ./srcs/Nginx
kubectl apply -f ./srcs/yamls/Nginx.yaml

#wordpress
echo -e "\e[32mStarting WordPress... \e[0m"
docker build -t wordpress_image ./srcs/WordPress
kubectl apply -f ./srcs/yamls/WordPress.yaml

#phpmyadmin
echo -e "\e[32mStarting PhpMyAdmin... \e[0m"
docker build -t phpmyadmin_image ./srcs/PhpMyAdmin
kubectl apply -f ./srcs/yamls/PhpMyAdmin.yaml

#mySQL
echo -e "\e[32mStarting MySQL... \e[0m"
docker build -t mysql_image ./srcs/MySQL
kubectl apply -f ./srcs/yamls/MySQL.yaml

#FTPS
echo -e "\e[32mStarting FTPS... \e[0m"
docker build -t ftps_image ./srcs/FTPS
kubectl apply -f ./srcs/yamls/FTPS.yaml

#Grafana
echo -e "\e[32mStarting Grafana... \e[0m"
docker build -t grafana_image ./srcs/Grafana
kubectl apply -f ./srcs/yamls/Grafana.yaml

#InfluxDB
echo -e "\e[32mStarting InfluxDB... \e[0m"
docker build -t influxdb_image ./srcs/InfluxDB
kubectl apply -f ./srcs/yamls/InfluxDB.yaml

#kubectl get services

#minikube dashboard