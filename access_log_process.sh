#!/bin/bash
echo "Extract all unique IP addresses from access.log:"
echo "================================================"
awk '{print $1}' access.log | sort | uniq
echo "------------------------------------------------"


echo "Count how many times each has appeared in access.log:"
echo "====================================================="
awk '{print $1}' access.log | sort | uniq -c | sort -nr
echo "------------------------------------------------"


echo "Find out which IP address made the most requests:"
echo "================================================="
awk '{print $1}' access.log | sort | uniq -c | sort -nr | head -n 1
echo "------------------------------------------------"


echo "Extract all endpoints that exist in the log file:"
echo "================================================="
awk -F'"' '{print $2}' access.log | awk '{print $2}' | sort | uniq
echo "------------------------------------------------"


echo "Find out the number of times each endpoint has been requested and sort it in ascending order:"
echo "============================================================================================="
awk -F'"' '{print $2}' access.log | awk '{print $2}' | sort | uniq -c | sort -n
