#!/bin/bash
systemctl daemon-reload
systemctl start sshd
systemctl start rsyslog
systemctl start systemd-user-sessions

#MUNGE
cp /varidata/research/clustermgmt/vaihpc/munge/munge.key /etc/munge
chown munge /etc/munge/munge.key
systemctl start	munge

#HOSTS
cat /etc/etc.server/hosts > /etc/hosts

if [[ -z "${SLURM_MASTER}" ]]; then
    #SLURMD (this is a compute node)
    cp /varidata/research/clustermgmt/vaihpc/slurm/etc/* /usr/local/etc
    systemctl start	slurmd
else
    #SLURMCTLD (We are starting the master)
    cp /cm/shared/vaihpc/slurm/etc/* /usr/local/etc/
    systemctl start	slurmctld
fi
