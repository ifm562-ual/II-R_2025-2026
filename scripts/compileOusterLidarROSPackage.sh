#!/bin/bash
cd ~/ros2_ws/src
# Make sure ROS2 main binaries are sourced in current terminal
source /opt/ros/humble/setup.bash
git clone -b humble-devel https://github.com/ouster-lidar/ouster-ros.git
cd ..
# Make sure libzip is in system
sudo apt update
sudo apt install libzip-dev
# Install all dependencies of that package
rosdep update
rosdep install --from-paths src --ignore-src -r -y
colcon build --packages-up-to ouster_ros
source install/setup.bash

