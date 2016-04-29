#!/bin/bash

source ./config.sh

# Loop through addresses and pass to RRD Tool
for Graph_Address in ${Graph_Addresses[*]}
do
	pps=`cat /tmp/fastnetmon.dat | grep -i incoming -A $Displayed_Addresses | grep $Graph_Address | awk '{print $2}'`
	mbps=`cat /tmp/fastnetmon.dat | grep -i incoming -A $Displayed_Addresses | grep $Graph_Address | awk '{print $4}'`
	if [ ! -z "$pps" ]
	then
		# string not null so lets populate rrd
		rrdtool update $RRD_Graphs/data/$Graph_Address.rrd N:$pps:$mbps
	fi
done
