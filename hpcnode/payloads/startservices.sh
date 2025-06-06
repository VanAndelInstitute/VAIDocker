#!/bin/bash
systemctl daemon-reload
systemctl start sshd
systemctl start rsyslog
systemctl start systemd-user-sessions

#fix tmp noexec to exec
perl /root/fixTmp.pl

#set /etc/environment if we have a gpunode
if [ -d "/proc/driver/nvidia" ]; then
	cat /etc/environment.gpunode >> /etc/environment
fi

#MUNGE
cp /varidata/research/clustermgmt/vaihpc/munge/munge.key /etc/munge
chown munge /etc/munge/munge.key
systemctl start	munge


sleep 20
if [ "$HOSTNAME" =~  "slurm" ]; then
    #SLURMCTLD (We are starting the master)
    systemctl enable slurmdbd
    systemctl start slurmdbd
    sleep 60
    systemctl enable slurmctld
    systemctl start slurmctld
else
    #SLURMD (this is a compute node)
    systemctl enable slurmd
    systemctl start slurmd
fi
