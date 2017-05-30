#!/usr/bin/env bash

docker build -t stefanwalther/docker-verb ./../;

docker run \
    -it \
    --privileged \
    -v ${PWD}/fixtures:/app/fixtures \
    -v ${PWD}/expected:/app/expected \
    -v ${PWD}/test-verb.sh:/test-verb.sh \
    stefanwalther/docker-verb \
    /bin/sh -c \
    "sh /test-verb.sh";
