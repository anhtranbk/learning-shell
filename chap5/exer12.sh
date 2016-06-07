#!/bin/bash
# Write a shell script that accepts two directory names as arguments and deletes those files
# in the first directory which are similarly named in the second directory.
#
[ $# -ne 2 ] && { echo "Usage $0 src target"; exit 1; }

src=$1
target=$2

[ ! -d $src ] && { echo "$src is not directory"; exit 2; }
[ ! -d $target ] && { echo "$target is not directory"; exit 2; }

for file in ${src}/*; do
  # For test only echo results instead of true delete
  tFile=$(basename $file)
  [ -f "$file" ] && [ -f "$target/$tFile" ] && echo "Deleted: $file"
done
