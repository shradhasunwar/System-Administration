#!bin/bash
#Installed geoIP as part of the server setup
sudo egrep "Connection reset by authenticating|failed|unauthorized" /var/log/auth.log | grep -wv COMMAND | awk 'BEGIN{OFS = "\t"; ORS ="\n"} {print $12, $1" " $2" " $3 ,system("geoiplookup " $12) }' >> /var/webserver_log/unauthorized.log
