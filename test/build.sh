#!/usr/bin/env bash

echo "--------------"
echo "build docker image"
docker build -t stefanwalther/verb ./../;
echo "docker image built"
