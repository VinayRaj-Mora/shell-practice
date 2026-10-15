#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then 
    echo "ERROR:: Please run the script with the root privelege"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
    echo "ERROR:: Installing $2 failure"
    exit 1
else 
    echo "installing $2 success"
fi
}

dnf install mysql -y
VALIDATE $