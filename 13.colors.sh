#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Please run the script with root privilages"
        exit 1
    fi
}
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is... $R Failed $N"
    else
        echo -e "$2 is... $G Success $N"
   fi
   }
   
CHECK_ROOT

dnf list installed git

if [ $? -ne 0 ]
then
    echo "Git not Installed, Going to Install it...."
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo "Git already Installed, Nothing to do anything..."     
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo " MySQL is not Installed.... Going to Install"
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo "MySQL is already Installed...."
fi
