#!/bin/bash

USERID=$(id -u)

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
        echo "$2 is... Failed"
    else
        echo "$2 is... Success"
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
