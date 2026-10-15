#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then 
    echo "ERROR:: Please run the script as the root user."
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "ERROR:: Installing $2 is failure.""
        exit 1
    fi
}