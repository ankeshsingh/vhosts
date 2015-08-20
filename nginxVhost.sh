#!/bin/bash
# Author: Ankesh Singh
# Email: ankesh.gangwar@kelltontech.com
# Script: create virtual host for nginx
# Eg: sh nginxVhost.sh domain_name root_path nginx_root_path
HOST_NAME=$1 #get hostname
ROOT_PATH=$2 #get root path
if [ ! -z "$3" ] #chech server path is set in arrument or not
 then 
    NGINX_ROOT_PATH=$3"/sites-enabled/";
    if [ ! -d "$NGINX_ROOT_PATH" ]
       then
	echo "Error_code: 03\nMessage:$3 path not a valid nginx server path, please enter valid path eg: /etc/nginx/";			
    fi
 else
	NGINX_ROOT_PATH="/etc/nginx/sites-enabled/";
 fi

if [ ! -d "$ROOT_PATH" ];
	then
	  echo "Error_code: 01\nMessage:$ROOT_PATH path not exist!";
	else
		if grep -q "^127.0.0.1\slocalhost.$HOST_NAME" "/etc/hosts"
		   then
		     echo "Error_code:02\nMessage: A virtual host already created with same domain_name, please enter different domain_name"
		else 
		     echo "#custom hosts\n127.0.0.1 localhost.$HOST_NAME" >> "/etc/hosts"
		     echo '# statements for each of your virtual hosts to this file
			server {
			#root path;
			root '$ROOT_PATH';
			index index.html index.htm index.php;

			# Make site accessible from domain
			server_name localhost.'$HOST_NAME';

			location / {
				# First attempt to serve request as file, then
				# as directory, then fall back to displaying a 404.
				try_files $uri $uri/ =404;
				# Uncomment to enable naxsi on this location
				# include /etc/nginx/naxsi.rules
			}

			# pass the PHP scripts to FastCGI server listening
			#
			 location ~ \.php$ {
				try_files $uri =404;
				fastcgi_split_path_info ^(.+\.php)(/.+)$;
				fastcgi_pass unix:/var/run/php5-fpm.sock;
				fastcgi_index index.php;
				fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
				include fastcgi_params;
			}
		}' >> $NGINX_ROOT_PATH"localhost.$HOST_NAME"

		     service nginx restart;
		     echo "Your Created Domain name is localhost.$HOST_NAME";
		fi
	fi

