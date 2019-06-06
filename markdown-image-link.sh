#! /bin/bash

URL=$(pbpaste)
words=$(echo $URL | awk -F '/' '{ print $(NF-1) }' | gsed -E 's/-/ /g;s/(^[[:alpha:]])/\u\1/g')
word="["
for elem in $words
do
    word+="${elem} "
done
word+="]($URL)"

echo -n $word | sed 's/ \]/]/g' | pbcopy
