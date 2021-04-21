FROM alpine:3.12

#update software packages in alpine
RUN apk update && apk upgrade

#download utils and packages
RUN apk add libc6-compat supervisor

#config for supervisor
COPY srcs/supervisor.conf /etc/supervisord.conf

#download and setup grafana
ADD https://dl.grafana.com/enterprise/release/grafana-enterprise-7.5.4.linux-amd64.tar.gz .
RUN tar -xvzf grafana-enterprise-7.5.4.linux-amd64.tar.gz \
	&& mv grafana-7.5.4 grafana \
	&& rm -rf grafana-enterprise-7.5.4.linux-amd64.tar.gz

#dashboards for grafana
COPY srcs/grafana.db /grafana/data/grafana.db

#download and setup telegraf
ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz .
RUN tar -xvzf telegraf-1.17.0_linux_amd64.tar.gz \
	&& mv telegraf-1.17.0 telegraf \
	&& rm -rf telegraf-1.17.0_linux_amd64.tar.gz
COPY srcs/telegraf.conf etc/telegraf/telegraf.conf

#open ports
EXPOSE 3000

ENTRYPOINT usr/bin/supervisord -c /etc/supervisord.conf
