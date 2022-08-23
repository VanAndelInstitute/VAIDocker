#!/bin/bash

logger bouncing docker rstudio
cd /root/VAIDocker/bbcnode_aws
su - ec2-user -c "echo mounting studies"
docker-compose restart
sleep 5
docker exec rstudio_bbc systemctl start systemd-user-sessions


#set up the cert and proxy
docker stop caddy
docker rm caddy
echo `curl -s ifconfig.me`.nip.io { > /root/Caddyfile
echo "   reverse_proxy localhost:8080" >> /root/Caddyfile
echo } >> /root/Caddyfile
docker run -d --name caddy --network host -v /root/Caddyfile:/etc/caddy/Caddyfile caddy


#DISPLAY user password and URL
instance_id=$(curl -s "http://169.254.169.254/latest/meta-data/instance-id")
instance_region=$(curl -s "http://169.254.169.254/latest/meta-data/placement/region")
PASSWORD=`aws ssm get-parameter --name "/rstudio/user/sc-environments/ec2-instance/${instance_id}"  --region $instance_region --with-decryption --output text | cut -f 7`
MYIP=`curl -s ifconfig.me 2> /dev/null`
echo "You can log into RSTUDIO SERVER at the following URL:" > /etc/motd
echo  https://$MYIP.nip.io  >> /etc/motd
echo  username: ec2-user  >> /etc/motd
echo  password: $PASSWORD  >> /etc/motd