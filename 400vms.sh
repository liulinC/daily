#!/bin/sh

NEWNAME=""
for ((c=0; c<=400; c++))
do
	NEWNAME="dlvm"$c
	xe vm-clone vm=Citrix\ Demonstration\ Linux\ Virtual\ Machine  new-name-label=$NEWNAME
done

