# SPDX-FileCopyrightText: Alliander N. V.
#
# SPDX-License-Identifier: Apache-2.0

# #Install ros2 franka: https://support.franka.de/docs/franka_ros2.html
RUN apt install -y ros-${ROS_DISTRO}-ament-cmake
RUN apt install -y ros-${ROS_DISTRO}-ament-cmake-clang-format
RUN apt install -y ros-${ROS_DISTRO}-angles
RUN apt install -y ros-${ROS_DISTRO}-ros2-controllers
RUN apt install -y ros-${ROS_DISTRO}-ros2-control
RUN apt install -y ros-${ROS_DISTRO}-ros2-control-test-assets
RUN apt install -y ros-${ROS_DISTRO}-controller-manager
RUN apt install -y ros-${ROS_DISTRO}-control-msgs
RUN apt install -y ros-${ROS_DISTRO}-control-toolbox
RUN apt install -y ros-${ROS_DISTRO}-generate-parameter-library
RUN apt install -y ros-${ROS_DISTRO}-joint-state-publisher
RUN apt install -y ros-${ROS_DISTRO}-joint-state-publisher-gui
RUN apt install -y ros-${ROS_DISTRO}-moveit
RUN apt install -y ros-${ROS_DISTRO}-pinocchio
RUN apt install -y ros-${ROS_DISTRO}-realtime-tools
RUN apt install -y ros-${ROS_DISTRO}-xacro
RUN apt install -y ros-${ROS_DISTRO}-hardware-interface
RUN apt install -y ros-${ROS_DISTRO}-ros-gz
RUN apt install -y ros-${ROS_DISTRO}-gz-ros2-control
RUN apt install -y python3-colcon-common-extensions

RUN mkdir -p /home/$UNAME/franka_ros2_ws/src
WORKDIR /home/$UNAME/franka_ros2_ws
RUN git clone https://github.com/frankaemika/franka_ros2.git src/franka_ros2
RUN git clone https://github.com/frankaemika/franka_description.git src/franka_description

# Some packages are compatible for ROS2 jazzy:
RUN . /opt/ros/${ROS_DISTRO}/setup.sh && colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release --packages-ignore joint_trajectory_controller franka_ign_ros2_control franka_semantic_components franka_robot_state_broadcaster franka_example_controllers

# Some packages are only compatible with ROS2 humble:
RUN if [ "$ROS_DISTRO" = "humble" ] ; then \ 
    . /opt/ros/${ROS_DISTRO}/setup.sh && colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release --packages-select joint_trajectory_controller franka_ign_ros2_control franka_semantic_components franka_robot_state_broadcaster franka_example_controllers ; else : ; fi

RUN echo "source /home/$UNAME/franka_ros2_ws/install/setup.bash" >> /home/$UNAME/.bashrc

#Define GZ_SIM_RESOURCE_PATH:
ENV GZ_SIM_RESOURCE_PATH="/home/$UNAME/franka_ros2_ws/src/"