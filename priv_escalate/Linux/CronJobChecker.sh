#!/bin/bash
#---------------------------------------------------------------------------------#
# Name       = Cron Job Checker                                                   #
# Author     = @ihack4falafel
# Editor     = @shinningstar                                                      #
# Date       = 02/08/2020                                                         #
# Usage      = chmod +x CronJobChecker.sh && ./CronJobChecker.sh                  #
#---------------------------------------------------------------------------------#

IFS=$'\n'

# Check list of running processes
old_proc=$(ps -aux  | grep -v "0:00" | awk '$4 > 0.0 {print $0}' )

# Look for newly created processes
while true; do
  new_proc=$(ps -aux  | grep -v "0:00" | awk '$4 > 0.0 {print $0}' )
  diff <(echo "$old_proc") <(echo "$new_proc") | grep [\<\>] | grep -v "CronJobChecker.sh" | grep -v "/sbin/init"
  #sleep 1
  old_proc=$new_proc
done

