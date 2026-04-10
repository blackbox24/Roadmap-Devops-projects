#! /usr/bin/bash

LINE_BREAK="----------"
echo "${LINE_BREAK}Total CPU usage${LINE_BREAK}"
iostat -c 1 2 | sed -n "6p"

echo "${LINE_BREAK}Total memory usage${LINE_BREAK}"
free -m | awk 'NR==1{print "Total\tUsed\tFree\tUsage%"} NR==2{printf "%dMB\t%dMB\t%dMB\t%.2f%%\n", $2,$3,$4,$3*100/$2}'
echo ""

echo "${LINE_BREAK}Total disk usage${LINE_BREAK}"
df -h --total | | grep -E 'Filesystem|total'
echo ""

echo "${LINE_BREAK}Top 5 processes by CPU usage${LINE_BREAK}"
top -o +%MEM | head -n 12 | tail -n 6
echo ""

echo "${LINE_BREAK}Top 5 processes by memory usage${LINE_BREAK}"
top -o +%MEM | head -n 12 | tail -n 6
