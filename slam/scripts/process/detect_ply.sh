#!/bin/bash

SERVER_DIR=/home/demo/blueBirdServer

PLY_FILE_LOC=$SERVER_DIR/slam/rosbuild_ws/package_dir/lsd_slam/lsd_slam_viewer/pc.ply
PLY_LOAD_CMD=$SERVER_DIR/slam/scripts/process/load_ply.sh

test -f $PLY_FILE_LOC && $PLY_LOAD_CMD
