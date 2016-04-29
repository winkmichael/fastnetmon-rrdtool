#!/bin/bash

source ./config.sh

# Loop through addresses and run the rrd initial setup
for Graph_Address in ${Graph_Addresses[*]}
do
	rrdtool create $RRD_Graphs/data/$Graph_Address.rrd --step '300' 'DS:BITS:GAUGE:600:U:12500000' 'DS:pl:GAUGE:600:0:100000000' 'RRA:AVERAGE:0.5:1:600' RRA:AVERAGE:0.5:288:31
done
