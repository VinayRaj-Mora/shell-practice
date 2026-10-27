#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shell-script"
script_name=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$script_name.log"
mkdir -p $LOGS_FOLDER

echo "script execution started at $(date)" >> $LOG_FILE
if [ $USERID -ne 0 ]; then 
    echo -e "$R ERROR:: Please run the script as the root user. $N"
    exit 1
fi

for package in $@
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]; then
        dnf install $package -y &>>$LOG_FILE   
        VALIDATE $? "$package"
    else
        echo -e "$Y $package is already installed. $N"
    fi
done