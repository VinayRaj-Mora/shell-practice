#!/bin/bash


# This script installs a list of packages using apt-get.

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Error:: Please run script with root priveleges"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Error:: Installation failed"
    exit 1
else
    echo "Installation successful"
fi