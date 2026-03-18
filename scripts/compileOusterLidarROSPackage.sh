#!/bin/bash
cd ~/ros2_ws/src
git clone -b humble-devel https://github.com/ouster-lidar/ouster-ros.git
cd ..
# Make sure libzip is in system
sudo apt update
sudo apt install libzip-dev
# Install all dependencies of that package
colcon build --packages-up-to ouster_ros
source install/setup.bash

