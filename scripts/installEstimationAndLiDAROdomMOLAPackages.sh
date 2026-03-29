#!/bin/bash
#sudo apt update
# Latest packages seem to be broken for our use, fall back to latest known working packages
#sudo apt install ros-humble-mola \ros-humble-mola-state-estimation \ros-humble-mola-lidar-odometry

set -e  # stop on error

sudo apt update

cd ../deb/

sudo apt purge -y ros-humble-mola \
                   ros-humble-mola-state-estimation \
                   ros-humble-mola-lidar-odometry

# Install local .deb packages (from current script directory or specify path)
sudo apt install ./ros-humble-mola_2.5.0-1jammy.20260219.040438_amd64.deb \
                 ./ros-humble-mola-state-estimation_2.1.0-1jammy.20260217.045414_amd64.deb \
                 ./ros-humble-mola-lidar-odometry_1.3.1-1jammy.20260219.040447_amd64.deb

# Fix any missing dependencies automatically
sudo apt --fix-broken install -y
