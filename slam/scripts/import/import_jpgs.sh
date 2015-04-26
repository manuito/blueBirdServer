#!/bin/bash

SERVER_DIR=/home/demo/blueBirdServer

NEW_FOLDER=$SERVER_DIR/slam/load/raw/$2

mkdir $NEW_FOLDER

cp $1/*.jpg $NEW_FOLDER

echo "import done in $NEW_FOLDER. Start convert and loading"

$SERVER_DIR/slam/scripts/import/convert_jpgs_to_jpgs.sh $2
