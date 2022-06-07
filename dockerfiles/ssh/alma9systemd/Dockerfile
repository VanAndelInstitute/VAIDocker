FROM vanandelinstitute/alma9systemd
COPY startservices.sh /root/startservices.sh
RUN yum update -y && yum install -y epel-release
RUN yum install -y vim unzip wget sssd-client openssh-server openssh-clients sudo && \
    echo Port 22100 >> /etc/ssh/sshd_config && \
    chmod +x /root/startservices.sh 
