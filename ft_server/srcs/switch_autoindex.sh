if grep -q "autoindex on" /etc/nginx/sites-available/localhost
then
	sed -i "s/autoindex on;/autoindex off;/" /etc/nginx/sites-available/localhost
	echo -e "\033[31m \n \tAutoindex is off \n \033[0m"
else
	sed -i "s/autoindex off;/autoindex on;/" /etc/nginx/sites-available/localhost
	echo -e "\033[32m \n \tAutoindex is on \n \033[0m"
fi
nginx -s reload