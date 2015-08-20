#!/usr/bin/env bash

maven_repository_directory=$1
aar_version=$2

if [ -z "$maven_repository_directory" ]; then
  echo "No maven repository directory defined"
  exit 1
fi

if [ -z "$aar_version" ]; then
  echo "No aar version defined, define it with -P aarVersion={version name}"
  exit 1
fi

cd $maven_repository_directory
git add .
git commit -m "Add version $aar_version"
