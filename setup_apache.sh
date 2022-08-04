#!/bin/bash
set -x
sudo apt update
sudo apt install -y apache2
sleep 3m
sudo apt install -y nfs-common
sleep 3m
sudo apt-get install geoip-bin
sleep 2m
sudo mkdir /var/webserver_log
sudo mount 192.168.1.2:/var/webserver_monitor /var/webserver_log

