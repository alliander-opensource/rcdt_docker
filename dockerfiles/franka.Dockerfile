# syntax = devthefuture/dockerfile-x
# SPDX-FileCopyrightText: Alliander N. V.
#
# SPDX-License-Identifier: Apache-2.0

INCLUDE ./general/pre_install.Dockerfile

INCLUDE ./general/package_install.Dockerfile

INCLUDE ./franka/main.Dockerfile

INCLUDE ./general/post_install.Dockerfile