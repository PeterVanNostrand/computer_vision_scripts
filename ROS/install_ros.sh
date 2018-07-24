#!/bin/bash

#install devleoper tools
sudo apt-get install -y gcc g++ build-essential cmake pkg-config

#setup  sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

#setup keys
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

#update system
sudo apt-get update -y
sudo apt-get upgrade -y

#install ROS
sudo apt-get install -y ros-melodic-desktop-full

#initialize rosdep
sudo rosdep init
rosdep update

#add ros to environment
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc

#add rosinstall for extra packages
sudo apt-get install -y python-rosinstall python-rosinstall-generator python-wstooll