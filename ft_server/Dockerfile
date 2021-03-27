# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: agigi <agigi@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/31 15:08:52 by agigi             #+#    #+#              #
#    Updated: 2021/01/04 20:47:49 by agigi            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

#update software packages in debian
RUN apt-get update && apt-get -y upgrade

#download utils and packages
RUN apt-get -y install openssl unzip nginx mariadb-server \
php7.3 php-mysql php-fpm php-pdo php-gd php-cli php-mbstring

#download and setup phpmyadmin
WORKDIR /var/www/html/
ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.zip .
RUN unzip ./phpMyAdmin-5.0.4-all-languages.zip && rm -rf phpMyAdmin-5.0.4-all-languages.zip
RUN mv phpMyAdmin-5.0.4-all-languages phpmyadmin

#download and setup wordpress
ADD https://wordpress.org/latest.tar.gz .
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz
RUN chown -R www-data:www-data * && chmod -R 755 *
COPY ./srcs/wp-config.php ./wordpress/wp-config.php

#config for nginx
COPY ./srcs/nginx.conf /etc/nginx/sites-available/localhost

#create folder for config and scripts
RUN mkdir -p /usr/src/ft_server
WORKDIR /usr/src/ft_server

COPY ./srcs/switch_autoindex.sh ./switch_autoindex.sh
COPY ./srcs/database.sql ./database.sql
COPY ./srcs/init_server.sh ./init_server.sh
RUN sh ./init_server.sh
COPY ./srcs/start.sh ./start.sh
#change the access permissions all files
RUN chmod -R 755 *

#open ports
EXPOSE 80 443

ENTRYPOINT bash start.sh
