# syntax = devthefuture/dockerfile-x

#Set ros version:
ARG ROS_DISTRO=jazzy

#Perfrom pre-install steps:
INCLUDE ./general/pre_install.Dockerfile

#Install all franka requirements:
INCLUDE ./franka/all.Dockerfile

#Install moveit_servo:
INCLUDE ./general/moveit_servo.Dockerfile

#Perfrom post-install steps:
INCLUDE ./general/post_install.Dockerfile