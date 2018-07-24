#!/bin/bash

#SKIP IF INSTALLING ROS
#update system
sudo apt-get update -y
sudo apt-get upgrade -y

#install devleoper tools
sudo apt-get install -y gcc g++ build-essential cmake unzip pkg-config

#download Eigen
cd ~
wget http://bitbucket.org/eigen/eigen/get/3.3.4.zip
unzip 3.3.4.zip
rm -rf 3.3.4.zip

#making and installing Eigen
cd eigen-eigen-5a0156e40feb
mkdir build
cd build
cmake ..