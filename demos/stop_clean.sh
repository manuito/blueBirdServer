#!/bin/bash

SERVER_DIR=/home/demo/blueBirdServer
echo "Protect against interactive sudo check :"
sudo echo "now it's ok"

ser_pid=`/bin/ps -ef | grep blueBird | grep -v "grep" | awk '{print $2}'`
sudo kill -9 $ser_pid

echo "stop done"
