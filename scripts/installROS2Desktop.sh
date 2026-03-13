#!/bin/bash
locale  # check for UTF-8

sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale  # verify settings


# Ensure Ubuntu Universe repository is enabled
sudo apt install software-properties-common
sudo add-apt-repository universe

sudo apt install curl -y

# Install ros2-apt-source
sudo apt update && sudo apt install curl -y
export ROS_APT_SOURCE_VERSION=$(curl -s https://api.github.com/repos/ros-infrastructure/ros-apt-source/releases/latest | grep -F "tag_name" | awk -F\" '{print $4}')
curl -L -o /tmp/ros2-apt-source.deb "https://github.com/ros-infrastructure/ros-apt-source/releases/download/${ROS_APT_SOURCE_VERSION}/ros2-apt-source_${ROS_APT_SOURCE_VERSION}.$(. /etc/os-release && echo ${UBUNTU_CODENAME:-${VERSION_CODENAME}})_all.deb"
sudo dpkg -i /tmp/ros2-apt-source.deb

sudo apt update && sudo apt upgrade

# Install common packages
sudo apt update && sudo apt install -y \
  python3-flake8-docstrings \
  python3-pip \
  python3-pytest-cov \
  ros-dev-tools

# Install ROS2 Humble Desktop
sudo apt install ros-humble-desktop

# Initialize ros in current shell
/opt/ros/humble/setup.bash

# Install ROS navigation packages
sudo apt install ros-$ROS_DISTRO-navigation2

# Install Navigation2 framework
sudo apt install ros-$ROS_DISTRO-nav2-bringup

# Ensure git is installed
sudo apt install git

# Install colcon packages
sudo apt install python3-colcon-common-extensions

# Install tools to compile ROS2 packages
sudo apt install python3-rosdep2

# Install MOLA mapping packages
sudo apt install \ ros-$ROS_DISTRO-mola \ ros-$ROS_DISTRO-mola-state-estimation \ ros-$ROS_DISTRO-mola-lidar-odometry

# Install TurtleBot3 packages
sudo apt install ros-${ROS_DISTRO}-turtlebo3-navigation2

# Install Gazebo simulator
sudo apt install gazebo

# Install robot movement control panel
sudo apt-get install ros-$ROS_DISTRO-teleop-twist-keyboard

# Create ROS 2's workspace
mkdir -p ~/ros2_ws/src

cd ~/ros2_ws/src/
# Clone ROS2 workspace
git clone https://github.com/cyberbotics/webots_ros2.git

cd webots_ros2/

# Download all git submodules
git submodule update --init --recursive

cd ../..

# Update ROS dependencies
rosdep update

# Install all dependencies for workspace's packages
rosdep install --from-paths src -y --ignore-src

# Compile all workspace's packages
colcon build

# Automatically add environment into a new shell
echo "source ~/ros2_ws/install/setup.bash" >> ~/.bashrc
