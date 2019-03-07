#! /bin/bash

mongo $1 \
  | sed '1,6d;/Type \"it\" for more/d;s/}$/},/g' \
  | sed 's/},/}/g' \
  | sed '1,5d' \
  | gsed -E 's/(ObjectId\()(.*)(\))/\2/g;s/(ISODate\()(.*)(\))/\2/g' \
  | pbcopy
