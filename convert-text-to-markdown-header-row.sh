#! /usr/local/bin/bash

pbpaste | awk 'BEGIN { FS="\n" } { print "###### " $1 "\n\nContent\n" }' | pbcopy
