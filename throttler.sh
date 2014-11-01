#!/bin/bash

#You can replace HandBrake with any Program you like 
# but look for case sensitivity

hbpid=$(pgrep HandBrake)

echo "This Script must be in the same directory like cputhrottle and 
      be running with sudo. Alternatively you can add a path at the program call.
      If you want to end the script just make twice ctrl+c."

if [ -z "$hbpid" ]
then
     echo "No HandBrake running! Exit!"
     exit 1
fi

thrpid=$(pgrep cputhrottle)
#echo $thrpid
if [ -n "$thrpid" ]
then
    echo "CpuThrottle already running. Exit"
    exit 2
fi

#Here you can set your cpuPercentage Value you like
cpuPerc=600

while true
do
     if [ -z "$hbpid" ]
     then
        echo "No HandBrake running! Exit!"
        exit 1
     fi

     thrpid=$(pgrep cputhrottle)
     #echo $thrpid
     if [ -z "$thrpid" ]
     then

        echo "Starting cputhrottle..."
        date
        set -e
        ./cputhrottle $hbpid $cpuPerc || exit 3
        set +e
     fi
   
     sleep 5
done 
