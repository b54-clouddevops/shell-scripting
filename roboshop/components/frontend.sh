#!/bin/bash 

ID=$(id -u)
if [ $ID -ne 0 ] ; then 
    echo -e "\e[31m This script is expected to be run by a root user or with a sudo provilege \e[0m"
    exit 1
fi 

echo "Installing Nginx :"
yum install nginx -y 

# It's always a great idea to perform validation before you get an exception.
# If the script is executed as a root user or as a sudo user, then it has to proceed.
# If not , I was to exit the script with some nice message.

# The frontend is the service in RobotShop to serve the web content over Nginx.

# Install Nginx.

# ```
# # yum install nginx -y
# # systemctl enable nginx
# # systemctl start nginx

# ```

# Let's download the HTDOCS content and deploy it under the Nginx path.

# ```
# # curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"

# ```

# Deploy in Nginx Default Location.