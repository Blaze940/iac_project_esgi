#! /bin/sh

# This script is used to build the docker image for mac users
#docker build --build-arg USER_UID=`id -u` -t esgi-iac:latest .

# For windows users, use:
docker build -t esgi-iac:latest .
