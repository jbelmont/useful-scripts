#! /bin/bash

pbpaste | awk '{ print tolower($0) }' | sed 's/ /_/g' | tr -d '\n' | pbcopy
