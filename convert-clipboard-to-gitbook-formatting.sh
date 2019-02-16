#! /usr/local/bin/bash

IFS=$'\n'
WORDS=$(pbpaste)
readarray -t y <<< "$WORDS"

for word in $WORDS
do
  TEXT_INSIDE_PARENS=$(echo $word | sed 's/ /_/g' | tr '[:upper:]' '[:lower:]')
  printf "[%s](#%s)\n" $word $TEXT_INSIDE_PARENS
done
