#!/bin/bash

#check if we are on a instance that has dedicated SSD
if [ -b "/dev/nvme1n1" ]; 
then
    lsblk |grep nvme1n1 |grep -v home && mkfs.ext4 -E nodiscard /dev/nvme1n1
    mkdir /home/ec2-user/SSD_tempspace
    mount -o discard,noatime /dev/nvme1n1 /home/ec2-user/SSD_tempspace
fi    

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
su - ec2-user -c "echo mounting studies"

#fire up the container
aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 639677452477.dkr.ecr.us-east-2.amazonaws.com
docker-compose up -d
sleep 5

#ensure the container service is running
docker exec rstudio_bbc cp /etc/pam.d/login /etc/pam.d/rstudio
docker exec rstudio_bbc systemctl start systemd-user-sessions


#set up the cert and proxy
echo `curl -s ifconfig.me`.nip.io { > /root/Caddyfile
echo "   reverse_proxy localhost:8080" >> /root/Caddyfile
echo } >> /root/Caddyfile
docker run -d --name caddy --network host -v /root/Caddyfile:/etc/caddy/Caddyfile caddy

#set the password and display URL to user on login
PASSWORD=`tr -dc A-Za-z0-9 </dev/urandom | head -c 13 ; echo ''`
instance_id=$(curl -s "http://169.254.169.254/latest/meta-data/instance-id")
instance_region=$(curl -s "http://169.254.169.254/latest/meta-data/placement/region")
aws ssm put-parameter --name "/rstudio/user/sc-environments/ec2-instance/${instance_id}" --value $PASSWORD --region $instance_region --type SecureString --no-overwrite 2> /dev/null
PASSWORD=`aws ssm get-parameter --name "/rstudio/user/sc-environments/ec2-instance/${instance_id}"  --region $instance_region --with-decryption --output text | cut -f 7`
echo $PASSWORD | passwd --stdin ec2-user
#set password inside container as well
docker cp /etc/pam.d/passwd rstudio_bbc:/etc/pam.d/
docker exec rstudio_bbc chmod 600 /etc/shadow
docker exec rstudio_bbc yum -y install passwd
docker exec rstudio_bbc bash -l -c "echo $PASSWORD |  passwd --stdin manageR"

MYIP=`curl -s ifconfig.me 2> /dev/null`
rm -f /etc/motd
echo > /etc/motd
echo >> /etc/motd
echo >> /etc/motd
echo >> /etc/motd
echo "#######################################################" >> /etc/motd
echo "You can log into RSTUDIO SERVER at the following URL:" >> /etc/motd
echo  https://$MYIP.nip.io  >> /etc/motd
echo  username: manageR   >> /etc/motd
echo  password: $PASSWORD  >> /etc/motd
echo "#######################################################" >> /etc/motd
echo >> /etc/motd
echo >> /etc/motd
echo >> /etc/motd
echo >> /etc/motd


#WITHIN CONTAINER (NOT USED)
#sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
#sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
#yum install passwd
#cp /etc/pam.d/login /etc/pam.d/rstudio
#useradd ec2-user
#passwd ec2-user
#systemctl start systemd-user-sessions

