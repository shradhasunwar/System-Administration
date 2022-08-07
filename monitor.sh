#!/bin/bash
# Installed msmtp  and  mailutils  as part of ontime server setup in  observer_setup.sh
NOW=$(date | cut -c1-13)
hrAgo=$(date -d "1 hours ago" | cut -c1-13)
lTime=$(date -r /var/webserver_monitor/unauthorized.log | cut -c1-17)
if [ "$hrAgo" == "$lTime" ]; then
        emailBody="No unauthorized access."
else
        emailBody=$(sudo sed -n '/"$hrAgo"/,/"$NOW"/p' /var/webserver_monitor/unauthorized.log)
fi
echo "Email Alert" | mail -s "Unauthorized.log Update" ss945918@wcupa.edu <<< "$emailBody"
