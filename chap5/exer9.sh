#!/bin/bash
# Write a shell program to read a number and display reverse the number.
# For example, 123 should be printed as as 321.
#
[ $# -eq 0 ] && { echo "$0 number"; exit 1; }

num=$1
rev=

while [ $num -gt 0 ]; do
  digit=$(( num % 10 ))
  num=$(( num / 10 ))
  rev="${rev}${digit}"
done

echo "Reverse number: $rev"
