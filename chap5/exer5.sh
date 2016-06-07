#!/bin/bash
# Write a shell script that, given a file name as the argument will write the even numbered line to
# a file with name evenfile and odd numbered lines in a text file called oddfile.
#
file=$1
count=0

[ $# -eq 0 ] && { echo "$0 fileName"; exit 1; }
[ ! -f $file ] && { echo "$file not a file"; exit 2; }

even="/tmp/evenfile"
odd="/tmp/oddfile"

while read line; do
  ((count++))
  [ $((count % 2)) -eq 0 ] && echo "$line" >> "$even" || echo "$line" >> "$odd"
done < $file

exit 0
