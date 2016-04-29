#!/bin/bash

source ./config.sh

# Loop through addresses and pass to RRD Tool
for Graph_Address in ${Graph_Addresses[*]}
do
		rrdtool graph $RRD_Graphs/graphs/$Graph_Address.png \ 
			--start -86400 \
			--end now \
			--lazy \
			--no-gridfit \
			--slope-mode \ 
			--width '440' \ 
			--title $RRD_Graphs \
			--vertical-label 'MBits/s' \ 
			DEF:Total=$RRD_Graphs/data/$Graph_Address.rrd:pps:MAX \
			DEF:Total=$RRD_Graphs/data/$Graph_Address.rrd:mbps:MAX \
			LINE1:pps#0000FF:"pps" \
			AREA:mbps#FFFFFF:"0%":STACK

done
