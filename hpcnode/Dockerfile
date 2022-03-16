FROM oraclelinux:8

ENV container docker
MAINTAINER zack ramjan <>

RUN yum update -y && yum install -y oracle-epel-release-el8

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

RUN yum install -y vim curl unzip wget sssd-client openssh-server sudo && \
    echo Port 22100 >> /etc/ssh/sshd_config && \
    chmod +x /root/startservices.sh 


#install go


#install singularity


#install nvidia


VOLUME [ "/sys/fs/cgroup" ]

CMD ["/usr/sbin/init"]
