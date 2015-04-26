#!/bin/bash

SERVER_DIR=/home/demo/blueBirdServer
DEST_DIR=$1

CTRL_THBD_DIR=/tmp/ftp_thumb_ctrl

echo "check and create folders if required"
mkdir $CTRL_THBD_DIR
mkdir $CTRL_THBD_DIR/prev
mkdir $CTRL_THBD_DIR/cur
mkdir $DEST_DIR

## Init ref
cd $CTRL_THBD_DIR/prev
wget --quiet --no-parent --recursive --level=1 --no-directories ftp://192.168.42.1/internal_000/Bebop_Drone/thumb/

while true
do
	cd $CTRL_THBD_DIR/cur
	wget --quiet --no-parent --recursive --level=1 --no-directories ftp://192.168.42.1/internal_000/Bebop_Drone/thumb/
 
	DIFF_LIST="$(diff --brief $CTRL_THBD_DIR/cur $CTRL_THBD_DIR/prev | cut -d " " -f 4)"
	rm -rf $CTRL_THBD_DIR/prev
	mv $CTRL_THBD_DIR/cur $CTRL_THBD_DIR/prev
	mkdir $CTRL_THBD_DIR/cur	
	
	for f in $DIFF_LIST
	do
  		cd $DEST_DIR
		echo "process img $f"
		wget --quiet ftp://192.168.42.1/internal_000/Bebop_Drone/media/$(basename $f)	
	done
	
    sleep 1
done

rm -rf $DEST_DIR
rm -rf $CTRL_THBD_DIR

