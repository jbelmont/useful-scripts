#! /bin/bash

for dir in $(echo $(find . -maxdepth 2 -type d -name "*.git" | xargs | sed 's/\.git//g;s/\/ / /g;s/\.\///g'))
do
  printf "Create patches/%s directory\n" $dir
  mkdir -p patches/$dir
done
