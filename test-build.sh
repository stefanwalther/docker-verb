#!/usr/bin/env bash

docker run --it -v ${PWD}/fixtures:/app/fixtures -v ${PWD}/expected:/app/expected stefanwalther/verb
