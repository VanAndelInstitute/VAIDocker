FROM vanandelinstitute/hpc

### MODIFY ONDEMAND USERNAME AND PASSWORD HERE
#ZR ENV ONDEMAND_USER ondemand
#ZR ENV ONDEMAND_PASSWORD password
#ENV ROOT_PASSWORD password
### END MODIFY

### DO NOT MODIFY ###
COPY ondemand-web.repo /etc/yum.repos.d/ondemand-web.repo
#ZR RUN adduser $ONDEMAND_USER

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
    && yum install -y ondemand

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
RUN systemctl enable httpd

#ZR RUN scl enable ondemand -- htpasswd -cb /opt/rh/httpd24/root/etc/httpd/.htpasswd $ONDEMAND_USER $ONDEMAND_PASSWORD

#ZR COPY ./entrypoint.sh /usr/sbin/entrypoint
#ZR RUN chmod a+x /usr/sbin/entrypoint

#ZR VOLUME [ "/sys/fs/cgroup" ]
#ZR CMD ["/usr/sbin/entrypoint"]