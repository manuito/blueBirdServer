#!/bin/bash

SERVER_DIR=/home/demo/blueBirdServer
echo "Protect against interactive sudo check :"
sudo echo "now it's ok"

ser_pid=`/bin/ps -ef | grep blueBird | grep -v "grep" | awk '{print $2}'`
sudo kill -9 $ser_pid

ros_pid=`/bin/ps -ef | grep ros/indigo | grep -v "grep" | awk '{print $2}'`
sudo kill -9 $ros_pid

rm -rf $SERVER_DIR/slam/load/dataset/img/0013
rm -rf $SERVER_DIR/slam/load/raw/0013
rm -rf /tmp/ftp*

echo "stop done"
