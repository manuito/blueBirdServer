#!/bin/bash

SERVER_DIR=/home/demo/blueBirdServer
while true ; do $SERVER_DIR/slam/scripts/process/detect_ply.sh ; sleep 5; done
