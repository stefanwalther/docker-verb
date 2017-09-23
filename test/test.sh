#!/usr/bin/env bash

echo "--------------"
docker run \
    --privileged \
    -v ${PWD}/fixtures:/app/fixtures \
    -v ${PWD}/expected:/app/expected \
    -v ${PWD}/test-verb.sh:/test-verb.sh \
    stefanwalther/verb \
    /bin/sh -c  \
    "./test-verb.sh";
