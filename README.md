# vhosts
Shell script for creating vertiual hosts with nginx server in single step

This shell script make a entry in hosts file for vertiual host and also create a file for sites-enabled with default features after then restart server.
script call as: 
sh nginxVhost.sh domain_name project_root_path nginx_root_path
sh nginxVhost.sh project1 /var/www/project1 /etc/nginx/

VHost will be created as "localhost.project1"

Error_Code:
01 => project_root_path does't exist, please check and enter valid path.
02 => A virtual host already created with same domain_name, please enter different domain_name.
03 => nginx_root_path does't exist or not a valid nginx server path, please enter valid path eg: /etc/nginx/.
