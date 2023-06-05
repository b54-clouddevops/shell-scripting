#!/bin/bash 

# Syntax for CASE 
# case  $var in 
#     opt1) command1 ;; 
     
#     opt2) command2 ;;

# esac

ACTION=$1

case $ACTION in 
    start) 
        echo "Starting RabbitMQ Service"
        ;;
    stop) 
        echo "Stopping RabbitMQ Service"
        ;;
    restart) 
        echo "Restarting RabbitMQ Service"
        ;;
    *)
        echo "Possible values are start or stop or restart only"
        ;;

esac 
