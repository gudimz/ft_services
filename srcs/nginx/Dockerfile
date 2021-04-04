FROM alpine:3.12

#update software packages in debian
RUN apk update && apk upgrade

#download utils and packages
RUN apk add openssl unzip nginx

#config for nginx
COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf

#init certificate and key for SSL
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt \
	-subj "/C=RU/ST=Moscow/L=Moscow/O=School21/OU=agigi/CN=localhost"

#create folder for nginx
RUN mkdir -p /run/nginx

COPY srcs/start.sh ./start.sh
#change the access permissions all files
RUN chmod -R 755 ./start.sh

#open ports
EXPOSE 80 443

ENTRYPOINT sh start.sh
