#!/usr/bin/env bash

upstream_repo=$1
if [ -z "$upstream_repo" ]; then
  echo "No upstream repository URL provided"
  exit 1
fi

git remote | grep upstream > /dev/null 2>&1
remote_exists=$?
if [ $remote_exists -eq 0 ]; then
  git remote remove upstream 2> /dev/null
fi

git remote add upstream $upstream_repo
git fetch upstream 2> /dev/null
