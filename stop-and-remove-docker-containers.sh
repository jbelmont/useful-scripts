#! /bin/bash

docker stop $(docker ps -a -q) 
docker ps -a | awk -F '       ' '{ print $1 }' | sed '/^CONTAINER/d' | xargs -L1 docker rm
