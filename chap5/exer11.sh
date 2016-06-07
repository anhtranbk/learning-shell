#!/bin/bash
# Write a shell script that will count the number of files in each of your sub-directories
# using the for loop.
#
[ $# -eq 0 ] && { echo "Usage $0 dir"; exit 1; }

dir=$1
[ ! -d "$dir" ] && { echo "$dir is not directory"; exit 2; }

directories=$(find $dir -type d)
for d in $directories; do
  [ "$d" != "." -a "$d" != ".." ] && echo "$d directory has $(ls -l $d | wc -l) files"
done
