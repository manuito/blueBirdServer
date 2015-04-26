#!/bin/bash

SERVER_DIR=/home/demo/blueBirdServer

## Protect against interactive sudo check :
sudo echo "sudo should be ok for now"

echo "######### Starting Demo 2 #########"
echo "Process a demo bag in SLAM with good results"
echo ""
echo "Reminder :"
echo "3/ Start SLAM"
echo "4/ Launch existing Demo BAG in SLAM"
echo "6/ Pause for demo and quit"
echo ""
echo ""

echo "1] Launch SLAM processes from stream"
$SERVER_DIR/slam/scripts/process/start_live_stack_stream.sh

echo "2] Start to load BAG in SLAM"
$SERVER_DIR/slam/scripts/load/load_bag.sh

read -p "---- demo is running, press space to close it => 1st check! -----"
read -p "---- demo is still running, press space to close it => 2nd check! -----"
read -p "---- demo is still running, press space to close it => Last check! -----"

echo "3] Stop everything"
$SERVER_DIR/demos/stop_clean.sh
