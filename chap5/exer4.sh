#!/bin/bash
# Write a shell script that, given a file name as the argument will count English language articles
# such As 'A', 'An' and 'The'.
#
file=$1
a=0

[ $# -eq 0 ] && { echo "$0 fileName"; exit 1; }
[ ! -f $file ] && { echo "$file not a file"; exit 2; }

while read line; do
  l=$(echo $line | tr [:upper:] [:lower:])
  for word in $l; do
    [[ $word == "a" || $word == "an" || $word == "the" ]] && ((a++))
  done
done < $file

echo "Articles: $a"
