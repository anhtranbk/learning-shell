#!/bin/bash
# Write a shell program to read two numbers and display all the odd numbers between those two numbers.
#
[ $# -ne 2 ] && { echo "Usage $0 a b"; exit 1; }

result=""
a=$1
b=$2

for (( i=$((a+1)); i<$b; i++ )); do
  [ $((i % 2)) -eq 1 ] && result="$result $i"
done

echo "All odd numbers: $result"
