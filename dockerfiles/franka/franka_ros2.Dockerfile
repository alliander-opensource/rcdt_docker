# SPDX-FileCopyrightText: Alliander N. V.
#
# SPDX-License-Identifier: Apache-2.0

#Install ros2 franka: https://support.franka.de/docs/franka_ros2.html
RUN apt install -y ros-humble-angles
RUN apt install -y ros-humble-generate-parameter-library
RUN apt install -y ros-humble-joint-state-publisher
RUN apt install -y ros-humble-joint-state-publisher-gui
RUN apt install -y ros-humble-pinocchio
RUN apt install -y ros-humble-realtime-tools
RUN apt install -y ros-humble-hardware-interface


# RUN apt install -y ros-humble-ament-cmake
# RUN apt install -y ros-humble-ament-cmake-clang-format
# RUN apt install -y ros-humble-angles
# RUN apt install -y ros-humble-ros2-controllers
# RUN apt install -y ros-humble-ros2-control
# RUN apt install -y ros-humble-ros2-control-test-assets
# RUN apt install -y ros-humble-controller-manager
# RUN apt install -y ros-humble-control-msgs
# RUN apt install -y ros-humble-control-toolbox
# RUN apt install -y ros-humble-generate-parameter-library
# RUN apt install -y ros-humble-joint-state-publisher
# RUN apt install -y ros-humble-joint-state-publisher-gui
# RUN apt install -y ros-humble-moveit
# RUN apt install -y ros-humble-pinocchio
# RUN apt install -y ros-humble-realtime-tools
# RUN apt install -y ros-humble-xacro
# RUN apt install -y ros-humble-hardware-interface
# RUN apt install -y ros-humble-ros-gz
# RUN apt install -y python3-colcon-common-extensions

RUN mkdir -p /home/$UNAME/franka_ros2_ws/src
WORKDIR /home/$UNAME/franka_ros2_ws
RUN git clone https://github.com/frankaemika/franka_ros2.git src/franka_ros2
RUN git clone https://github.com/frankaemika/franka_description.git src/franka_description
RUN . /opt/ros/humble/setup.sh && colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release
RUN echo "source /home/$UNAME/franka_ros2_ws/install/setup.bash" >> /home/$UNAME/.bashrc
