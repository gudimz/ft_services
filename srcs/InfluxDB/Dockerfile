FROM alpine:3.12

#update software packages in alpine
RUN apk update && apk upgrade

#download utils and packages
RUN apk add influxdb supervisor libc6-compat

#config for supervisor
COPY srcs/supervisor.conf /etc/supervisord.conf

#download and setup telegraf
ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz .
RUN tar -xvzf telegraf-1.17.0_linux_amd64.tar.gz \
	&& mv telegraf-1.17.0 telegraf \
	&& rm -rf telegraf-1.17.0_linux_amd64.tar.gz
COPY srcs/telegraf.conf etc/telegraf/telegraf.conf

#open ports
EXPOSE 8086

ENTRYPOINT usr/bin/supervisord -c /etc/supervisord.conf