#!/bin/bash 
#Creator - Feyisetan Ganiyu
#Bash shell script for remote administrator
#Date - 01/06/2001

#step 1
sudo firewall-cmd --zone=internal --change-interface=ens224

#step 2
sudo yum install -y nfs-utils

#step 3
sudo mkdir /nfs-pub
sudo chmod 1777 /nfs-pub

#step 4
sudo touch /etc/exports
sudo chmod 777 /etc/exports
sudo echo '/nfs-pub  192.168.10.1(rw,root_squash)' > /etc/exports
sudo echo '/nfs-pub  192.168.10.2(rw,root_squash)' >> /etc/exports
sudo echo '/nfs-pub  192.168.10.4(rw,no_root_squash)' >> /etc/exports
sudo exportfs -a

#step 5
sudo systemctl enable nfs-server

#step 6
sudo systemctl start nfs-server

#step 7
sudo firewall-cmd --zone=internal --add-service=nfs

#step 8
sudo firewall-cmd --zone=internal --add-service=nfs3

#step 9
sudo firewall-cmd --zone=internal --add-service=rpc-bind
sudo firewall-cmd --runtime-to-permanent
