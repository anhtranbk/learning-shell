#!/bin/bash
# Write a simple shell script where the user enters a pizza parlor bill total.
# Your script should then display a 10 percent tip.
#
# Version 1
clear
echo "*************************"
echo "*** Joes Pizza Parlor ***"
echo "*************************"
echo
echo "Today is $(date)"
echo
read -p "Enter a pizza parlor bill : " bill

tip=$(echo "scale=2; (${bill}*10) / 100" | bc -l)
total=$(echo "scale=2; $tip + $bill" | bc -l)
echo "Pizza bill : $bill"
echo "Tip (10%)  : ${tip}"
echo "--------------------------"
echo "Total      : ${total}"
echo "--------------------------"
