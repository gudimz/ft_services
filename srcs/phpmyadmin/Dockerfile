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
RUN mkdir -p /run/nginx

#config for nginx
COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf

#create folder for phpmyadmin
RUN mkdir -p /www

#download and setup phpmyadmin
ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.zip .
RUN unzip phpMyAdmin-5.0.4-all-languages.zip && rm -rf phpMyAdmin-5.0.4-all-languages.zip
RUN mv phpMyAdmin-5.0.4-all-languages /www/phpmyadmin
COPY ./srcs/config.inc.php /www/phpmyadmin/config.inc.php

#open ports
EXPOSE 5000

ENTRYPOINT usr/bin/supervisord -c /etc/supervisord.conf
