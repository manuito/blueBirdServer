#!/bin/bash
set -e

SERVER_DIR=/home/demo/blueBirdServer
cd $SERVER_DIR/slam/rosbuild_ws/package_dir
rosrun lsd_slam_viewer viewer
