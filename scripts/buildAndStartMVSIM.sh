#!/bin/bash
mkdir ~/mvsim
cd ~/mvsim

# Clone repository
git clone https://github.com/MRPT/mvsim.git --recursive

# Build
colcon build

# Update ROS environment
source install/setup.bash

# Load sim
ros2 launch mvsim demo_jackal.launch.py
