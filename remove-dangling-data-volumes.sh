#! /bin/bash

docker volume rm $(docker volume ls -qf dangling=true | grep -v jenkins-data)
