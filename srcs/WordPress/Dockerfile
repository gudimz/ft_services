FROM alpine:3.12

#update software packages in alpine
RUN apk update && apk upgrade

#download utils and packages
RUN apk add openssl unzip nginx supervisor \
	php7 php7-mysqli php7-zlib php7-curl php7-mbstring \
	php7-json php7-session php7-fpm libc6-compat

#config for supervisor
COPY srcs/supervisor.conf /etc/supervisord.conf

#create folder for nginx
RUN mkdir -p /run/nginx && chmod 777 /run/nginx

#config for nginx
COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf

#create folder for wordpress
RUN mkdir -p /www && chmod 777 /www

#download and setup wordpress
ADD https://wordpress.org/latest.tar.gz .
RUN tar -xvzf latest.tar.gz -C /www && rm -rf latest.tar.gz
COPY ./srcs/wp-config.php /www/wordpress/wp-config.php

#download and setup telegraf
ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz .
RUN tar -xvzf telegraf-1.17.0_linux_amd64.tar.gz \
	&& mv telegraf-1.17.0 telegraf \
	&& rm -rf telegraf-1.17.0_linux_amd64.tar.gz
COPY srcs/telegraf.conf etc/telegraf/telegraf.conf

#open ports
EXPOSE 5050

ENTRYPOINT usr/bin/supervisord -c /etc/supervisord.conf
