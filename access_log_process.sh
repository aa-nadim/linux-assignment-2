#!/bin/bash

FILE="access.log"

echo "Extract all unique IP addresses from $FILE:"
echo "================================================"
awk '{print $1}' $FILE | sort | uniq
echo


echo "Count how many times each has appeared in $FILE"
echo "====================================================="
awk '{print $1}' $FILE | sort | uniq -c | sort -nr
echo


echo "Find out which IP address made the most requests:"
echo "================================================="
awk '{print $1}' $FILE | sort | uniq -c | sort -nr | head -n 1
echo


echo "Extract all endpoints that exist in the log file:"
echo "================================================="
awk -F'"' '{print $2}' $FILE | awk '{print $2}' | sort | uniq
echo


echo "Find out the number of times each endpoint has been requested and sort it in ascending order:"
echo "============================================================================================="
awk -F'"' '{print $2}' $FILE | awk '{print $2}' | sort | uniq -c | sort -n
