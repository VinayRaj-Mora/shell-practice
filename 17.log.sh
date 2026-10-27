#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shell-script"
mkdir -p $LOGS_FOLDER

if [ $USERID -ne 0 ]; then 
    echo -e "$R ERROR:: Please run the script as the root user. $N"
    exit 1
fi

echo 
