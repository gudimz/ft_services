
#init mysql
service mysql start
mysql < ./database.sql


#init certificate and key for SSL
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/agigi.key -out /etc/ssl/certs/agigi.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=School21/OU=agigi/CN=localhost"

#init nginx
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost
rm -rf /etc/nginx/sites-enabled/default
rm -rf /etc/nginx/sites-available/default