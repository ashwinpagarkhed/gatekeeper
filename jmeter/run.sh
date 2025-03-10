#!/bin/bash
#
# Run JMeter Docker image with options

NAME="jmetertest"
IMAGE="justb4/jmeter:5.3"
ROOTPATH=$1

echo "$ROOTPATH"
# Finally run
sudo docker stop ${NAME} > /dev/null 2>&1
sudo docker rm ${NAME} > /dev/null 2>&1
sudo docker pull ${IMAGE}
sudo docker run --name ${NAME} -i -v $ROOTPATH:/test -w /test $IMAGE ${@:2}