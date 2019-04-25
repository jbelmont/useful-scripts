#! /bin/bash

NUMBER=$1
if [[ -z $NUMBER ]]; then
    echo "Please provide number for the log entry!\nNumber form like 1 or 2, etc."
    exit 1
fi

git show $(git log --oneline | awk -v NUMBER="$NUMBER" 'NR==NUMBER { print $1 }')
