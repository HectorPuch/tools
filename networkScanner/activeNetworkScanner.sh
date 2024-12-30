#!/bin/bash

NETWORK="$1"

if [ "$NETWORK" == "" ]
then
	echo "You forgot the network part of an IP address!"
	echo "Syntax: ./activeNetworkScanner.sh 192.168.1"

else
	for HOST in `seq 1 254`;
	do
		ping -c 1 $NETWORK.$HOST | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
	done
fi
