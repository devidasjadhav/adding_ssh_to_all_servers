#!/bin/bash

#create key to passing it to all servers
ssh-keygen -t rsa -b 4096 -C "Devidas@Jadhav.com" -f id_rsa -N ''

for server_ip in $@ :
do
  ssh root@$server_ip -- mkdir -p .ssh
  scp id_rsa.pub root@$server_ip:.ssh/authorized_keys
  scp id_rsa root@$server_ip:.ssh/
  ssh root@$server_ip --  "chmod 700 .ssh; chmod 640 .ssh/authorized_keys"
done
