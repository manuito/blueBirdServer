#!/bin/bash

SERVER_DIR=/home/demo/blueBirdServer
FTP_LOCAL_FOLDER="/tmp/ftp-demo1"

## Protect against interactive sudo check :
sudo echo "sudo should be ok for now"

echo "######### Starting Demo 1 #########"
echo "Manual control of bebop, post FTP picture process"
echo ""
echo "Reminder :"
echo "1/ Manual bebop"
echo "2/ FTP stream for pictures"
echo "3/ Start SLAM"
echo "4/ Wait 15 seconds before converting pictures"
echo "5/ Process converted in SLAM"
echo "6/ Pause for demo and quit"
echo ""
echo ""

echo "1] Start the bebop manual control"
$SERVER_DIR/pilot/manual_bebop.sh&

echo "2] Start FTP picture stream"
$SERVER_DIR/slam/scripts/import/start_import_from_bebop.sh $FTP_LOCAL_FOLDER

echo "3] Launch SLAM processes"
$SERVER_DIR/slam/scripts/process/start_live_stack.sh 

echo "4] Convert current pictures after 15 seconds"
echo "sleep for more data to come"
sleep 15
echo "sleep done"
$SERVER_DIR/slam/scripts/import/import_jpgs.sh $FTP_LOCAL_FOLDER 0013

echo "5] Start to load converted pictures process in SLAM"
## params are : cmd <dataset_folder> <calib_cfg> <framerate> 
$SERVER_DIR/slam/scripts/load/load_dataset.sh 0013 BEBOP 2

read -p "---- demo is running, press space to close it => 1st check! -----"
read -p "---- demo is still running, press space to close it => 2nd check! -----"
read -p "---- demo is still running, press space to close it => Last check! -----"

echo "6] Stop everything"
$SERVER_DIR/demos/stop_clean.sh

