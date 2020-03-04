#!/bin/sh

NEWNAME=""
NUM=10
if [ $# -eq 1 ]; then
	NUM=$1
fi
for ((c=0; c<=$NUM; c++))
do
	NEWNAME="dlvm"$c
	xe vm-clone vm=Citrix\ Demonstration\ Linux\ Virtual\ Machine  new-name-label=$NEWNAME
done

