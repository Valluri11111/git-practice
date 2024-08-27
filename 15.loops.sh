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


#Example: 15.loops.sh git mysql ngnix postfix
for package in $@ #Refers to all arguments passed..
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo "$package not Installed, Going to Install it...."
        dnf install $package -y
        VALIDATE $? "Installing $package"
    else
        echo "$package is already installed...nothing to do"
    fi
done
