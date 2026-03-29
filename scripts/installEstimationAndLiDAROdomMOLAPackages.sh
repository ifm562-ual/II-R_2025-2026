#!/bin/bash
# Purge existing ROS MOLA packages
sudo apt purge -y ros-humble-mola* || true

# Workspace setup
ROS2_WS=~/ros2_ws
mkdir -p "$ROS2_WS/src/mola"
cd "$ROS2_WS/src/mola"

# Clone main MOLA repos (with correct versions)
git clone -b 2.5.0 --recurse-submodules https://github.com/MOLAorg/mola.git
git clone -b 2.1.0 --recurse-submodules https://github.com/MOLAorg/mola_state_estimation.git
git clone -b 1.3.1 --recurse-submodules https://github.com/MOLAorg/mola_lidar_odometry.git

# Clone additional required dependencies
git clone --recurse-submodules https://github.com/MOLAorg/mola_common.git
git clone --recurse-submodules https://github.com/MOLAorg/mp2p_icp.git
git clone --recurse-submodules https://github.com/MOLAorg/mola_test_datasets.git
git clone --recurse-submodules https://github.com/MOLAorg/mola_imu_preintegration.git
git clone --recurse-submodules https://github.com/MOLAorg/mola_sm_loop_closure.git

# Clean previous build/install/logs
cd "$ROS2_WS"
rm -rf build/ install/ log/

# Source ROS 2 Humble
source /opt/ros/humble/setup.bash

# Make sure all dependencies are installed
rosdep install --from-paths src --ignore-src -r -y


colcon  build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebInfo
