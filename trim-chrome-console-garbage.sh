#! /bin/bash

pbpaste | sed 's/VM1353:1/ /g;s/^[[:blank:]]*//g' | pbcopy
