FROM alpine:3.12

#update software packages in alpine
RUN apk update && apk upgrade

#download utils and packages
RUN apk add mysql mysql-client supervisor

#config for supervisor
COPY srcs/supervisor.conf /etc/supervisord.conf

#create folder for mysql
RUN mkdir -p /var/lib/mysql


#open ports
EXPOSE 5050

ENTRYPOINT usr/bin/supervisord -c /etc/supervisord.conf
