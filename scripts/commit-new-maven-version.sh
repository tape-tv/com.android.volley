#!/usr/bin/env bash

maven_repository_directory=$1
aar_version=$2
upstream_version=$3
upstream_type=$4
upstream_repository=$5

if [ -z "$maven_repository_directory" ]; then
  echo "No maven repository directory defined"
  exit 1
fi

if [ -z "$aar_version" ]; then
  echo "No aar version defined, define it with -P aarVersion={version name}"
  exit 1
fi

if [ -z "$upstream_version" ]; then
  echo "No upstream version defined"
  exit 1
fi

if [ -z "$upstream_type" ]; then
  echo "No upstream type defined"
  exit 1
fi

if [ -z "$upstream_repository" ]; then
  echo "No upstream repository defined"
  exit 1
fi

cd $maven_repository_directory
git add .
git commit -m "Add version $aar_version" -m "Built off of $upstream_type $upstream_version from $upstream_repository"
