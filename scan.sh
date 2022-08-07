#!bin/bash
#Installed geoIP as part of the server setup
sudo egrep "Connection reset by authenticating|failed|unauthorized|Invalid user" /var/log/auth.log | grep -wv COMMAND | awk '{print $1" "$2" " $3" "$10}' |grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | awk 'BEGIN{OFS = "\t"} {print $1" " $2" " $3" "$4  ,system("geoiplookup -s " $4) }' >> /var/webserver_log/unauthorized.log
