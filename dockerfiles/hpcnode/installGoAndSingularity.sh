$!/bin/bash
#CURRENTLY NOT USED. WE USE THE YUM PROVIVED SINGULARITY INSTEAD

#install go
GOVERSION=1.11
SINGVERSION=3.0.3
OS=linux 
ARCH=amd64

cd /usr/local
wget https://dl.google.com/go/go$GOVERSION.$OS-$ARCH.tar.gz
tar -C /usr/local -xzvf go$GOVERSION.$OS-$ARCH.tar.gz
rm go$GOVERSION.$OS-$ARCH.tar.gz
echo 'export GOPATH=${HOME}/go' >> /etc/profile.d/singularity.sh
echo 'export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin'  >> /etc/profile.d/singularity.sh
source /etc/profile.d/singularity.sh

mkdir -p $GOPATH/src/github.com/sylabs
cd $GOPATH/src/github.com/sylabs 
wget https://github.com/sylabs/singularity/releases/download/v${SINGVERSION}/singularity-${SINGVERSION}.tar.gz 
tar -xzf singularity-${SINGVERSION}.tar.gz
cd ./singularity 
./mconfig