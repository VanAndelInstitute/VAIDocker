FROM vanandelinstitute/alma9sshd

ENV container docker
LABEL maintainer="zack ramjan"

RUN yum update -y && \
yum install -y yum-utils && \
yum groupinstall -y 'Development Tools' && \
dnf config-manager --set-enabled crb && \
yum install -y --allowerasing curl libcurl libcurl-devel && \
yum install -y epel-release openssl-devel libuuid-devel libseccomp-devel wget squashfs-tools vim unzip wget sssd-client \
openssh-server sudo singularity golang git lftp python python3 tmux environment-modules munge munge-devel pam-devel json-devel \
libyaml http-parser hdf5-devel http-parser-devel hdf5 hwloc hwloc-devel rrdtool rrdtool-devel readline readline-devel net-tools \
bind-utils

#set up module env
RUN echo export MODULEPATH=/cm/local/modulefiles:/cm/shared/modulefiles > /etc/profile.d/modules.sh && \
echo source /usr/share/Modules/init/bash >> /etc/profile.d/modules.sh

#install slurm
COPY startservices.sh /root
COPY installSlurm.sh /root
RUN bash /root/installSlurm.sh


VOLUME [ "/sys/fs/cgroup" ]

CMD ["/usr/sbin/init"]
