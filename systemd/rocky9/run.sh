docker run -dit --name alma9systemd --tmpfs /run --tmpfs /run/lock --tmpfs /tmp -v /sys/fs/cgroup:/sys/fs/cgroup:ro alma9systemd
