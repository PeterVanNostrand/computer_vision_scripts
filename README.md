# computer_vision_scripts
Installation scripts and files for popular computer vision software

This commit contins the work in progress scripts to install OpenCV 3.4.1
ORBSLAM2 Pangolin and Eigen.

# OpenCV:
 - Will successfully install opencv 3.4.1 with opencv directory in the root
 - Currently does not automatically install opengl
 - Once complete the folders ~/opencv-3.4.1 and ~/opencvcontrib-3.4.1
   can be deleted safely to save ~10GB of space, but a rebuild will
   require completely recompiling opencv using cmake

# Pangolin:
 - Successfully runs and installs Pangolin as required by ORBSLAM2

# Eigen:
 - This script is likely unncessary as eigen can now be installed via
   apt-get. The appropriate command is included in the ORBSLAM script

# ORBSLAM2:
 - This installation script currently does not run independently
 - Execute the script on line at a time manually. After cloning the
   orbslam github copy the contents of the 'changed files' directory
   into the orbslam directory.  This will overwrite several files that
   contain errors by default
 - OpenCV and Pangolin must be installed before this process is done

