#!/bin/bash
# Write a shell script to determine if an input number is a palindrome or not.
# A palindromic number is a number where the digits, with decimal representation usually assumed,
# are the same read backwards, for example, 58285.
#
[ $# -eq 0 ] && { echo "$0 number"; exit 1; }

# Cach 1
#
n=$1
sd=0
rev=""
on=$n

while [ $n -gt 0 ]
do
    sd=$(( $n % 10 )) # get Remainder
    n=$(( $n / 10 ))  # get next digit
    # store previous number and current digit in reverse
    rev=$( echo ${rev}${sd} )
done

[ $on -eq $rev ] && echo "$on is palindrome" || echo "$on is not palindrome"

# Cach 2
#
n=$1
readonly size=${#n}
declare -i i=0
declare -i j=$(( size - 1 ))

while [ $i -lt $j ]; do
  if [ "${n:$i:1}" = "${n:$j:1}" ]; then ((i++)); ((j--))
  else
    echo "$n is not palindrome"
    exit 1
  fi
done

echo "$n is palindrome"
