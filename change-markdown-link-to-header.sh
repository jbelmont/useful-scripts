#! /bin/bash

pbpaste | awk 'BEGIN { FS="[][]" } /\[.*?\]/ { print "#### " $2 "\n\n" "Content" "\n"  }' | pbcopy
