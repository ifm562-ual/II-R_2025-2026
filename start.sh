#!/bin/bash

# Source the main ROS2 setup
source /opt/ros/humble/setup.bash

# Source the workspace setup if it exists
if [ -f ~/ros2_ws/install/setup.bash ]; then
    source ~/ros2_ws/install/setup.bash
    echo "ROS2 Humble and workspace environment sourced."
else
    echo "ROS2 Humble environment sourced. Workspace not found at ~/ros2_ws/install/setup.bash"
fi
