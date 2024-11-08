# SPDX-FileCopyrightText: Alliander N. V.
#
# SPDX-License-Identifier: Apache-2.0

RUN apt install -y ros-humble-ament-cmake
RUN apt install -y ros-humble-ament-cmake-clang-format
RUN apt install -y ros-humble-ros2-controllers
RUN apt install -y ros-humble-ros2-control
RUN apt install -y ros-humble-ros2-control-test-assets
RUN apt install -y ros-humble-controller-manager
RUN apt install -y ros-humble-control-msgs
RUN apt install -y ros-humble-control-toolbox
RUN apt install -y ros-humble-xacro
RUN apt install -y ros-humble-ros-gz
RUN apt install -y ros-humble-ign-ros2-control
RUN apt install -y python3-colcon-common-extensions
RUN apt install -y python3-pip

# rcdt_detection
RUN apt install -y ros-humble-realsense2-camera
RUN apt install -y ros-humble-cv-bridge
RUN python3 -m pip install numpy opencv-python pyrealsense2 ultralytics
RUN python3 -m pip install matplotlib --force-reinstall
