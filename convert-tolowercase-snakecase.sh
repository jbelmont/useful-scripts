#! /bin/bash

pbpaste | tr '[:upper:]' '[:lower:]' | sed 's/ /_/g' | pbcopy
