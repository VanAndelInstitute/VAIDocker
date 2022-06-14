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
echo `curl ifconfig.me`.nip.io { > /root/Caddyfile
echo "   reverse_proxy localhost:8080" >> /root/Caddyfile
echo } >> /root/Caddyfile
docker run -d --name caddy --network host -v /root/Caddyfile:/etc/caddy/Caddyfile caddy
