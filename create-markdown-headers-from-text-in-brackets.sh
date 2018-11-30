#! /bin/bash

find . -name "*.md" -exec basename {} \; -exec awk 'BEGIN { FS="[][]" } /\[.*?\]/ { print "#### " $2 "\n" }' {} \;
