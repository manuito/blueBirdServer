#!/bin/bash
set -e

SERVER_DIR=/home/demo/blueBirdServer
echo 'start SLAM viewer'

$SERVER_DIR/slam/scripts/set_env.sh
source $SERVER_DIR/slam/rosbuild_ws/setup.bash

cd $SERVER_DIR/slam/rosbuild_ws/package_dir
rosrun $SERVER_DIR/slam/rosbuild_ws/package_dir/lsd_slam/lsd_slam_viewer viewer
