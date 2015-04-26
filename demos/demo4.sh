#!/bin/bash

SERVER_DIR=/home/demo/blueBirdServer
FTP_LOCAL_FOLDER="/tmp/ftp-demo"

## Protect against interactive sudo check :
sudo echo "sudo should be ok for now"

echo "######### Starting Demo 1 #########"
echo "Manual control of bebop, post FTP picture process"
echo ""
echo "Reminder :"
echo "1/ Start SLAM"
echo "2/ Process converted dataset in SLAM"
echo "3/ Pause for demo and quit"
echo ""
echo ""

echo "1] Launch SLAM processes"
$SERVER_DIR/slam/scripts/process/start_live_stack.sh 

echo "2] Start to load converted pictures process in SLAM"
## params are : cmd <dataset_folder> <calib_cfg> <framerate> 
$SERVER_DIR/slam/scripts/load/load_dataset.sh 0015 PINHOLE 0 

read -p "---- demo is running, press space to close it => 1st check! -----"
read -p "---- demo is still running, press space to close it => 2nd check! -----"
read -p "---- demo is still running, press space to close it => Last check! -----"

echo "3] Stop everything"
$SERVER_DIR/demos/stop_clean.sh
read -p "---- confirm to quit demo. Use demos/stop_clean.sh after demo to cleanup ROS -----"
sudo $SERVER_DIR/demos/stop_clean.sh

