FROM alpine:3.12

#update software packages in alpine
RUN apk update && apk upgrade

#download utils and packages
RUN apk add vsftpd openssl supervisor libc6-compat

#create folder for FTPS
RUN mkdir -p /var/lib/ftps

#config for vsftpd
COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf

#config for supervisor
COPY srcs/supervisor.conf /etc/supervisord.conf

#init certificate and key for SSL
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt \
	-subj "/C=RU/ST=Moscow/L=Moscow/O=School21/OU=agigi/CN=localhost"

#create user
RUN adduser -D -g 'agigi' agigi
RUN echo "agigi:123" | chpasswd

#download and setup telegraf
ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz .
RUN tar -xvzf telegraf-1.17.0_linux_amd64.tar.gz \
	&& mv telegraf-1.17.0 telegraf \
	&& rm -rf telegraf-1.17.0_linux_amd64.tar.gz
COPY srcs/telegraf.conf etc/telegraf/telegraf.conf

#open ports
EXPOSE 21 50000

ENTRYPOINT usr/bin/supervisord -c /etc/supervisord.conf
