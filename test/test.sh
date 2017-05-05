#!/usr/bin/env bash

docker build -t stefanwalther/verb ./../;

docker run -it stefanwalther/verb /bin/bash;
