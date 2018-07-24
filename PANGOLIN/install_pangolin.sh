#!/bin/bash

#update system
sudo apt-get update -y
sudo apt-get upgrade -y

#install devleoper tools
sudo apt-get install -y build-essential cmake pkg-config git

#install OpenGL
sudo apt-get install -y libgl1-mesa-dev
sudo apt-get install -y mesa-utils

#install Glew
sudo apt-get install -y libglew-dev

#installing video input and image dependencies
sudo apt-get install -y ffmpeg libavcodec-dev libavutil-dev libavformat-dev libswscale-dev libavdevice-dev
sudo apt-get install -y libjpeg-dev libpng-dev libtiff5-dev libopenexr-dev

#getting Pangolin
cd ~
git clone https://github.com/stevenlovegrove/Pangolin.git
cd Pangolin
mkdir build
cd build
cmake ..
cmake --build .