#!/bin/bash

#update system
sudo apt-get update -y
sudo apt-get upgrade -y

#install devleoper tools
sudo apt-get install -y gcc g++ build-essential cmake unzip pkg-config

#install image I/O packages
sudo apt-get install -y libjpeg-dev libpng-dev libtiff-dev

#install video I/O packages
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev v4l-utils libv4l-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt-get install -y libxvidcore-dev libx264-dev

#install GTK library, dependency for OpenCV's highgui operations
sudo apt-get install -y libgtk-3-dev

#install optimized linear algebra libraries
sudo apt-get install -y libatlas-base-dev libatlas3-base gfortran liblapacke-dev

#get OpenCV repositories
cd ~/
wget -O opencv.zip https://github.com/opencv/opencv/archive/3.4.1.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/3.4.1.zip
unzip opencv.zip
unzip opencv_contrib.zip

#----------------------------------PYTHON SETUP W/VIRTUAL ENVIRONMENTS-------------------------------------------

#make sure python3 packages are installed
sudo apt-get install -y python3-dev python3-pip python3-tk python3-lxml python3-six python3-testresources

#install virual environment
sudo pip3 install virtualenv virtualenvwrapper

#install pip
wget https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py
rm -rf get-pip.py

#add virtual environment
echo -e "\n# virtualenv and virtualenvwrapper" >> ~/.bashrc
echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.bashrc
echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc

#source the ./bashrc file
source ~/.bashrc

#create a virual environment
mkvirtualenv cv -p python3

#switch to the virtual environment
workon cv

#install numpy
pip install numpy

#----------------------------------END PYTHON SETUP-------------------------------------------

#configure OpenCV
cd ~/opencv-3.4.1/
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
-D  BUILD_opencv_python3=ON \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D INSTALL_PYTHON_EXAMPLES=ON \
-D INSTALL_C_EXAMPLES=ON \
-D WITH_LIBV4L=ON \
-D WITH_V4L=ON \
-D WITH_FFMPEG=ON \
-D WITH_GSTREAMER=ON \
-D WITH_OPENCL=ON \
-D WITH_OPENGL=ON \
-D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-3.4.1/modules \
-D PYTHON_EXECUTABLE=~/.virtualenvs/cv/bin/python3 \
-D PYTHON_INCLUDE=/usr/lib/x86_64-linux-gnu/libpython3.6m.so.1.0 \
-D PYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.6m.so \
-D PYTHON_PACKAGES_PATH=/usr/local/lib/python3.6/site-packages/ \
-D PYTHON_NUMPY_INCLUDE_DIR=/usr/local/lib/python3.6/dist-packages/numpy/core/include \
-D BUILD_EXAMPLES=ON ..
#compiling OpenCV may  take >30mins, replace 4 with number of threads to compile on
make -j2

#install OpenCV
sudo make install
sudo ldconfig

#cleanup unneeded dependencies
sudo apt-get autoremove -y

#remove zip folders
cd ~
rm -rf opencv.zip
rm -rf opencv_contrib.zip

#rename python library
cd /usr/local/lib/python3.6/site-packages/
sudo mv cv2.cpython-36m-x86_64-linux-gnu.so cv2.so

#link library to virtual envrionment
cd ~/.virtualenvs/cv/lib/python3.6/site-packages/
ln -s /usr/local/lib/python3.6/site-packages/cv2.so cv2.so

#confirm installation
echo "----------INSTALLATION COMPLETE OPENCV VERSION NUMBER BELOW----------"
pkg-config --modversion opencv
