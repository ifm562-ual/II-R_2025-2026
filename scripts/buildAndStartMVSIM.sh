#!/bin/bash
mkdir ~/mvsim
cd ~/mvsim

# Make sure ROS2 main binaries are sourced in current terminal
source /opt/ros/humble/setup.bash

# Clone repository
git clone https://github.com/MRPT/mvsim.git --recursive

# Make sure

# Install all dependencies
rosdep install --from-paths . -y --ignore-src

# Build
colcon build

# Update ROS environment
source install/setup.bash

# Load sim
ros2 launch mvsim demo_jackal.launch.py
