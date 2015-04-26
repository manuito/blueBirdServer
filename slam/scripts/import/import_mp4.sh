#!/bin/bash

SERVER_DIR=/home/demo/blueBirdServer
LAST_RAW_FOLDER=$(ls -t $SERVER_DIR/slam/load/raw | head -n 1)
let LAST_RAW_FOLDER++

NEW_FOLDER=$SERVER_DIR/slam/load/raw/000$LAST_RAW_FOLDER

mkdir $NEW_FOLDER

cp $1/*.mp4 $NEW_FOLDER

echo "import of mp4 done in $NEW_FOLDER. Start convert and loading of 000$LAST_RAW_FOLDER"

$SERVER_DIR/slam/scripts/import/convert_mp4_to_pngs.sh 000$LAST_RAW_FOLDER 
