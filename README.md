# blueBirdServer
Complete server tools for LSD SLAM interrogation and model rescaling, with associated python drone pilot stack

## To see demos :

check scripts in demos folder

## Prequisite : 

* Ubuntu 14.04
* Not on virtual machine (?)

## Install process

### 0/ Clone in home/demo

> If required, create demo user
> Git clone this project, keep its name unmodified

### 1/ Install ROS

(Process from http://wiki.ros.org/indigo/Installation/Ubuntu)

Run :

    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'
    sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116
    sudo apt-get update
    sudo apt-get install ros-indigo-desktop-full ros-indigo-ros-base
    sudo rosdep init
    rosdep update
    echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
    source ~/.bashrc
    sudo apt-get install python-rosinstall

### 2/ Install package tools and dependencies

(Process from https://github.com/tum-vision/lsd_slam)

Run :

    mkdir ~/rosbuild_ws
    cd ~/rosbuild_ws
    rosws init . /opt/ros/indigo
    mkdir package_dir
    rosws set ~/rosbuild_ws/package_dir -t .
    echo "source ~/rosbuild_ws/setup.bash" >> ~/.bashrc
    bash
    cd package_dir
    sudo apt-get install ros-indigo-libg2o ros-indigo-cv-bridge liblapack-dev libblas-dev freeglut3-dev libqglviewer-dev libsuitesparse-dev libx11-dev
    cd ~/rosbuild_ws/package_dir
    export ROS_PACKAGE_PATH=$ROS_PACKAGE_PAT:`pwd`
    git clone https://github.com/tum-vision/lsd_slam.git lsd_slam
    cd ~/rosbuild_ws/package_dir
    rosmake lsd_slam
    sudo su – 
    roscore

### 3/ First demo start

Need to have downloaded first the bag.zip file and unziped it

Run :

    cd ~/rosbuild_ws/package_dir
    curl -O http://vmcremers8.informatik.tu-muenchen.de/lsd/LSD_room.bag.zip
    unzip LSD_room.bag.zip
    rosrun lsd_slam_viewer viewer

From an other terminal :

    rosrun lsd_slam_core live_slam image:=/image_raw camera_info:=/camera_info

And then :

    rosbag play ./LSD_room.bag

## Other demo launch

When you start again LSD SLAM from an existing install, follow these steps

In first terminal

    cd ~/rosbuild_ws/package_dir
    export ROS_PACKAGE_PATH=$ROS_PACKAGE_PAT:`pwd`
    sudo su – 
    roscore

Open a second tab, and do

    cd ~/rosbuild_ws/package_dir
    rosrun lsd_slam_viewer viewer

Open a third tab, and do

    cd ~/rosbuild_ws/package_dir
    rosrun lsd_slam_core live_slam image:=/image_raw camera_info:=/camera_info

And then, on an other terminal tab :

    cd ~/rosbuild_ws/package_dir
    rosbag play ./LSD_room.bag

## Script demo !!!

### Prerequisites 

You need a user "demo" with /home/demo as home folder

You need to allow sudo without password for him : 

    sudo visudo
    # search for 
    %admin ALL=(ALL) ALL
    # and update it like 
    %admin ALL=(ALL) NOPASSWD: ALL
    
Some packages to install :

    sudo apt-get install Imagemagick 
    ## Should be necessary only with ubuntu 14.04
    sudo add-apt-repository ppa:kirillshkrogalev/ffmpeg-next && sudo apt-get update -qq
    sudo apt-get update
    sudo apt-get install ffmpeg


## Python stack

    sudo apt-get install build-essential curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev python-pip libopencv-dev libcv-dev python-pygame
    cd ~/
    mkdir pilot
    git clone https://github.com/robotika/katarina.git
    pip install flask
        
        
        
## Other remarks

### Some guides about ROS

* see http://www.icg.tugraz.at/courses/ARVU/install.pdf
* ROS tutorial http://wiki.ros.org/ROS/Tutorials

### Notes run

Before using a ros make or run, from package_dir do :

    export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:`pwd`

### See also

https://github.com/robotika/katarina
