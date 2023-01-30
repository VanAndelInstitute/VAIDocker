FROM almalinux/9-init

ENV container docker
LABEL maintainer="zack ramjan"

#set legacy symlinks
COPY  legacymounts.tar /root
#install slurm
COPY installSlurm.sh /root
COPY startservices.sh /root

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
yum install -y singularity-ce hdf5 hdf5-devel json-devel && \
#install modules
echo export MODULEPATH=/cm/local/modulefiles:/cm/shared/modulefiles > /etc/profile.d/modules.sh && \
echo source /usr/share/Modules/init/bash >> /etc/profile.d/modules.sh && \ 
#make /primary and /secondary work with symlinks
tar xvf /root/legacymounts.tar && \
#install slurm
bash /root/installSlurm.sh && \
#make /etc/hosts update with host system
mkdir /etc/etc.server && \
cp /etc/hosts /etc/etc.server/hosts 
