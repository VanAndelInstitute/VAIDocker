FROM vanandelinstitute/oracle8systemd
COPY startservices.sh /root/startservices.sh
RUN yum update -y && yum install -y oracle-epel-release-el8
RUN yum install -y vim curl unzip wget sssd-client openssh-server sudo && \
    echo Port 22100 >> /etc/ssh/sshd_config && \
    chmod +x /root/startservices.sh && \
