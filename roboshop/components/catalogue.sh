#!/bin/bash 

COMPONENT=catalogue
LOGFILE="/tmp/${COMPONENT}.log"

ID=$(id -u)

if [ $ID -ne 0 ] ; then 
    echo -e "\e[31m This script is expected to be run by a root user or with a sudo privilege \e[0m"
    exit 1
fi 

stat() {
    if [ $1 -eq 0 ] ; then 
        echo -e "\e[32m success \e[0m"
    else 
        echo -e "\e[31m failure \e[0m"
        exit 2
    fi 
}

echo -e "*********** \e[35m $COMPONENT Installation has started \e[0m ***********"

echo -n  "Configuring the $COMPONENT repo :"
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -  &>> $LOGFILE
stat $?

echo -n "Installing NodeJS :"
yum install nodejs -y   &>> $LOGFILE 
stat $? 

echo -n "Creating the Service Account :"
useradd roboshop 


# 1. Let's now set up the catalogue application.

# As part of operating system standards, we run all the applications and databases as a normal user but not with root user.

# So to run the catalogue service we choose to run as a normal user and that user name should be more relevant to the project. Hence we will use `roboshop` as the username to run the service.

# ```bash
# # useradd roboshop

# ```

# 1. So let's switch to the `roboshop` user and run the following commands.