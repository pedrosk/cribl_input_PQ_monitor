#!/bin/bash
#Script name: monit_input_pq.sh
#Author: Eduard Breuer
#Date Created: 2024-08-16
#Last Updated: 2024-08-17
#
#Purpose of the Script: 
# To monitor ever 0.5s if there are PQ files and what their currect size are
# 
#
#Notes


#set colors
RED='\033[0;31m'
NoColor='\033[0m' 

while true;
do
  clear
  cas=$(date)
  timestamp=`date +"%Y-%m-%dT%TZ" -u`
  milis=$(echo $(($(date +%s%N)/1000000)))
  local_time=$(env TZ="America/Chicago" date +"%Y%m%d%H%M")
  echo $timestamp $milis $local_time
  echo -e ${RED}hostname${NoColor} $(hostname) ${RED}IP: ${NoColor}$(hostname -I |awk '{print $1}')  
  #the past is hardcoded in this version 
  for check_dir in $(ls  /opt/cribl/state/queues/*/inputs/*/* &2>/dev/null); do
    # clear
    echo "================================================================================================================================="
    #  echo "$check_dir"
    ls_var=$(ls --time-style="+%Y-%m-%dT%H:%M:%S" -lth $check_dir)
    #  echo $ls_var
    file_size=$(echo $ls_var|awk '{print $5}')
    last_modified=$(echo $ls_var |awk '{print $6}')
    file_name=$(echo $ls_var |awk '{print $7}')
    echo -e ${RED}filename:${NoColor} $file_name ${RED}is size of${NoColor} $file_size ${RED}and was last modifed on${NoColor} $last_modified
  done
  sleep  0.5
done
