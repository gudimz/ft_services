FROM alpine:3.12

#update software packages in alpine
RUN apk update && apk upgrade

#download utils and packages
RUN apk add openssl unzip nginx supervisor libc6-compat

#config for nginx
COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf

#config for supervisor
COPY srcs/supervisor.conf /etc/supervisord.conf

#create folder for nginx
RUN mkdir -p /run/nginx && chmod 777 /run/nginx

#create folder for html
RUN mkdir -p /www && chmod 777 /www

#standart index.html
COPY srcs/index.html /www/index.html

#init certificate and key for SSL
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt \
	-subj "/C=RU/ST=Moscow/L=Moscow/O=School21/OU=agigi/CN=localhost"

#download and setup telegraf
ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz .
RUN tar -xvzf telegraf-1.17.0_linux_amd64.tar.gz \
	&& mv telegraf-1.17.0 telegraf \
	&& rm -rf telegraf-1.17.0_linux_amd64.tar.gz
COPY srcs/telegraf.conf etc/telegraf/telegraf.conf

#open ports
EXPOSE 80 443

ENTRYPOINT usr/bin/supervisord -c /etc/supervisord.conf
