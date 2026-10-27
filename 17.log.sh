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

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "ERROR:: $2.. $R installation failed. $N"
        exit 1
    else
        echo -e "$G Installing $2 is success. $N"
    fi
}

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$LOG_FILE   
    VALIDATE $? "MySQL"
else
    echo -e "$Y MySQL is already installed. $N"
fi
dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "Nginx"
else
    echo -e "$Y Nginx is already installed. $N"
fi
dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "Python3"
else
    echo -e "$Y Python3 is already installed. $N"
fi


