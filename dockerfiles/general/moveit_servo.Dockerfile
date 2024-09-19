# SPDX-FileCopyrightText: Alliander N. V.
#
# SPDX-License-Identifier: Apache-2.0

RUN apt clean && apt update
RUN apt install -y ros-${ROS_DISTRO}-moveit-servo
RUN apt install -y python3-pip
RUN pip install dearpygui
RUN pip install dearpygui-grid
RUN pip install typing_extensions
RUN pip install pygame