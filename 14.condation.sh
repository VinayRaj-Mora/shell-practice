#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then 
    echo -e "$R ERROR:: Please run the script as the root user. $N"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "ERROR:: $2.. $R installation failed. $N"
        exit 1
    else
        echo -e "$G Installing $2 is success. $N"
    fi
}

dnf list installed mysql
if [ $? -eq 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo -e "$Y MySQL is already installed. $N"
fi
dnf list installed nginx
if [ $? -eq 0 ]; then
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo -e "$Y Nginx is already installed. $N"
fi
dnf list installed python3
if [ $? -eq 0 ]; then
    dnf install python3 -y
    VALIDATE $? "Python3"
else
    echo -e "$Y Python3 is already installed. $N"
fi
