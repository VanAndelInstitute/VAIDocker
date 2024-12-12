 #!/bin/bash
 cd /root
 SLURMVER=24.11.0
 wget https://download.schedmd.com/slurm/slurm-$SLURMVER.tar.bz2
 tar -jxvf slurm-$SLURMVER.tar.bz2
 cd slurm-$SLURMVER
 ./configure
 make -j 32 
 make install
 cd contribs/torque
 make install
 cd ../..
 cd contribs/pam
 make install
 cd ../..
 cd contribs/perlapi
 make install
 cd ../..
 cd etc
 cp *.service /etc/systemd/system
