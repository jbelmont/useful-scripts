#! /bin/bash

IS_GIT_DIRECTORY=$(git rev-parse --is-inside-work-tree 2>/dev/null)
if [[ ! $IS_GIT_DIRECTORY ]]; then
  echo "This is not a git repository!"
  exit 1
fi

GITHUB_USERNAME=$1
CURRENT_REPO=$(git config --local --list | grep 'remote.origin.url' | awk '{ split($0,a,"="); print a[2] }' | awk -F '/' '{ print $5 }' | sed 's;\.git;;g')

if [[ `whoami` == "jean-marcelbelmont" ]]; then
  open `printf 'https://marcelbelmont.com/%s' $CURRENT_REPO`
else
  if [[ -z "$GITHUB_USERNAME" ]]; then
    echo "You must supply your github username to open your github pages for this repository."
  else
      open $(printf "https://%s.github.io/%s" $GITHUB_USERNAME $CURRENT_REPO)
  fi
fi
