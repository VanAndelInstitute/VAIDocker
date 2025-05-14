FROM almalinux/9-init

ENV container docker
LABEL maintainer="zack ramjan"

#set legacy symlinks
COPY payloads/legacymounts.tar /root

#install slurm
COPY payloads/installSlurm.sh /root
COPY payloads/startservices.sh /root
COPY payloads/etcHostsSync.service /etc/systemd/system
COPY payloads/etcHostsSync.timer /etc/systemd/system
COPY payloads/slurmStart.service /etc/systemd/system
COPY payloads/slurmStart.timer /etc/systemd/system


RUN yum update -y  && \
yum install -y yum-utils epel-release && \
yum groupinstall -y 'Development Tools' && \
yum groupinstall -y 'Xfce' && \
dnf config-manager --set-enabled crb && \
yum install -y --allowerasing curl libcurl libcurl-devel && \
yum install -y  rsyslog openssl-devel libuuid-devel libseccomp-devel wget squashfs-tools vim unzip wget sssd-client \
openssh-server sudo golang git lftp python python3 tmux environment-modules munge munge-devel pam-devel \
libyaml http-parser http-parser-devel hwloc hwloc-devel rrdtool rrdtool-devel readline readline-devel net-tools \
bind-utils perl-FindBin perl-autouse perl-ExtUtils-MakeMaker perl-English openssh-server openssh-clients iputils \
blas blas-devel lua lua-devel logrotate coreutils-common p7zip tree ccache gnuplot && \
yum install -y singularity-ce hdf5 hdf5-devel json-devel mariadb mariadb-devel dbus-devel numactl-libs numactl-devel \
openmpi openmpi-devel python3-devel hostname mvapich2 mvapich2-devel cmake rsync telnet emacs-nox bc nmap-ncat \
python3-websockify xorg-x11-xauth xkbcomp dbus-x11 firefox libtiff libtiff-devel ghostscript libpng-devel \
libX11-devel bzip2-devel mlocate pcre2-devel gsl-devel postfix s-nail bash-completion fontconfig-devel harfbuzz-devel \
fribidi-devel libjpeg-turbo-devel nano cairo-devel libXt-devel pango-devel screen sqlite-devel java-1.8.0-openjdk-headless \
expat-devel udunits2-devel jxrlib-devel cronie ncurses-compat-libs libpq-devel lapack-devel armadillo-devel tcllib gdal-devel \
tcl-devel tk-devel proj-devel geos-devel texlive-texlive.infra thunar-archive-plugin ristretto perl-IPC-Cmd mesa-libGLU \
fftw-devel libsodium-devel glpk-devel texlive texlive-pdflscape texlive-multirow jemalloc-devel libatomic_ops-devel mesa-libGL-devel \
graphviz-devel libzstd-devel  gmp-devel netcdf-devel gv ipmitool evince mousepad mpfr-devel xcb-util-cursor mesa-libOSMesa gedit \
VirtualGL-devel libdb-devel xarchiver && \
#install turboVNC
wget "https://sourceforge.net/projects/turbovnc/files/3.0.2/turbovnc-3.0.2.x86_64.rpm/download" -O /root/turbovnc.rpm && \
rpm -ivh --nodeps /root/turbovnc.rpm && \
rm /root/turbovnc.rpm && \
#install modules
echo export MODULEPATH=/cm/local/modulefiles:/cm/shared/modulefiles > /etc/profile.d/modules.sh && \
echo source /usr/share/Modules/init/bash >> /etc/profile.d/modules.sh && \ 
#make /primary and /secondary work with symlinks
tar xvf /root/legacymounts.tar && \
#install slurm
bash /root/installSlurm.sh && \
rm -rf /root/slurm-* && \
#make /etc/hosts update with host system
mkdir /etc/etc.server && \
cp /etc/hosts /etc/etc.server/hosts && \
systemctl enable etcHostsSync.timer && \
systemctl enable slurmStart.timer && \
systemctl enable postfix && \
systemctl enable crond && \
echo ReadKMsg=no >> /etc/systemd/journald.conf


COPY payloads/slurmd.service /etc/systemd/system/slurmd.service
COPY payloads/hpcadmins_sudoers /etc/sudoers.d
COPY payloads/hpcusersudoers /etc/sudoers.d
COPY payloads/main.cf  /etc/postfix/main.cf
COPY payloads/rsyslog.graylog.conf /etc/rsyslog.d/rsyslog.graylog.conf
COPY payloads/xfce.sh /opt/TurboVNC/bin/xstartup.turbovnc
COPY payloads/singularity.conf /etc/singularity/singularity.conf
COPY payloads/fixTmp.pl /root/fixTmp.pl
COPY payloads/nohomedir.sh /etc/profile.d/nohomedir.sh
COPY payloads/environment.gpunode /etc/environment.gpunode
