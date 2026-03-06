FROM ros:humble

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install useful tools
RUN apt update && apt install -y \
    python3-colcon-common-extensions \
    python3-rosdep \
    python3-vcstool \
    git \
    nano \
    && rm -rf /var/lib/apt/lists/*

# Initialize rosdep
RUN rosdep init || true
RUN rosdep update

# Create workspace
WORKDIR /ros2_ws
RUN mkdir -p src

# Source ROS automatically
RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc

CMD ["bash"]
