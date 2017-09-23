#!/bin/bash
set -e
VER=$1
TRACK=$2

# See list of builds:
#   stable: https://download.docker.com/linux/static/stable/x86_64/
#   edge: https://download.docker.com/linux/static/edge/x86_64/
#curl -L -o /tmp/docker-$VER.tgz https://get.docker.com/builds/Linux/x86_64/docker-$VER.tgz

#echo "VER: $VER";
#echo "TRACK: ${TRACK:-stable}";

curl -L -o /tmp/docker-$VER.tgz https://download.docker.com/linux/static/${TRACK:-stable}/x86_64/docker-$VER.tgz
tar -xz -C /tmp -f /tmp/docker-$VER.tgz
mv /tmp/docker/* /usr/bin
