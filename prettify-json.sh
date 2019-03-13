#! /usr/local/bin/bash

JSON_STRING=$(pbpaste)

IS_VALID_JSON=$(echo $JSON_STRING | jq empty >/dev/null 2>&1)

if [[ $? -eq 0 ]]; then
    echo $JSON_STRING | jq . | pbcopy
else 
    echo "This is not valid JSON!!!"
    exit 1
fi