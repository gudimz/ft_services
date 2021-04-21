#!/bin/zsh

rc-status
touch /run/openrc/softlevel

/etc/init.d/mariadb setup
/etc/init.d/mariadb start

mysql -u root mysql < ./database.sql
mysql -u root wordpress < ./wordpress.sql
/etc/init.d/mariadb stop

usr/bin/supervisord -c /etc/supervisord.conf