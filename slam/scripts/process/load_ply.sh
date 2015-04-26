#!/bin/bash

SERVER_DIR=/home/demo/blueBirdServer
PLY_FILE_LOC=$SERVER_DIR/slam/rosbuild_ws/package_dir/lsd_slam/lsd_slam_viewer/pc.ply
MESH_LOAD_FOLDER=$SERVER_DIR/slam/load/ply
MESH_FILE=$MESH_LOAD_FOLDER/pc-$(date +%s).ply

mv $PLY_FILE_LOC $MESH_FILE

## Remove existing meshlab ... badly ...
mesh_pid=`/bin/ps -ef | grep meshlab | grep -v "grep" | awk '{print $2}'`
kill -9 $mesh_pid

meshlab $MESH_FILE

