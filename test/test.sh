#!/usr/bin/env bash


echo "--------------"
echo "build docker image"
docker build -t stefanwalther/docker-verb ./../;
echo "docker image built"

echo "--------------"
echo "run tests"
docker run \
    --privileged \
    -v ${PWD}/fixtures:/app/fixtures \
    -v ${PWD}/expected:/app/expected \
    -v ${PWD}/test-verb.sh:/test-verb.sh \
    stefanwalther/docker-verb \
    /bin/sh -c \
    "sh /test-verb.sh";

echo "tests finished"
