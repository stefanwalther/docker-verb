#!/usr/bin/env bash

docker run \
    -v ${PWD}:/opt/verb \
    stefanwalther/docker-verb;
