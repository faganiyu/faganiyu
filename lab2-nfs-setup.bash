#!bin/bash
#Creator - Feyisetan Ganiyu
#Bash shell script for remote administrator
#Date - 01/06/2001

sudo firewall-cmd --zone=internal --change-interface=ens224
sudo yum install -y nfs-utils
sudo mkdir /nfs-pub
chmod 1777 /nfs-pub
sudo echo '/nfs-pub  192.168.10.1(rw,root_squash)' > /etc/exports
sudo echo '/nfs-pub  192.168.10.2(rw,root_squash)' >> /etc/exports
sudo echo '/nfs-pub  192.168.10.4(rw,root_squash)' >> /etc/exports
sudo exportfs -a
sudo systemctl enable nfs-server
sudo systemctl start nfs-server
sudo firewall-cmd --zone=internal --add-service=nfs
sudo firewall-cmd --zone=internal --add-service=nfs3
sudo firewall-cmd --zone=internal --add-service=rpc-bind

