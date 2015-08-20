# To setup your project with nginx server in a single command.

Shell script for creating required virtual hosts with nginx server in single command

This shell script configure your project with nginx server and created a vertual host for your project.
Steps for exexute to command.

Step1: Download nginxVhost.sh file.

Step2: Open terminal and go to download file directory.

Step3: Execute  "sh nginxVhost.sh domain_name project_root_path nginx_root_path" command.

domain_name : name of your vertual host, which you want to setup.

project_root_path: root path of your project, which you want to setup. project_root_path should be a valid path.

nginx_root_path: root path of nginx server, its optional for command. if your nginx root path different from "/etc/nginx/" then you must pass our custom nginx root path.

Example: sh nginxVhost.sh project1 /var/www/project1 /etc/nginx/

Your vertual host will be created for project1 as  "localhost.project1"

Error_Code:

01 => project_root_path does't exist, please check and enter valid path.

02 => A virtual host already created with same domain_name, please enter different domain_name.

03 => nginx_root_path does't exist or not a valid nginx server path, please enter valid path eg: /etc/nginx/.

