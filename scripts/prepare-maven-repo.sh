#!/usr/bin/env bash

maven_repository_directory=$1
maven_repository_branch=$2

if [ -z "$maven_repository_directory" ]; then
  echo "No maven repository directory defined"
  exit 1
fi

if [ -z "$maven_repository_branch" ]; then
  echo "No maven repository branch defined"
  exit 1
fi

rm -rf $maven_repository_directory
git fetch origin
git worktree add $maven_repository_directory origin/$maven_repository_branch
