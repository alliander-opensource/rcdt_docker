# syntax = devthefuture/dockerfile-x
# SPDX-FileCopyrightText: Alliander N. V.
#
# SPDX-License-Identifier: Apache-2.0

INCLUDE ./general/pre_install.Dockerfile

INCLUDE ./general/package_install.Dockerfile

INCLUDE ./general/moveit_from_source.Dockerfile

INCLUDE ./panther/main.Dockerfile

INCLUDE ./general/post_install.Dockerfile