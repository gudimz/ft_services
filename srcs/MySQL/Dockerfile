FROM alpine:3.12

#update software packages in alpine
RUN apk update && apk upgrade

#download utils and packages
RUN apk add mysql mysql-client openrc supervisor libc6-compat

COPY srcs/my.cnf /etc/my.cnf
COPY srcs/start.sh ./start.sh
COPY srcs/database.sql ./database.sql
COPY srcs/wordpress.sql ./wordpress.sql

#config for supervisor
COPY srcs/supervisor.conf /etc/supervisord.conf

RUN chmod 777 ./start.sh

#download and setup telegraf
ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz .
RUN tar -xvzf telegraf-1.17.0_linux_amd64.tar.gz \
	&& mv telegraf-1.17.0 telegraf \
	&& rm -rf telegraf-1.17.0_linux_amd64.tar.gz
COPY srcs/telegraf.conf etc/telegraf/telegraf.conf

#open ports
EXPOSE 3306

ENTRYPOINT ["sh", "/start.sh" ]
