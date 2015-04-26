#!/bin/bash

SERVER_DIR=/home/demo/blueBirdServer
SRC_FOLDER=$SERVER_DIR/slam/load/raw/$1
DST_FOLDER=$SERVER_DIR/slam/load/dataset/img/$1


# drop dest
[ ! -d $DST_FOLDER ] &&  rm -rf $DST_FOLDER

mkdir $DST_FOLDER

cp $SRC_FOLDER/* $DST_FOLDER/
cd $DST_FOLDER

mogrify -format png *.jpg

for f in ./*.png
do
    convert -colorspace gray $f $f
    echo "done processing:" $f
done

 
