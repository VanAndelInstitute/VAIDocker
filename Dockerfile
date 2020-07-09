FROM vanandelinstitute/systemdcentos
COPY startservices.sh /root/startservices.sh
RUN yum update -y && yum install -y epel-release
RUN yum install -y vim curl unzip wget sssd-client openssh-server sudo && \
    echo Port 22100 >> /etc/ssh/sshd_config && \
    chmod +x /root/startservices.sh && \
    echo "zack.ramjan ALL=(ALL) PASSWD: ALL" >> /etc/sudoers && \	
    echo "scott.givan ALL=(ALL) PASSWD: ALL" >> /etc/sudoers	
