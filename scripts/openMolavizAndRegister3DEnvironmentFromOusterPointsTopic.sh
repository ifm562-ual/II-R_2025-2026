#!/bin/bash
ros2 launch mola_lidar_odometry ros2-lidar-odometry.launch.py \mola_deskew_method:=MotionCompensationMethod::IMU \lidar_topic_name:=/ouster/points imu_topic_name:=/ouster/imu mola_tf_base_link:=os_sensor
