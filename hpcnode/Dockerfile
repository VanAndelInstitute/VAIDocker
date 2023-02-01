FROM almalinux/9-init

ENV container docker
LABEL maintainer="zack ramjan"

#set legacy symlinks
COPY payloads/legacymounts.tar /root
#install slurm
COPY payloads/installSlurm.sh /root
COPY payloads/startservices.sh /root
COPY payloads/etcHostsSync.service /etc/systemd/system
COPY payloads/etcHostsSync.timer /etc/systemd/system
COPY payloads/slurmStart.service /etc/systemd/system
COPY payloads/slurmStart.timer /etc/systemd/system


RUN yum update -y  && \
yum install -y yum-utils epel-release && \
yum groupinstall -y 'Development Tools' && \
dnf config-manager --set-enabled crb && \
yum install -y --allowerasing curl libcurl libcurl-devel && \
yum install -y  rsyslog openssl-devel libuuid-devel libseccomp-devel wget squashfs-tools vim unzip wget sssd-client \
openssh-server sudo golang git lftp python python3 tmux environment-modules munge munge-devel pam-devel \
libyaml http-parser http-parser-devel hwloc hwloc-devel rrdtool rrdtool-devel readline readline-devel net-tools \
bind-utils perl-FindBin perl-autouse perl-ExtUtils-MakeMaker perl-English openssh-server openssh-clients iputils \
blas blas-devel lua logrotate coreutils-common p7zip tree ccache && \
yum install -y singularity-ce hdf5 hdf5-devel json-devel mariadb mariadb-devel dbus-devel numactl-libs numactl-devel openmpi openmpi-devel&& \
#install modules
echo export MODULEPATH=/cm/local/modulefiles:/cm/shared/modulefiles > /etc/profile.d/modules.sh && \
echo source /usr/share/Modules/init/bash >> /etc/profile.d/modules.sh && \ 
#make /primary and /secondary work with symlinks
tar xvf /root/legacymounts.tar && \
#install slurm
bash /root/installSlurm.sh && \
#make /etc/hosts update with host system
mkdir /etc/etc.server && \
cp /etc/hosts /etc/etc.server/hosts && \
systemctl enable etcHostsSync.timer && \
systemctl enable slurmStart.timer
