FROM vanandelinstitute/hpc

### MODIFY ONDEMAND USERNAME AND PASSWORD HERE
#ZR ENV ONDEMAND_USER ondemand
#ZR ENV ONDEMAND_PASSWORD password
#ENV ROOT_PASSWORD password
### END MODIFY

### DO NOT MODIFY ###
RUN yum install -y https://yum.osc.edu/ondemand/latest/ondemand-release-web-3.0-1.noarch.rpm
COPY payloads/ondemand-web.repo /etc/yum.repos.d/ondemand-web.repo
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
    && yum install -y ondemand \
    && yum install -y mod_authnz_pam mod_auth_mellon mod_ssl \
    && echo "LoadModule authnz_pam_module modules/mod_authnz_pam.so" > /etc/httpd/conf.modules.d/55-authnz_pam.conf
RUN mkdir -p /etc/ood/config/clusters.d
COPY payloads/slurm_cluster.yml /etc/ood/config/clusters.d/hpc.yml
RUN mkdir /etc/ood/config/apps
RUN mkdir /etc/ood/config/apps/shell
RUN mkdir /etc/ood/config/apps/dashboard
COPY payloads/shell/env /etc/ood/config/apps/shell
COPY payloads/dashboard/env /etc/ood/config/apps/dashboard/
RUN mkdir -p /etc/ood/config/apps/bc_desktop
COPY payloads/hpc-desktop.yml /etc/ood/config/apps/bc_desktop/hpc.yml
COPY payloads/ood_portal.yml /etc/ood/config/ood_portal.yml
COPY payloads/proxy.conf /etc/httpd/conf.d/proxy.conf
COPY payloads/xfce.sh /var/www/ood/apps/sys/bc_desktop/template/desktops/xfce.sh
COPY payloads/certs/ondemand.vai.org.crt /etc/pki/tls/certs/ondemand.vai.org.crt
COPY payloads/certs/ondemand.vai.org.key /etc/pki/tls/private/ondemand.vai.org.key
COPY payloads/certs/ondemand.vai.org-interm.crt /etc/pki/tls/certs/ondemand.vai.org-interm.crt
#COPY payloads/saml/00-mellon.conf /etc/httpd/conf.d/00-mellon.conf
COPY payloads/saml/mellon_create_metadata.sh /usr/libexec/mod_auth_mellon/mellon_create_metadata.sh
COPY payloads/vnc.html /var/www/ood/apps/sys/dashboard/public/noVNC-1.3.0/vnc.html
COPY payloads/oodRstudio/sh_rstudio /var/www/ood/apps/sys/sh_rstudio
COPY payloads/branding /var/www/ood/public/vai
COPY payloads/ondemand.d /etc/ood/config/ondemand.d
COPY payloads/ood.rb /etc/ood/config/apps/dashboard/initializers/
RUN /opt/ood/ood-portal-generator/sbin/update_ood_portal

#ZR RUN systemctl enable sshd.service
RUN systemctl enable httpd

#ZR RUN scl enable ondemand -- htpasswd -cb /opt/rh/httpd24/root/etc/httpd/.htpasswd $ONDEMAND_USER $ONDEMAND_PASSWORD

#ZR COPY ./entrypoint.sh /usr/sbin/entrypoint
#ZR RUN chmod a+x /usr/sbin/entrypoint

#ZR VOLUME [ "/sys/fs/cgroup" ]
#ZR CMD ["/usr/sbin/entrypoint"]
