#!/bin/bash

# Script for setting up CUDA and ROS 2 Foxy
# Credits: Parth Bhangla

# Update and upgrade system
echo "Updating and upgrading system..."
sudo apt update && sudo apt upgrade -y

# Edit .bashrc for CUDA paths
echo "Editing .bashrc for CUDA environment variables..."
echo "export PATH=\${PATH}:/usr/local/cuda/bin" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=\${LD_LIBRARY_PATH}:/usr/local/cuda/lib64" >> ~/.bashrc

# Install CUDA samples and build them
echo "Installing CUDA samples..."
/usr/local/cuda-10.2/bin/cuda-install-samples-10.2.sh .
cd NVIDIA_CUDA-10.2_Samples/
make HOST_COMPILER=/usr/bin/g++-7

# Verify CUDA installation
echo "Running deviceQuery to verify CUDA installation..."
./bin/aarch64/linux/release/deviceQuery

# Check and configure locale settings
echo "Checking and configuring locale settings..."
locale  # Display current locale
sudo apt update && sudo apt install locales -y
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
locale  # Verify settings

# Add required repositories and install ROS 2 Foxy
echo "Adding ROS 2 Foxy repositories and installing dependencies..."
sudo apt install software-properties-common -y
sudo add-apt-repository universe -y
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=\$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu \$(. /etc/os-release && echo \$UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
sudo apt update && sudo apt upgrade -y
sudo apt install ros-foxy-desktop python3-argcomplete -y
sudo apt install ros-dev-tools -y

# Add ROS 2 Foxy source to .bashrc
echo "Adding ROS 2 Foxy setup script to .bashrc..."
echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc

# Final message
echo "Setup completed. Please restart your terminal or run 'source ~/.bashrc' to apply changes."
echo "Credits: Parth Bhangla"
