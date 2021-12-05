#!/bin/bash



# -CURRENTLY NOT IN USE- Shuts down the computer if the time frame assertion returns true. 
#
# Expects the intended shutdown time in the form hhmmss. 090000 for 9 am.
#
# The assertion is required to avoid shutdown at unexpected times. When the launchd scheduled task
# should execute when the os sleeps, the task is executed when the os wakes up next time.
# To prevent this undesired behaviour, this script asserts that it is executed in the intended
# time frame.


intended=$(echo "$1" | sed 's/^0*//') # sed removes leading zeros
act_minus=$(date "-v-2M" "+%H%M%S" | sed 's/^0*//') # buffered to allow 2 minutes for launchd to launch the shell
act_plus=$(date "-v+1M" "+%H%M%S" | sed 's/^0*//') # only for testing. Avoids having to consider seconds

echo "intended time: $intended"
echo "actual time -: $act_minus"
echo "actual time +: $act_plus"

#assertion
if !([ $act_minus -lt $intended ] && [ $intended -lt $act_plus ])
then
    echo "intended start to far from actual time - exiting..."
    exit 0
fi

shutdown -h +1