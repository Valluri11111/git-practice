#!/bin/bash

set -e # Setting automatic exit, if we get error. set -ex is for debug

failure(){
    echo "Failed at: $1:$2"

}

trap ' failure "${LINENO}" "$BASH_COMMAND" ' ERR #ERR is the Error Signal
echo "Hello World"
echooo "Hello World"
