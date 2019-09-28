#! /bin/bash

CONTAINERS=$(docker ps -a | awk '{ if (NR>1) { print $1 } }')

echo $(date "+%A %B %d %T %y")
printf "Stopping Containers: %s\n" $(echo $CONTAINERS)
docker stop $CONTAINERS 2> /dev/null


echo $(date "+%A %B %d %T %y")
printf "Removing Containers: %s\n" $(echo $CONTAINERS)
docker rm $CONTAINERS 2> /dev/null

echo $(date "+%A %B %d %T %y")
NONE_IMAGES=$(docker images | awk '/\<none\>/ { print $3 }')
printf "Removing Images with none as label %s\n" $(echo $NONE_IMAGES)
docker rmi $NONE_IMAGES 2> /dev/null

echo $(date "+%A %B %d %T %y")
DANGLING_IMAGES=$(docker images -q --filter "dangling=true")
printf "Removing Images that are dangling %s\n" $(echo $DANGLING_IMAGES)
docker rmi $DANGLING_IMAGES 2> /dev/null


echo $(date "+%A %B %d %T %y")
DOCKER_VOLUME_IDS=$(docker volume ls -qf dangling=true)
printf "Remove dangling data volume ids: %s\n" $(echo $DOCKER_VOLUME_IDS)
docker volume rm $DOCKER_VOLUME_IDS 2>/dev/null
