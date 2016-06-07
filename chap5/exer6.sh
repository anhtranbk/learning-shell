#!/bin/bash
# Write a shell script to monitor Linux server disk space using a while loop.
# Send an email alert when percentage of used disk space is >= 90%.
#
ADMIN="anhtn.bk@gmail.com"
# set alert level 90% is default
ALERT=90
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
do
  #echo $output
  usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
  partition=$(echo $output | awk '{ print $2 }' )
  if [ $usep -ge $ALERT ]; then
    echo "Running out of space \"$partition ($usep%)\" on $(hostname) as on $(date)" |
     mail -s "Alert: Almost out of disk space $usep" $ADMIN
  fi
done
