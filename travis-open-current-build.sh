#! /bin/bash

travis open $(travis branches | grep $(git rev-parse --abbrev-ref HEAD) | awk '{ print $2 }' | sed 's/#//g')
