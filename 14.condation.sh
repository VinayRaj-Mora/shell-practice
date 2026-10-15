#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then 
    echo "ERROR:: Please run the script with the root privelege"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: mysql server failure"
    exit 1
else 
    echo "installing mysql server success"
fi