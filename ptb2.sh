#!/bin/bash
# Giai phuong trinh bac 2
#
LENGTH=$#

if [ $LENGTH -eq 0 ]; then read -p "Nhap a, b, c: " a b c
elif [ $LENGTH -eq 3 ]; then a=$1; b=$2; c=$3
else
  echo "Usage $0 a b c or $0"
  exit 2
fi

# calculate delta
readonly delta=$(( $b*$b - 4*${a}*${c} ))
echo "delta =" "$delta"

if [ $delta -lt 0 ]; then
  echo -e "Phuong trinh vo nghiem\n"
  exit 1;
elif [ $delta -eq 0 ]; then
  x=$(bc -l <<< "scale=6; -1*${b} / 2*${a}")
  echo -e "Phuong trinh co nghiem kep: $x\n"
else
  x1=$(bc -l <<< "scale=6; (-1*${b} + sqrt(${delta})) / 2*${a}")
  x2=$(bc -l <<< "scale=6; (-1*${b} - sqrt(${delta})) / 2*${a}")
  echo -e "Phuong trinh co hai nghiem: ${x1} ${x2}\n"
fi
exit 0
