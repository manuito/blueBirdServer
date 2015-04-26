#!/bin/bash

SERVER_DIR=/home/demo/blueBirdServer

NEW_FOLDER=$SERVER_DIR/slam/load/raw/$2

mkdir $NEW_FOLDER

cp $1/*.mp4 $NEW_FOLDER

echo "import of mp4 done in $NEW_FOLDER. Start convert and loading of $2"

$SERVER_DIR/slam/scripts/import/convert_mp4_to_pngs.sh $2
