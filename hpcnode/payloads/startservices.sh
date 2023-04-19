#!/bin/bash
systemctl daemon-reload
systemctl start sshd
systemctl start rsyslog
systemctl start systemd-user-sessions

#MUNGE
cp /varidata/research/clustermgmt/vaihpc/munge/munge.key /etc/munge
chown munge /etc/munge/munge.key
systemctl start	munge

sleep 20
if [ "$HOSTNAME" =  "slurm" ]; then
    #SLURMCTLD (We are starting the master)
    systemctl start slurmdbd
    sleep 60
    systemctl start slurmctld
else
    #SLURMD (this is a compute node)
    systemctl start slurmd
fi
