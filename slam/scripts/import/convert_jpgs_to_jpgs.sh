#!/bin/bash

SERVER_DIR=/home/demo/blueBirdServer
SRC_FOLDER=$SERVER_DIR/slam/load/raw/$1
DST_FOLDER=$SERVER_DIR/slam/load/dataset/img/$1

echo "dedicated simplified convertion stream"

# drop dest
rm -rf $DST_FOLDER
mkdir $DST_FOLDER

echo "copy images from $SRC_FOLDER/ to $DST_FOLDER/"
cp $SRC_FOLDER/* $DST_FOLDER/

cd $DST_FOLDER

for file in *.jpg
do
    convert $file -crop 1080x1440+0+0 -resize 640x480! -colorspace gray $file
    echo "done processing: $file"
done

 
