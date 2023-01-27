#!/bin/bash
systemctl daemon-reload
systemctl start sshd
systemctl start rsyslog
systemctl start systemd-user-sessions

#MUNGE
cp /varidata/research/clustermgmt/vaihpc/munge/munge.key /etc/munge
chown munge /etc/munge/munge.key
systemctl start	munge

#SET HOSTNAME
#myIP=`ifconfig | awk '/10.152.220/ {print $2}'`
#myHost=`cat /etc/hosts | grep $myIP | awk '{print $2}'`
#hostname $myHost

#SLURMD
cp /varidata/research/clustermgmt/vaihpc/slurm/etc/* /usr/local/etc
systemctl start	slurmd
