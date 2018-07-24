#!/bin/bash

#update system
sudo apt-get update -y
sudo apt-get upgrade -y

#install devleoper tools
sudo apt-get install -y gcc g++ build-essential cmake pkg-config libeigen3-dev

#Building ORB-SLAM2 library and examples
cd ~
git clone https://github.com/raulmur/ORB_SLAM2.git ORB_SLAM2
cd ORB_SLAM2
chmod +x build.sh
source build.sh

#For known issues see
#https://github.com/raulmur/ORB_SLAM2/issues/337
#https://github.com/raulmur/ORB_SLAM2/pull/507