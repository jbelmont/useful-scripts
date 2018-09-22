#! /bin/bash

open `printf "%s/pull/%s" $(git config --local --list | grep 'remote.origin.url' | awk '{split($0,a,"="); print a[2]}' | sed 's;\.git;;g') $(git rev-parse --abbrev-ref HEAD)`
