#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "Please run the script with root privilages"
    exit 1
fi

dnf list installed git

if [ $? -ne 0 ]
then
    echo "Git not Installed, Going to Install it...."
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "Git Installation not success... check it"
        exit 1
    else
        echo "Git Installation Success...."
    fi
else
    echo "Git already Installed, Nothing to do anything..."     
fi