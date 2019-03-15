#! /bin/bash

# Print System Clipboard onto standard output then
# convert each character to lowercase and then turn the first character to match to uppercase with \u
# then remove the hyphen (-) to empty space
echo $(pbpaste) | gsed -E 's/.*/\L&/;s/[a-z]*/\u&/g;s/-/ /g' | tr -d '\n'
