#!/bin/bash
set -e

SERVER_DIR=/home/demo/blueBirdServer
FILENAME=$(ls $SERVER_DIR/slam/load/raw/$1/*.mp4)

echo "process file $FILENAME"

# make sure it's just one file
if [ ! -f $FILENAME ]; then
    echo "File not found!"
    exit 1
fi

cd $SERVER_DIR/slam/load/raw/

# crop the video from 1920x1080 to 1440x1080 (aspect ratio match)
ffmpeg -i $FILENAME -filter:v "crop=1440:1080" -c:a copy correct_aspect_ratio.mp4

## Check convert done, else stop script
if [ ! -f correct_aspect_ratio.mp4 ]; then
    echo "Convert failed!"
    exit 1	
fi


# size down to 640x480
ffmpeg -i correct_aspect_ratio.mp4 -filter:v "scale=640:-1" -c:a copy smaller.mp4

# change to images
mkdir images
ffmpeg -i smaller.mp4 images/image%6d.png

for f in ./images/*.png
do
    convert -colorspace gray $f $f
    echo "done processing:" $f
done

# clean up...
rm correct_aspect_ratio.mp4
rm smaller.mp4

mv $SERVER_DIR/slam/load/raw/images $SERVER_DIR/slam/load/dataset/img/$1

