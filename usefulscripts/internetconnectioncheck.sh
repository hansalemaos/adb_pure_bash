#!/bin/bash
IP="8.8.8.8"
COUNT=4
counter=0
counter2=0
while [ $counter2 -lt $COUNT ]; do
    if ping -c $COUNT $IP > /dev/null 2>&1; then
        counter=$(($counter + 1))
    fi
    counter2=$(($counter2 + 1))
done
echo $counter