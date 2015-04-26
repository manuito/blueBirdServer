#!/bin/bash

SERVER_DIR=/home/demo/blueBirdServer
echo "Protect against interactive sudo check :"
sudo echo "now it's ok"

slam_pid=`/bin/ps -ef | grep slam | grep -v "grep" | awk '{print $2}'`
sudo kill -9 $slam_pid

roscore_pid=`/bin/ps -ef | grep ros/indigo | grep -v "grep" | awk '{print $2}'`
sudo kill -9 $roscore_pid

echo "stop done"
