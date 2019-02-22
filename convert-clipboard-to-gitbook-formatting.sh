#! /usr/local/bin/bash

IFS=$'\n'
WORDS=$(pbpaste)
readarray -t y <<< "$WORDS" 2> /dev/null

for word in $WORDS
do
  TEXT_INSIDE_PARENS=$(echo $word | sed 's/ /_/g' | tr '[:upper:]' '[:lower:]')
  printf "* [%s](#%s)\n" $word $TEXT_INSIDE_PARENS
done

LAST_LINK="* [Bread Crumb Navigation](#bread-crumb-navigation)\n"
echo $LAST_LINK

for word in $WORDS
do
  echo $word | awk 'BEGIN { FS="\n" } { print "###### " $1 "\n\nContent\n" }'
done
