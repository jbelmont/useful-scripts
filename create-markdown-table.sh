#! /bin/bash

pbpaste \
  | gsed -E 's/([[:alpha:]]*)([[:blank:]]+)([[:alpha:]]+)/\1 | \3/' \
  | sed 's/^/| /g;s/$/ | /g' \
  | awk 'NR==2 { print "| --- | --- |" } { print $0 }' \
  | pbcopy
