FROM alpine:3.12

#update software packages in alpine
RUN apk update && apk upgrade

#download utils and packages
RUN apk add mysql mysql-client openrc libc6-compat

#create folder for mysql
RUN mkdir -p /var/lib/mysql

COPY my.cnf /etc/my.cnf
COPY init.sh ./init.sh
COPY database.sql ./database.sql
RUN chmod 777 ./init.sh


#open ports
EXPOSE 3306

ENTRYPOINT sh init.sh
