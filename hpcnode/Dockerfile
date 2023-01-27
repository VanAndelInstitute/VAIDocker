FROM almalinux/9-init

ENV container docker
LABEL maintainer="zack ramjan"

RUN yum update -y 
RUN yum install -y yum-utils epel-release && \
yum groupinstall -y 'Development Tools' && \
dnf config-manager --set-enabled crb && \
yum install -y --allowerasing curl libcurl libcurl-devel && \
yum install -y  rsyslog openssl-devel libuuid-devel libseccomp-devel wget squashfs-tools vim unzip wget sssd-client \
openssh-server sudo golang git lftp python python3 tmux environment-modules munge munge-devel pam-devel \
libyaml http-parser http-parser-devel hwloc hwloc-devel rrdtool rrdtool-devel readline readline-devel net-tools \
bind-utils perl-FindBin perl-autouse perl-ExtUtils-MakeMaker perl-English openssh-server openssh-clients  
RUN yum install -y singularity-ce hdf5 hdf5-devel json-devel

#set up module env
RUN echo export MODULEPATH=/cm/local/modulefiles:/cm/shared/modulefiles > /etc/profile.d/modules.sh && \
echo source /usr/share/Modules/init/bash >> /etc/profile.d/modules.sh

#set legacy symlinks
COPY  legacymounts.tar /root
RUN tar xvf /root/legacymounts.tar

#install slurm
COPY startservices.sh /root
COPY installSlurm.sh /root
RUN bash /root/installSlurm.sh

#VOLUME [ "/sys/fs/cgroup" ]
