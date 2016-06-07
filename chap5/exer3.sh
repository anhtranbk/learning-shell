#!/bin/bash
# Write a shell script that, given a file name as the argument will count vowels, blank spaces,
# characters, number of line and symbols.
#
file=$1
v=0

[ $# -eq 0 ] && { echo "$0 fileName"; exit 1; }
[ ! -f $file ] && { echo "$file not a file"; exit 2; }

while read -n 1 c; do
  l=$(echo $c | tr [:upper:] [:lower:])
  [[ "$l" == "a" || "$l" == "e" || "$l" == "i" || "$l" == "o" || "$l" == "u" ]] && (( v++ ))
done < $file

echo "Characters: $(cat $file | wc -m)"
echo "Lines: $(cat $file | wc -l)"
echo "Blank lines: $(grep  -c '^$' $file)"
echo "Vowels: $v"
