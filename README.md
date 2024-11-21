# Jetson Nano - UB20 - ROS2 - Image and Installation

Welcome! This repository provides a pre-configured image for Jetson Nano running Ubuntu 20.04 and ROS2 (Foxy) along with instructions on how to install it yourself manually or just use the pre-build image.

## Pre-Built Image For Jetson Nano
I have created a pre-configured Jetson Nano Ubuntu 20.04 (Jetpack 4.6.1) image that comes with ROS2 Foxy pre-installed.

## Download The Image:
- **[Image](https://drive.google.com/file/d/1IWrIm-2_PBaE9ifxYteN5zBfBzE_Uoih/view?usp=sharing)**
- To verify the integrity of the image, use the **MD5 checksum** to be:
```
a0616282fe8aa25da4b26b6a3a8d1610
```
### Flash The Image:
1. Download the pre-built image file from the above link.
2. Flash the image to your microSD card using either **[balenaEtcher](https://www.balena.io/etcher)** or **[Raspberry Pi Image](https://www.raspberrypi.com/software/)**. You'll need a minimum storage of 32GB.
3. Insert the flashed microSD card into your Jetson Nano and you should be all set. If prompted for password - use **'jetson'**.

Once you boot up the Jetson Nano, ROS2 will be ready to use. The ROS2 Foxy installed on the image is with the GUI.

### To Verify ROS2 Installation:
- Open a terminal and run:
```bash
ros2 --version
```
- You should see a ROS 2 version. To run a demo and check if everything is working, opwn two terminal windows:

- In the first terminal, run the **talker** node:
```bash
ros2 run demo_nodes_cpp_talker
```

- In the second terminal, run the **listener** node:
```bash
ros2 run demo_nodes_cpp listener
```

- You should be able to see the listener node receiving messages sent by the talker node.

### After Installing:
- Once the system is up and running, update the packages for the latest fixes and enhancement:
```bash
sudo apt update
sudo apt upgrade
```

---
