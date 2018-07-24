INSTALLATION:
The included script 'install_opencv.sh' will install OpenCV 3.4.1 and all required dependencies.  It will configure OpenCV to use Python3.6 in a virtual environment and C++
To run the script: open a terminal, navitage to this directory, and type 'source ./install_opencv.sh' 
NOTE: using './install_opencv.sh' will not work as this creates a new terminal context which prevents virutalenv from being added as a command
Installation will take approximately 45 mins for a standard laptop and requires ~10GB of free storage space
You will need to enter a sudo password at the start of the script and again halfway through
Once installation is complete the directories '~/opencv-3.4.1' and 'opencv_contrib-3.4.1' can be deleted to reclaim some of this space
The virtual environment can be launced simply by typing 'workon cv' into any terminal window
To exit the virtual environment use the command 'deactivate'
Installation procedure taken from PyImageSearch's "Ubuntu 18.04: How to install OpenCV" which can be found at
https://pyimagesearch.com/2018/05/28/ubuntu-18-04-how-to-install-opencv/

INSTALLATION:
The included script 'uninstall_opencv.sh' will attempt to remove OpenCV and its associated dependencies
Note that this is largely untested and is unlikely to work completely if the '~/opencv-3.4.1' directory has been deleted or moved
To run the script: open a terminal, navitage to this directory, and type 'source ./uninstall_opencv.sh' 
Once complete edit the file '~/.bashrc' as indicated by the script output to remove virtualenv links
