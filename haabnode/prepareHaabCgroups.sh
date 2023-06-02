#!/bin/sh
#remount cgroups in case it has nsdelegate set
mount -t cgroup2 -o remount,rw,nosuid,nodev,noexec,relatime none /sys/fs/cgroup/
MNTDIR=/run/docker_cgroup_haab
CGROUP=/sys/fs/cgroup
mkdir -p $MNTDIR/$CGROUP
mount --bind -o ro $CGROUP $MNTDIR/$CGROUP
mount -o rw,remount $MNTDIR/$CGROUP
echo $CGROUP $MNTDIR/$CGROUP
