yum -y install git docker
systemctl enable docker
systemctl start docker
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
chmod +x /usr/bin/docker-compose
cd /root
git clone https://github.com/VanAndelInstitute/VAIDocker.git
cd /root/VAIDocker/bbcnode_aws
aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 639677452477.dkr.ecr.us-east-2.amazonaws.com
docker-compose up -d
sleep 5
docker exec rstudio_bbc cp /etc/pam.d/login /etc/pam.d/rstudio
docker exec rstudio_bbc systemctl start systemd-user-sessions

#WITHIN CONTAINER
#sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
#sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
#yum install passwd
#cp /etc/pam.d/login /etc/pam.d/rstudio
#useradd ec2-user
#passwd ec2-user
#systemctl start systemd-user-sessions

