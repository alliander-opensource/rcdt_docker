# SPDX-FileCopyrightText: Alliander N. V.
#
# SPDX-License-Identifier: Apache-2.0

#Pull the base image:
FROM osrf/ros:${ROS_DISTRO}-desktop-full
ENV PIP_BREAK_SYSTEM_PACKAGES 1
ARG UNAME
ARG UID
ARG GID
RUN apt update

#Remove existing user with same UID if exists:
RUN if getent passwd $UID; then userdel $(id -nu $UID); else :; fi

#Add user:
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -p "$(openssl passwd -1 $UNAME)" $UNAME
RUN usermod -aG sudo $UNAME
RUN usermod -aG dialout $UNAME 

# Set .bashrc:
COPY ./bashrc/.bashrc /home/$UNAME/.bashrc
RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> /home/$UNAME/.bashrc