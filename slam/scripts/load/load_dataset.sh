#!/bin/bash

SERVER_DIR=/home/demo/blueBirdServer
$SERVER_DIR/slam/scripts/set_env.sh
source $SERVER_DIR/slam/rosbuild_ws/setup.bash

$SERVER_DIR/slam/scripts/process/launch_slam_with_dataset_mode.sh $1 $2 $3 


