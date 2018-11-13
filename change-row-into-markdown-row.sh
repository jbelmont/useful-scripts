#! /bin/bash

pbpaste | awk -F" " '{OFS=FS}{ $1=$1" |"; $NF=$NF" |" ; print   }' | pbcopy
