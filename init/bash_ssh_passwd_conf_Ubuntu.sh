#!/usr/bin/env bash

#ssh setting
now=$(date +"%m_%d_%Y")
cp /etc/ssh/sshd_config /etc/ssh/sshd_config_$now.backup
sed -i -e 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
systemctl restart ssh

#passwd setting
echo -e 'vagrant\nvagrant' | sudo passwd