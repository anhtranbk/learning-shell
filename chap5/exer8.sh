#!/bin/bash
# Write a shell program to read a number *such as 123) and find the sum of digits (1+2+3=6).
#
[ $# -eq 0 ] && { echo "$0 number"; exit 1; }

num=$1
sum=0

while [ $num -gt 0 ]; do
  digit=$(( num % 10 ))
  num=$(( num / 10 ))
  sum=$(( sum + digit ))
done

echo "Sum: $sum"
