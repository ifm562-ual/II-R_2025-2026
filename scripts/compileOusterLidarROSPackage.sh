#!/bin/bash
cd ~/ros2_ws/src
git clone -b humble-devel https://github.com/ouster-lidar/ouster-ros.git
cd ..
colcon build --packages-select ouster-ros
source install/setup.bash

