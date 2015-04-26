#!/bin/bash

SERVER_DIR=/home/demo/blueBirdServer
echo 'start SLAM CORE with live image stream'

cd $SERVER_DIR/slam/rosbuild_ws/package_dir
rosrun $SERVER_DIR/slam/rosbuild_ws/package_dir/lsd_slam/lsd_slam_core live_slam image:=/image_raw camera_info:=/camera_info
