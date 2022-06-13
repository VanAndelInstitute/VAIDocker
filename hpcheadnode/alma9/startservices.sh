#!/bin/bash

systemctl start sshd
systemctl start systemd-user-sessions

#MUNGE
cp /cm/shared/vaihpc/munge/munge.key /etc/munge
chown munge /etc/munge/munge.key
systemctl start	munge

#SLURMCTLD
cp /cm/shared/vaihpc/slurm/etc/* /etc/slurm/
systemctl start	slurmctld