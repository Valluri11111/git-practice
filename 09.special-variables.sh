#!/bin/bash
echo "All Variables Passed Script: $@"
echo "Number of Variables Passed: $#"
echo "Script name: $0"
echo "current working directory: $PWD"
echo "Home directory of current user: $HOME"
echo "PID of Script running now: $$"
sleep 100 &
echo "PID of last background command: $!"
