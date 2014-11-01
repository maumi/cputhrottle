#!/bin/bash
#-------[ File Description ]-------#
# You can replace HandBrake with any Program you like 
# but look for case sensitivity.

echo "This Script must be in the same directory like cputhrottle and 
      be running with sudo. Alternatively you can add a path at the program call.
      If you want to end the script just make twice ctrl+c."

#-------[ Configuration ]-------#
# Here you can set your cpuPercentage Value you like
cpuPerc=600

# Checking time interval (in seconds)
chckInt=5

#-------[ Checking loop ]-------#
while true
do
     thrpid=$(pgrep cputhrottle)
     if [ -z "$thrpid" ]
     then
        echo "Starting cputhrottle..."
        date
        set -e
        ./cputhrottle $hbpid $cpuPerc || exit 3
        set +e
     fi
   
     sleep $chckInt
done 
