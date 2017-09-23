#!/usr/bin/env bash

echo "--------------";
echo "Docker Repo: $DOCKER_REPO";
echo "Docker version: $VER";
docker run \
    --privileged \
    -v ${PWD}/fixtures:/app/fixtures \
    -v ${PWD}/expected:/app/expected \
    -v ${PWD}/test-verb.sh:/test-verb.sh \
    $DOCKER_REPO:$VER \
    /bin/sh -c  \
    "./test-verb.sh";
