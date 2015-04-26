#!/bin/bash

SERVER_DIR=/home/demo/blueBirdServer
echo "Protect against interactive sudo check :"
sudo echo "now it's ok"

$SERVER_DIR/slam/scripts/process/launch_roscore.sh&
sleep 5 ; echo "Roscore loaded"
sudo $SERVER_DIR/slam/scripts/process/launch_viewer.sh&
sudo $SERVER_DIR/slam/scripts/process/launch_slam_with_stream_mode.sh&
$SERVER_DIR/slam/scripts/process/repeat.check.sh&
echo "statup done !"
