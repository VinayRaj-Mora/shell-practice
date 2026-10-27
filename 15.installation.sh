#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Error: Please run the script as the root user."
    exit 1 #other than 0 means error
fi

dnf install mysql 

if [ $? -ne 0 ]; then
    echo "Error: Mysql installation failed."
    exit 1 #Other that 0 means error
else
    echo " Mysql installation is success."
fi