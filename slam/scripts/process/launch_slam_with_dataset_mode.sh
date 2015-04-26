#!/bin/bash

SERVER_DIR=/home/demo/blueBirdServer
echo "start SLAM CORE with image dataset"

$SERVER_DIR/slam/scripts/set_env.sh
source $SERVER_DIR/slam/rosbuild_ws/setup.bash

cd $SERVER_DIR/slam/rosbuild_ws/package_dir
rosrun $SERVER_DIR/slam/rosbuild_ws/package_dir/lsd_slam/lsd_slam_core dataset_slam _files:=$SERVER_DIR/slam/load/dataset/img/$1 _hz:=$3 _calib:=$SERVER_DIR/slam/load/calibs/$2_calib.cfg
