FROM oraclelinux:8

ENV container docker
LABEL maintainer="zack ramjan"

RUN yum update -y && \
yum install -y oracle-epel-release-el8 yum-utils && \
yum groupinstall -y 'Development Tools' && \
dnf config-manager --set-enabled ol8_codeready_builder && \
yum install -y openssl-devel libuuid-devel libseccomp-devel wget squashfs-tools vim curl unzip wget sssd-client \
openssh-server sudo singularity golang git lftp python3 python2 tmux environment-modules slurm-pam_slurm slurm-slurmd slurm-torque munge slurm-slurmdbd slurm-slurmctld

# install systemd
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

#set up ssh
COPY startservices.sh /root/startservices.sh
RUN echo Port 22100 >> /etc/ssh/sshd_config && \
    chmod +x /root/startservices.sh 

#set up module env
RUN echo export MODULEPATH=/cm/local/modulefiles:/cm/shared/modulefiles > /etc/profile.d/modules.sh && \
echo source /usr/share/Modules/init/bash >> /etc/profile.d/modules.sh

#install nvidia


VOLUME [ "/sys/fs/cgroup" ]

CMD ["/usr/sbin/init"]
