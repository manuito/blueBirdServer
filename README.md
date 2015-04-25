# blueBirdServer
Web-Service, LSD SLAM interrogation and model rescaling

## Prequisite : 

* Ubuntu 14.04
* Not on virtual machine (?)

## Install process

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

    sudo apt-get install python-rosinstall
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
    rosmake lsd_slam
    sudo –s roscore

### 3/ Start demo

Need to have download first the bag.zip file and unziped it

Run :

    cd ~/rosbuild_ws/package_dir
    curl -O http://vmcremers8.informatik.tu-muenchen.de/lsd/LSD_room.bag.zip
    unzip LSD_room.bag.zip
    rosrun lsd_slam_viewer viewer

From an other terminal :

    rosrun lsd_slam_core live_slam image:=/image_raw camera_info:=/camera_info

And then :

    rosbag play ~/LSD_room.bag

## Remarks

* see http://www.icg.tugraz.at/courses/ARVU/install.pdf
* ROS tutorial http://wiki.ros.org/ROS/Tutorials

## Notes run
Before using a ros make or run, from package_dir do :

    export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:`pwd`
