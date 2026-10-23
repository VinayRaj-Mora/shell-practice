#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Error: Please run the script as the root user."
fi

dnf install my sql -y

if [ $? -ne 0 ]; then
    echo "Error: Mysql installation failed."
else
    echo " Mysql installation is success."
fi