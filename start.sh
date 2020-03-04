#!/bin/sh

NEWNAME=""
NUM=10
if [ $# -eq 1 ]; then
        NUM=$1
fi
for ((c=0; c<=$NUM; c++))
do
	NEWNAME="dlvm"$c
	xe vm-start vm=$NEWNAME &
done

