#!/bin/bash

SERVER_DIR=/home/demo/blueBirdServer
echo "start roscore service"
sudo su -l -c 'source /home/demo/blueBirdServer/slam/rosbuild_ws/setup.bash && roscore'
