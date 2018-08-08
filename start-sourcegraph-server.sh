#! /bin/bash

docker run \
 --publish 7080:7080 --rm \
 --volume $HOME/.sourcegraph/config:/etc/sourcegraph \
 --volume $HOME/.sourcegraph/data:/var/opt/sourcegraph \
 sourcegraph/server:2.6.7
