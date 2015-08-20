#!/usr/bin/env bash

upstream_directory=$1
aar_output_directory=$2
aar_output_basename=$3
aar_version=$4
gradle_version=$5

if [ -z "$upstream_directory" ]; then
  echo "No upstream directory defined"
  exit 1
fi

if [ -z "$aar_output_directory" ]; then
  echo "No aar output directory defined"
  exit 1
fi

if [ -z "$aar_output_basename" ]; then
  echo "No aar output basename defined"
  exit 1
fi

if [ -z "$aar_version" ]; then
  echo "No aar version defined, define it with -P aarVersion={version name}"
  exit 1
fi

root=$(pwd)
output_filename="$aar_output_basename$aar_version.aar"
output_path="$root/$aar_output_directory/$output_filename"

cd $upstream_directory

touch empty.gradle
wrapper_install_suffix=""
if [ -n "$gradle_version" ]; then
  wrapper_install_suffix="--gradle-version $gradle_version"
fi
gradle wrapper -b empty.gradle $wrapper_install_suffix

./gradlew assembleRelease
mkdir -p $root/$aar_output_directory
rm -f $output_path

upstream_output_base="./build/outputs/aar/$(basename $upstream_directory)"
if [ -e "$upstream_output_base-release.aar" ]; then
  cp "$upstream_output_base-release.aar" $output_path
else
  cp "$upstream_output_base.aar" $output_path
fi


echo "Built library in $aar_output_directory/$output_filename"
