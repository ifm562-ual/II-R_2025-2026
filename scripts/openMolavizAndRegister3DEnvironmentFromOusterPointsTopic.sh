#!/bin/bash
# Make sure ROS2 main binaries are sourced in current terminal
source /opt/ros/humble/setup.bash

sudo apt update && sudo apt install --only-upgrade \
  ros-humble-mrpt-libbase \
  ros-humble-mrpt-libgui \
  ros-humble-mrpt-libhwdrivers \
  ros-humble-mrpt-libmaps \
  ros-humble-mrpt-libmath \
  ros-humble-mrpt-libobs \
  ros-humble-mrpt-libopengl \
  ros-humble-mrpt-libposes \
  ros-humble-mrpt-libslam \
  ros-humble-mrpt-libtclap \
  ros-humble-mrpt-libros-bridge \
  ros-humble-mrpt-msgs \
  ros-humble-mrpt-nav-interfaces

sudo ldconfig

ros2 launch mola_lidar_odometry ros2-lidar-odometry.launch.py \mola_deskew_method:=MotionCompensationMethod::IMU \lidar_topic_name:=/ouster/points imu_topic_name:=/ouster/imu mola_tf_base_link:=os_sensor
