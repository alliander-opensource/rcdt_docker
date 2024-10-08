# SPDX-FileCopyrightText: Alliander N. V.
#
# SPDX-License-Identifier: Apache-2.0

# #Install ros2 franka: https://support.franka.de/docs/franka_ros2.html
RUN apt install -y ros-humble-angles
RUN apt install -y ros-humble-generate-parameter-library
RUN apt install -y ros-humble-joint-state-publisher
RUN apt install -y ros-humble-joint-state-publisher-gui
RUN apt install -y ros-humble-pinocchio
RUN apt install -y ros-humble-realtime-tools
RUN apt install -y ros-humble-hardware-interface

RUN mkdir -p /home/$UNAME/franka_ros2_ws/src
WORKDIR /home/$UNAME/franka_ros2_ws
RUN git clone https://github.com/frankaemika/franka_ros2.git src/franka_ros2
RUN git clone https://github.com/frankaemika/franka_description.git src/franka_description
RUN . /opt/ros/humble/setup.sh && colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release
RUN echo "source /home/$UNAME/franka_ros2_ws/install/setup.bash" >> /home/$UNAME/.bashrc
