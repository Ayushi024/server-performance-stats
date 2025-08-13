#!/bin/bash

echo "-----Server Performance stats---------"
echo "Date & Time: $(date)"
echo

echo "----OS Version-----"
cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2
echo

echo "----Uptime & Load----"
uptime
echo

echo "------CPU Usage-----"
top -bn1 |grep "cpu(s)" | awk '{print "CPU Usage: " 100-$8 "%"}'
echo

echo "------Disk Usage -----"
df -h --total | grep total | awk '{printf "Used: %s / Total: %s (%s)\n", $3, $2, $5}'
echo

echo "----Top 5 Processes by CPU----"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
echo 

echo "-------Top 5 Processes by Memory----"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
echo 

echo "------Logged-in Users-------"
who
echo "============================"
