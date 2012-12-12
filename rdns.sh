#!/bin/bash
# written by rwc

echo "Welcome to the rDNS tool."
echo "Have your IPs ready!"

echo -n "Customer ID: "
read -e custid
echo -n "Enter 1st octet: "
read -e oct1
echo -n "Enter 2nd octet: "
read -e oct2
echo -n "Enter 3rd octet: "
read -e oct3
echo "Enter range for 4th octet: "
echo -n "begin: "
read -e oct4beg
echo -n "end: "
read -e oct4end

for ((range=$oct4beg; range <= $oct4end ; range++))
do
        dig -x $oct1.$oct2.$oct3.$range >> $custid.rdns.txt
done
