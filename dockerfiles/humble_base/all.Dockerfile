# SPDX-FileCopyrightText: Alliander N. V.
#
# SPDX-License-Identifier: Apache-2.0

#Pull the base image:
FROM osrf/ros:humble-desktop-full
RUN apt update

#Add user:
RUN useradd -p "$(openssl passwd -1 rcdt)" rcdt
RUN usermod -aG sudo rcdt
RUN mkdir /home/rcdt

#Set user and workdir:
RUN chown -R rcdt /home/rcdt
USER rcdt
WORKDIR /home/rcdt
