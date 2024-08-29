#!/bin/bash

SOURCE_DIR=/home/ec2-user/logs

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR  $G Exists $N"
else
    echo "$SOURCE_DIR  $R Does not Exists $N"
    exit 1
fi

# SOURCE_DIR =/home/ec2-user/logs
FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "Files: $Files"