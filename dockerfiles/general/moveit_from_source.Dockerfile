# SPDX-FileCopyrightText: Alliander N. V.
#
# SPDX-License-Identifier: Apache-2.0

#Install moveit2 from source: https://moveit.ai/install-moveit2/source/
RUN mkdir -p /home/$UNAME/moveit_ws/src
WORKDIR /home/$UNAME/moveit_ws/src
RUN git clone https://github.com/alliander-opensource/moveit2.git -b main
RUN for repo in moveit2/moveit2.repos $(f="moveit2/moveit2_$ROS_DISTRO.repos"; test -r $f && echo $f); do vcs import < "$repo"; done
RUN rosdep install -r --from-paths . --ignore-src --rosdistro $ROS_DISTRO -y

WORKDIR /home/$UNAME/moveit_ws
RUN . /opt/ros/$ROS_DISTRO/setup.sh && \
    colcon build --event-handlers desktop_notification- status- --cmake-args -DCMAKE_BUILD_TYPE=Release
RUN echo "source /home/$UNAME/moveit_ws/install/setup.bash" >> /home/$UNAME/.bashrc