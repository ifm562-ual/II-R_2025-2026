# ROS 2 Humble Docker Environment

This project provides a ROS 2 Humble development environment using Docker.

## Getting Started

### 1. Start the Container
To build and start the container in the background, run:
```bash
docker compose up -d
```

### 2. Access the Interactive Shell
To open an interactive bash shell inside the running container:
```bash
docker compose exec ros2 bash
```

### 3. Install Demo Nodes
Once inside the container, run the following commands to update the package list and install the ROS 2 demo nodes:

```bash
apt update
apt install -y ros-humble-demo-nodes-cpp ros-humble-demo-nodes-py
```

### 4. Run the Demos
After installation, you can run the talker and listener demos in separate terminals (you will need to open another interactive shell for the second command):

**Terminal 1 (Talker):**
```bash
ros2 run demo_nodes_cpp talker
```

**Terminal 2 (Listener):**
```bash
ros2 run demo_nodes_py listener
```
