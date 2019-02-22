#! /usr/local/bin/bash

printf "\![%s](../%s)" $(echo -n !$ | sed 's/\.png//g') $(echo -n !$) | pbcopy
