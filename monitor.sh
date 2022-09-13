#!/bin/bash

#Start printout
echo "starting on $1"
COM=$1
if [ -e "/dev/$COM" ]; then
    screen -ls | grep Detached | cut -d. -f1 | awk '{print $1}' | xargs kill
    echo "Starting screen on $COM"
    screen -S "PICO$COM" "/dev/$COM"
fi