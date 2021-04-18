#!/bin/zsh

rc-status
touch /run/openrc/softlevel

/etc/init.d/mariadb setup
/etc/init.d/mariadb start

mysql -u root mysql < database.sql
/etc/init.d/mariadb stop
