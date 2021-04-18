FROM alpine:3.12

#update software packages in alpine
RUN apk update && apk upgrade

#download utils and packages
RUN apk add mysql mysql-client supervisor openrc libc6-compat

#config for supervisor
COPY srcs/supervisor.conf /etc/supervisord.conf

COPY srcs/my.cnf /etc/my.cnf
COPY srcs/init.sh ./init.sh
COPY srcs/database.sql ./database.sql
RUN chmod 777 ./init.sh && sh ./init.sh


#open ports
EXPOSE 3306

ENTRYPOINT usr/bin/supervisord -c /etc/supervisord.conf
