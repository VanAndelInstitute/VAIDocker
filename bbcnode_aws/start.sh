#!/bin/bash

#install docker
yum -y install git docker
systemctl enable docker
systemctl start docker
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
chmod +x /usr/bin/docker-compose

#get the container
cd /root
git clone https://github.com/VanAndelInstitute/VAIDocker.git
cd /root/VAIDocker/bbcnode_aws

#copy the script to handle reboots or starts and stops
cp bounce.sh /var/lib/cloud/scripts/per-boot
chmod +x /var/lib/cloud/scripts/per-boot/bounce.sh

#fire up the container
aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 639677452477.dkr.ecr.us-east-2.amazonaws.com
docker-compose up -d
sleep 5

#ensure the container service is running
docker exec rstudio_bbc cp /etc/pam.d/login /etc/pam.d/rstudio
docker exec rstudio_bbc systemctl start systemd-user-sessions


#set up the cert and proxy
echo `curl ifconfig.me`.nip.io { > /root/Caddyfile
echo "   reverse_proxy localhost:8080" >> /root/Caddyfile
echo } >> /root/Caddyfile
docker run -d --name caddy --network host -v /root/Caddyfile:/etc/caddy/Caddyfile caddy



#WITHIN CONTAINER (NOT USED)
#sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
#sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
#yum install passwd
#cp /etc/pam.d/login /etc/pam.d/rstudio
#useradd ec2-user
#passwd ec2-user
#systemctl start systemd-user-sessions

