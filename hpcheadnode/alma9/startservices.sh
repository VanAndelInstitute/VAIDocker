#!/bin/bash
systemctl daemon-reload
systemctl start sshd
systemctl start systemd-user-sessions

#MUNGE
cp /cm/shared/vaihpc/munge/munge.key /etc/munge
chown munge /etc/munge/munge.key
systemctl start	munge

#SET HOSTNAME
myIP=`ifconfig | awk '/10.152.220/ {print $2}'`
myHost=`cat /etc/hosts | grep $myIP | awk '{print $2}'`
hostname $myHost

#SLURMCTLD
cp /cm/shared/vaihpc/slurm/etc/* /etc/slurm/
systemctl start	slurmctld