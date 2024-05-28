wget https://developer.download.nvidia.com/compute/cudnn/9.0.0/local_installers/cudnn-local-repo-rhel9-9.0.0-1.0-1.x86_64.rpm
rpm -i cudnn-local-repo-rhel9-9.0.0-1.0-1.x86_64.rpm
dnf -y install cudnn-cuda-11
