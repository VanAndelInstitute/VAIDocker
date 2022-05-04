VAI DOCKER
==================


## Notes

### To run centos8 systemd, you need to start as follows:

```docker run --privileged --name test -v /sys/fs/cgroup:/sys/fs/cgroup:ro -d vanandelinstitute/systemdcentos```
