FROM vanandelinstitute/hpc

### MODIFY ONDEMAND USERNAME AND PASSWORD HERE
ENV ONDEMAND_USER ondemand
ENV ONDEMAND_PASSWORD password
#ENV ROOT_PASSWORD password
### END MODIFY

### DO NOT MODIFY ###

RUN adduser $ONDEMAND_USER

# Setup all SSH stuff
#ZR RUN yum install -y openssh-server
#ZR RUN mkdir /var/run/sshd
#ZR RUN echo "root:$ROOT_PASSWORD" | chpasswd
#ZR RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

#ZR ENV NOTVISIBLE "in users profile"
#ZR RUN echo "export VISIBLE=now" >> /etc/profile

#ZR COPY ./sshd_config /etc/ssh/sshd_config

# Required for base host key, otherwise you can't get into the container :(
#ZR RUN /usr/bin/ssh-keygen -A

# Install OnDemand
RUN yum update -y \
    && yum install -y centos-release-scl \
    && yum install -y https://yum.osc.edu/ondemand/1.6/ondemand-release-web-1.6-4.noarch.rpm \
    && yum install -y ondemand-selinux

# Systemd
#ZR RUN yum -y install systemd; yum clean all; \
#ZR     (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
#ZR     rm -f /lib/systemd/system/multi-user.target.wants/*; \
#ZR     rm -f /etc/systemd/system/*.wants/*;\
#ZR     rm -f /lib/systemd/system/local-fs.target.wants/*; \
#ZR     rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
#ZR     rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
#ZR    rm -f /lib/systemd/system/basic.target.wants/*; \
#ZR     rm -f /lib/systemd/system/anaconda.target.wants/*;

#ZR RUN systemctl enable sshd.service
RUN systemctl enable httpd24-httpd

RUN scl enable ondemand -- htpasswd -cb /opt/rh/httpd24/root/etc/httpd/.htpasswd $ONDEMAND_USER $ONDEMAND_PASSWORD

#ZR COPY ./entrypoint.sh /usr/sbin/entrypoint
#ZR RUN chmod a+x /usr/sbin/entrypoint

#ZR VOLUME [ "/sys/fs/cgroup" ]
#ZR CMD ["/usr/sbin/entrypoint"]