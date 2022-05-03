#!/bin/bash
systemctl stop docker
yum -y remove docker
yum -y remove docker-compose
yum -y remove docker-common

yum-config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
yum -y install containerd.io.x86_64
yum -y install docker-ce
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x  /usr/local/bin/docker-compose
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) 
curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.repo | sudo tee /etc/yum.repos.d/nvidia-container-toolkit.repo
yum clean expire-cache
yum install -y nvidia-docker2
systemctl enable docker
systemctl start docker

