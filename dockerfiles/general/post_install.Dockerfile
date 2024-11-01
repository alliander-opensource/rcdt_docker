# SPDX-FileCopyrightText: Alliander N. V.
#
# SPDX-License-Identifier: Apache-2.0

#Define GZ_SIM_RESOURCE_PATH:
ENV GZ_SIM_RESOURCE_PATH="/home/$UNAME/franka_ws/src/"

# Define IGN_IP to use gazebo with firewall enabled:
ENV IGN_IP=127.0.0.1

#Set user and workdir:
RUN chown -R $UNAME /home/$UNAME
USER $UNAME
WORKDIR /home/$UNAME

# Copy .personal.bashrc (only if exists, using [] Glob trick):
COPY ./bashrc/.persona[l].bashrc /home/$UNAME/.personal.bashrc

# Get new linting rules if changed:
ADD https://api.github.com/repos/alliander-opensource/rcdt_linting/git/refs/heads/main version.json
RUN git clone https://github.com/alliander-opensource/rcdt_linting
RUN mv rcdt_linting/config/pyproject.toml .
RUN rm -rf rcdt_linting
RUN rm version.json

#Set entrypoint to bash:
ENTRYPOINT ["/bin/bash"]