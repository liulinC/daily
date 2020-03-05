#!/bin/sh

NEWNAME=""
NUM=10
if [ $# -eq 1 ]; then
        NUM=$1
fi
for ((c=0; c<=$NUM; c++))
do
	NEWNAME="dlvm"$c
	time=`shuf -i 1-3 -n 1`
	echo "sleep $time ..."
	sleep $time
	xe vm-reboot vm=$NEWNAME &
done

