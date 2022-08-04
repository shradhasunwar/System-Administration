#!/bin/bash
set -x
sudo apt update
sudo apt install -y nfs-kernel-server
sudo mkdir /var/webserver_monitor 
sudo chown root:root /var/webserver_monitor
sudo chmod 775 /var/webserver_monitor
#sudo chown nobody:nogroup /var/webserver_monitor 
echo "/var/webserver_monitor  192.168.1.1(rw,sync,no_root_squash,no_subtree_check)" |sudo tee -a /etc/exports
sudo systemctl restart nfs-kernel-server
sleep 2m
sudo apt-get install msmtp -y
sleep 2m
sudo apt-get install mailutils -y
