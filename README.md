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

## Manual Installation:

- Download a Bare image running Ubuntu20.04 on Jetson Nano **[here](https://ln5.sync.com/dl/7261d3770/jebr2z9k-kwj4wwvd-3wxjtqsx-36zbu3cx/view/default/11304887590004)**. Credits to people over at **[QEngineering](https://github.com/Qengineering)** for this.
- This image is overclocked at 1900MHz, so plan of using a fan to cool the Jetson when running this image. Also use the 5V 4A 20W barrel jack power supply for better perfomance.

### Pre-installed software.

Clicking on the links below will direct you to QEngineering's installation guide:
- [OpenCV](https://qengineering.eu/install-opencv-on-jetson-nano.html) 4.8.0
- [TensorFlow](https://qengineering.eu/install-tensorflow-2.4.0-on-jetson-nano.html) 2.4.1
- [Pytorch](https://qengineering.eu/install-pytorch-on-jetson-nano.html) 1.13.0
- [TorchVision](https://qengineering.eu/install-pytorch-on-jetson-nano.html) 0.14.0
- [TensorRT](https://github.com/Qengineering/Jetson-Nano-Ubuntu-20-image/issues/11) 8.0.1.6
- [TeamViewer aarch64](https://www.teamviewer.com/en/download/linux/) 15.24.5
- [Jtop](https://github.com/rbonghi/jetson_stats) 4.2.1

Tensorflow 2.5 and above, just like PyTorch 2.0, requires CUDA 11. CUDA version 11 cannot be installed on a Jetson Nano due to incompatibility between the GPU and low-level software.

## Installing Foxy (Manually):

* First and foremost
```bash
sudo apt update
sudo apt upgrade
```
* Add CUDA path to .bashrc
```bash
gedit .bashrc
export PATH=${PATH}:/usr/local/cuda/bin
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/cuda/lib64
```
* Test CUDA functionality
```bash
/usr/local/cuda-10.2/bin/cuda-install-samples-10.2.sh .
cd NVIDIA_CUDA-10.2_Samples/
make HOST_COMPILER=/usr/bin/g++-7
./bin/aarch64/linux/release/deviceQuery
```
* You should get an output similar to
```bash
./bin/aarch64/linux/release/deviceQuery Starting...

CUDA Device Query (Runtime API) version (CUDART static linking)

Detected 1 CUDA Capable device(s)
.
.
.
Result = PASS
```

* Now, after setting all of this up you can follow the steps to install ROS2 Foxy with the instructions **[here](https://docs.ros.org/en/foxy/Installation/Ubuntu-Install-Debians.html)**. Choose if you want the version with the GUI or without the GUI.

* Finally to setup the environment
```bash
echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc
```
* Verify using the steps mentioned **[here](#to-verify-ros2-installation)**.

## Installing Foxy (Using Script):
- Install the bare Ubuntu20.04 image from **[here](https://ln5.sync.com/dl/7261d3770/jebr2z9k-kwj4wwvd-3wxjtqsx-36zbu3cx/view/default/11304887590004)** before running the scripts.
1. Choose the script based on your preference:
   - [With GUI](https://github.com/parthbhangla/JetsonNano-ROS2-UB20/blob/main/scripts/setup_cuda_foxy_with_gui.sh)
   - [Without GUI](https://github.com/parthbhangla/JetsonNano-ROS2-UB20/blob/main/scripts/setup_cuda_foxy_without_gui.sh)
2. Download the selected script to your Jetson Nano.
3. Make the script executable:
```bash
chmod +x setup_cuda_foxy_with_gui.sh # For GUI
chmod +x setup_cuda_foxy_without_gui.sh # For without GUI
```
4. Run the script:
```bash
./setup_cuda_foxy_with_gui.sh # For GUI
./setup_cuda_foxy_without_gui.sh # For without GUI
```

---
### Credits:
- **[QEngineering](https://github.com/Qengineering)** - has a lot of other guides and resources about Jetson Nano. Great resource!

- **[JetsonNano ROS2](https://github.com/CollaborativeRoboticsLab/JetsonNano-ROS2)** by [Kalana Ratnayake](https://github.com/KalanaRatnayake)** - has a guide on how to install ROS2 Humble using Docker image. Check it out!
---
### Doubts / Questions:
- Raise an issue. I will try my best to answer it.

### Contributions:

- All contributions are welcome. Fork the repository and open a pull request.
---

Leave a star if it helped you out. Best of luck!
