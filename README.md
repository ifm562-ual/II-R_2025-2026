<p align="center">
  <img src="https://img.shields.io/badge/ROS2-UAL-blue" alt="ROS2"/>
</p>

# Intelligent Robotics (II-R) 2025-2026

This repository contains the materials and scripts for the Intelligent Robotics subject of Computer Science degree in University of Almeria. Asumme host/container/VM runs a Ubuntu based distribution.



## Project Structure

- `installROS2Desktop.sh`: Installation script for ROS 2 Humble.
- `start.sh`: Script to source the ROS 2 environment and your local workspace.

## Getting Started

### Installation

To install ROS 2 Humble and set up the basic environment, you can run the provided installation script:

```bash
cd ros2-humble
./installROS2Desktop.sh
```

### Starting the Environment

Instead of manually sourcing the setups every time, you can use the `start.sh` script from the root of the repository:

```bash
source start.sh
```

This will source both the main ROS 2 Humble setup and your local `~/ros2_ws/install/setup.bash`.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
