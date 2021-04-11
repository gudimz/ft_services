FROM alpine:3.12

#update software packages in alpine
RUN apk update && apk upgrade

#download utils and packages
RUN apk add mysql mysql-client supervisor

#config for supervisor
COPY srcs/supervisor.conf /etc/supervisord.conf

#create folder for mysql
RUN mkdir -p /var/lib/mysql

#config for nginx
COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf

#create folder for wordpress
RUN mkdir -p /www

#download and setup wordpress
ADD https://wordpress.org/latest.tar.gz .
RUN tar -xvzf latest.tar.gz -C /www && rm -rf latest.tar.gz
COPY ./srcs/wp-config.php /www/wordpress/wp-config.php


#open ports
EXPOSE 5050

ENTRYPOINT usr/bin/supervisord -c /etc/supervisord.conf
