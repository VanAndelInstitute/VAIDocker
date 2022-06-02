#!/bin/bash

logger bouncing docker rstudio
cd /root/VAIDocker/bbcnode_aws
su - ec2-user -c "echo mounting studies"
docker-compose restart
sleep 5
docker exec rstudio_bbc systemctl start systemd-user-sessions
