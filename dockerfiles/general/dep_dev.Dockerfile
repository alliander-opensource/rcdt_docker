# SPDX-FileCopyrightText: Alliander N. V.
#
# SPDX-License-Identifier: Apache-2.0

########################################################
### Dependencies required for our developed packages ###
########################################################

# rcdt_utilities
RUN apt install -y ros-humble-rviz-visual-tools

# rcdt_detection
RUN apt install -y ros-humble-realsense2-camera
RUN python3 -m pip install pyrealsense2
RUN python3 -m pip install ultralytics
RUN python3 -m pip install "numpy<2.0"