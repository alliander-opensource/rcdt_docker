# syntax = devthefuture/dockerfile-x
# SPDX-FileCopyrightText: Alliander N. V.
#
# SPDX-License-Identifier: Apache-2.0

INCLUDE ./general/pre_install.Dockerfile

INCLUDE ./general/dep_core.Dockerfile

INCLUDE ./general/moveit.Dockerfile

INCLUDE ./panther/main.Dockerfile

INCLUDE ./general/post_install.Dockerfile