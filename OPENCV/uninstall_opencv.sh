#!/bin/bash

#purge image I/O packages
sudo apt-get purge -y libjpeg-dev libpng-dev libtiff-dev

#purge video I/O packages
sudo apt-get purge -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get purge -y libxvidcore-dev libx264-dev

#purge GTK library, dependency for OpenCV's highgui operations
sudo apt-get purge -y libgtk-3-dev

#purge optimized linear algebra libraries
sudo apt-get purge -y libatlas-base-dev libatlas3-base gfortran liblapacke-dev

#remove pip
python -m pip uninstall pip setuptools

#delete virtual environment
rmvirtualenv cv

#purge virtualenv and wrapper
sudo apt-get purge -y virtualenv virtualenvwrapper

#rename python library
cd /usr/local/lib/python3.6/site-packages/
sudo mv  cv2.so cv2.cpython-36m-x86_64-linux-gnu.so

#uninstall OpenCV
cd ~/opencv-3.4.1/build
sudo make uninstall

cd ~
rm -rf opencv-3.4.1
rm -rf opencv_contrib-3.4.1

#clean up unneeded dependencies
sudo apt-get autoremove -y
echo "---------------------------UNINSTALL COMPLETE----------------------------"
echo "PLEASE REMOVE THE FOLLOWING LINES FROM THE END OF ~/.bashrc"
echo "# virtualenv and virtualenvwrapper"
echo "export WORKON_HOME=$HOME/.virtualenvs"
echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3"
echo "source /usr/local/bin/virtualenvwrapper.sh"