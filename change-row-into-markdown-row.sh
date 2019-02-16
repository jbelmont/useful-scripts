#! /bin/bash

pbpaste | tr '[:blank:][:blank:]+' '|' | sed 's/^/\| /g;s/\|/ \| /g;s/$/ \|/g' | sed 's/^[[:blank:]]//g'
