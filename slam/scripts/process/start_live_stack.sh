#!/bin/bash

SERVER_DIR=/home/demo/blueBirdServer
echo "Protect against interactive sudo check :"
sudo echo "now it's ok"

$SERVER_DIR/slam/scripts/process/launch_roscore.sh&
sleep 5 ; echo "Roscore loaded"
$SERVER_DIR/slam/scripts/process/launch_viewer.sh&
$SERVER_DIR/slam/scripts/process/repeat.check.sh&
echo "statup done !"
