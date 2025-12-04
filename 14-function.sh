#! /bin/bash

R='\e[31m'
N='\e[0m'
G='\e[32m'
Y='\e[33m'

USERID=$(id -u)

if [ $USERID -eq 0 ]; then
    echo "Error::Please run this with root privileges"
    exit 1
fi

VALDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$R Error:: Installing $2 is Failed $N"
        exit 1
    else
        echo "$2 is installed Successfully"
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo "MySQL is already installed"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo "Nginx is already installed"
fi

dnf list installed python3
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "Python3"
else
    echo "Python3 is already installed"
fi