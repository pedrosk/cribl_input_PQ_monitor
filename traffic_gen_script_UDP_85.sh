#!/bin/bash


#Script name: traffic_gen_script_UDP_85.sh
#Author: Eduard Breuer
#Date Created: 2024-0
#Last Updated: 2024-08-17
#
#Purpose of the Script: 
# To generate (UDP) traffic and send it to cribl worker every 1s of a predefined size (85)
# 
#
#Notes

protocol=udp
vip=xxx.xxx.xxx.xxx
port=29401
msg="my cluster"
q_size=85


##infinitelly
##while [ 0 == 0 ]; do

#run for size of the Q
for (( i=0; i<$q_size; i++)); do

echo "test via $i /${protocol}/${vip}/${port}"


echo "<14> $i `date | awk '{print " " $2 " " $3 " " $4}'` `hostname`: $msg"  > /dev/${protocol}/${vip}/${port}

sleep 1

done

