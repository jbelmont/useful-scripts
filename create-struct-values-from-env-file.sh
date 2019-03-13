#! /usr/local/bin/bash

pushd $HOME/scripts

IFS=$'\n'
KEYS=$(cat common.env | sed 's/=.*//g;/^$/d;/^#/d')
VALUES=($(cat common.env | sed 's/^.*=//g;/^$/d;/^#/d'))
readarray -t y <<< "$KEYS" 2> /dev/null

COUNT=0
echo "[]struct{\n\tKey string\n\tValue string\n}{"
for key in $KEYS
do
  printf "\t{\n\t\t\"$key\",\n\t\t\"${VALUES[$COUNT]}\",\n\t},\n"
  COUNT=$((COUNT + 1))
done 
echo "}"

popd
