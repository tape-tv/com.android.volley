#!/usr/bin/env bash

upstream_version=$1
upstream_type=$2
upstream_directory=$3

if [ -z "$upstream_version" ]; then
  echo "No upstream version defined, define it with -P upstreamVersion={version}"
  exit 1
fi

if [ -z "$upstream_type" ]; then
  echo "No upstream type defined, define it with -P upstreamType={branch/tag}"
  exit 1
fi

if [ -z "$upstream_directory" ]; then
  echo "No upstream directory defined"
  exit 1
fi

rm -rf $upstream_directory

if [ "$upstream_type" = "tag" ]; then
  git worktree add $upstream_directory upstream/master 2> /dev/null
  cd $upstream_directory
  git checkout $upstream_version 2> /dev/null
else
  git worktree add $upstream_directory upstream/$upstream_version 2> /dev/null
fi
