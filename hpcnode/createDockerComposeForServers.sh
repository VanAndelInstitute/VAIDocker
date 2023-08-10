#!/bin/bash
./generateComputeNodeEntries.pl --start 1 --end 32 --cpus 8 --memory 24 --pidlimit 4092 --interface eth2 > server001-docker-compose.yml
./generateComputeNodeEntries.pl --start 33 --end 42 --cpus 16 --memory 80 --pidlimit 4092 --interface eth3 > server002-docker-compose.yml
./generateComputeNodeEntries.pl --start 45 --end 46 --cpus 64 --memory 400 --pidlimit 10280 --interface eth2 > server003-docker-compose.yml
./generateComputeNodeEntries.pl --start 47 --end 48 --cpus 64 --memory 400 --pidlimit 10280 --interface eth2 > server004-docker-compose.yml
./generateComputeNodeEntries.pl --start 49 --end 50 --cpus 64 --memory 400 --pidlimit 10280 --interface eth2 > server005-docker-compose.yml
./generateComputeNodeEntries.pl --start 51 --end 52 --cpus 64 --memory 400 --pidlimit 10280 --interface eth3 > server006-docker-compose.yml
./generateComputeNodeEntries.pl --start 53 --end 54 --cpus 64 --memory 400 --pidlimit 10280 --interface eth3 > server007-docker-compose.yml
./generateComputeNodeEntries.pl --start 55 --end 56 --cpus 64 --memory 400 --pidlimit 10280 --interface eth3 > server008-docker-compose.yml
./generateComputeNodeEntries.pl --start 69 --end 70 --cpus 64 --memory 400 --pidlimit 10280 --interface eth3 > server009-docker-compose.yml
./generateComputeNodeEntries.pl --start 71 --end 72 --cpus 64 --memory 400 --pidlimit 10280 --interface eth2 > server010-docker-compose.yml
./generateComputeNodeEntries.pl --start 73 --end 74 --cpus 64 --memory 400 --pidlimit 10280 --interface eth2 > server011-docker-compose.yml
./generateComputeNodeEntries.pl --start 77 --end 77 --cpus 128 --memory 820 --pidlimit -1 --interface eth2 > server012-docker-compose.yml
./generateComputeNodeEntries.pl --start 78 --end 78 --cpus 128 --memory 820 --pidlimit -1 --interface eth2 > server013-docker-compose.yml
./generateComputeNodeEntries.pl --start 79 --end 79 --cpus 128 --memory 820 --pidlimit -1 --interface eth3 > server014-docker-compose.yml
./generateComputeNodeEntries.pl --start 80 --end 80 --cpus 128 --memory 820 --pidlimit -1 --interface eth3 > server015-docker-compose.yml
./generateComputeNodeEntries.pl --start 81 --end 81 --cpus 128 --memory 820 --pidlimit -1 --interface eth2 > server016-docker-compose.yml
./generateComputeNodeEntries.pl --start 82 --end 82 --cpus 128 --memory 1800 --pidlimit -1 --interface eth2 > server017-docker-compose.yml
./generateComputeNodeEntries.pl --start 83 --end 83 --cpus 128 --memory 1800 --pidlimit -1 --interface eth2 > server018-docker-compose.yml
./generateComputeNodeEntries.pl --start 86 --end 86 --cpus 128 --memory 820 --pidlimit -1 --interface eth2 > server019-docker-compose.yml
./generateComputeNodeEntries.pl --start 87 --end 87 --cpus 128 --memory 820 --pidlimit -1 --interface eth2 > server020-docker-compose.yml
./generateComputeNodeEntries.pl --start 88 --end 88 --cpus 128 --memory 820 --pidlimit -1 --interface eth2 > server021-docker-compose.yml
./generateComputeNodeEntries.pl --start 113 --end 113 --cpus 128 --memory 820 --pidlimit -1 --interface eth2 > server022-docker-compose.yml
./generateComputeNodeEntries.pl --start 84 --end 84 --cpus 28 --memory 200 --pidlimit -1 --interface eth2 > server023-docker-compose.yml
./generateComputeNodeEntries.pl --start 85 --end 85 --cpus 28 --memory 200 --pidlimit -1 --interface eth2 > server024-docker-compose.yml
./generateComputeNodeEntries.pl --start 89 --end 89 --cpus 28 --memory 200 --pidlimit -1 --interface eth2 > server025-docker-compose.yml
./generateComputeNodeEntries.pl --start 90 --end 90 --cpus 28 --memory 200 --pidlimit -1 --interface eth2 > server026-docker-compose.yml
./generateComputeNodeEntries.pl --start 91 --end 91 --cpus 48 --memory 200 --pidlimit -1 --interface eth2 > server027-docker-compose.yml
./generateComputeNodeEntries.pl --start 92 --end 92 --cpus 48 --memory 200 --pidlimit -1 --interface eth2 > server028-docker-compose.yml
./generateComputeNodeEntries.pl --start 93 --end 93 --cpus 48 --memory 200 --pidlimit -1 --interface eth2 > server029-docker-compose.yml
./generateComputeNodeEntries.pl --start 94 --end 94 --cpus 48 --memory 200 --pidlimit -1 --interface eth2 > server030-docker-compose.yml
./generateComputeNodeEntries.pl --start 95 --end 95 --cpus 28 --memory 200 --pidlimit -1 --interface eth2 > server031-docker-compose.yml
./generateComputeNodeEntries.pl --start 96 --end 96 --cpus 28 --memory 200 --pidlimit -1 --interface eth2 > server032-docker-compose.yml
./generateComputeNodeEntries.pl --start 97 --end 97 --cpus 80 --memory 3000 --pidlimit -1 --interface eth4 > server033-docker-compose.yml
./generateComputeNodeEntries.pl --start 98 --end 98 --cpus 40 --memory 200 --pidlimit -1 --interface eth2 > server034-docker-compose.yml
./generateComputeNodeEntries.pl --start 99 --end 99 --cpus 40 --memory 200 --pidlimit -1 --interface eth2 > server035-docker-compose.yml
./generateComputeNodeEntries.pl --start 100 --end 100 --cpus 40 --memory 280 --pidlimit -1 --interface eth2 > server036-docker-compose.yml
./generateComputeNodeEntries.pl --start 101 --end 101 --cpus 40 --memory 280 --pidlimit -1 --interface eth2 > server037-docker-compose.yml
./generateComputeNodeEntries.pl --start 102 --end 102 --cpus 40 --memory 400 --pidlimit -1 --interface eth2 > server038-docker-compose.yml
./generateComputeNodeEntries.pl --start 103 --end 103 --cpus 40 --memory 400 --pidlimit -1 --interface eth2 > server039-docker-compose.yml
./generateComputeNodeEntries.pl --start 104 --end 104 --cpus 40 --memory 280 --pidlimit -1 --interface eth1 > server040-docker-compose.yml
./generateComputeNodeEntries.pl --start 105 --end 105 --cpus 28 --memory 280 --pidlimit -1 --interface eth2 > server041-docker-compose.yml
./generateComputeNodeEntries.pl --start 106 --end 106 --cpus 40 --memory 280 --pidlimit -1 --interface eth2 > server042-docker-compose.yml
./generateComputeNodeEntries.pl --start 107 --end 107 --cpus 40 --memory 200 --pidlimit -1 --interface eth2 > server043-docker-compose.yml
./generateComputeNodeEntries.pl --start 108 --end 108 --cpus 40 --memory 200 --pidlimit -1 --interface eth2 > server044-docker-compose.yml
./generateComputeNodeEntries.pl --start 109 --end 109 --cpus 40 --memory 280 --pidlimit -1 --interface eth2 > server045-docker-compose.yml
./generateComputeNodeEntries.pl --start 110 --end 110 --cpus 16 --memory 400 --pidlimit -1 --interface eth2 > server046-docker-compose.yml
./generateComputeNodeEntries.pl --start 111 --end 111 --cpus 64 --memory 200 --pidlimit -1 --interface eth2 > server047-docker-compose.yml
./generateComputeNodeEntries.pl --start 112 --end 112 --cpus 64 --memory 400 --pidlimit -1 --interface eth2 > server048-docker-compose.yml
./generateComputeNodeEntries.pl --start 114 --end 114 --cpus 28 --memory 400 --shmem 256 --pidlimit -1 --interface eth0 > server049-docker-compose.yml
./generateComputeNodeEntries.pl --start 115 --end 115 --cpus 28 --memory 400 --shmem 256 --pidlimit -1 --interface eth0 > server050-docker-compose.yml
./generateComputeNodeEntries.pl --start 116 --end 116 --cpus 28 --memory 400 --shmem 256 --pidlimit -1 --interface eth2 > server051-docker-compose.yml
./generateComputeNodeEntries.pl --start 117 --end 117 --cpus 28 --memory 400 --shmem 256 --pidlimit -1 --interface eth2 > server052-docker-compose.yml
./generateComputeNodeEntries.pl --start 118 --end 118 --cpus 28 --memory 400 --shmem 256 --pidlimit -1 --interface eth2 > server053-docker-compose.yml
./generateComputeNodeEntries.pl --start 119 --end 119 --cpus 16 --memory 200 --shmem 256 --pidlimit -1 --interface eth2 > server054-docker-compose.yml
./generateComputeNodeEntries.pl --start 120 --end 120 --cpus 40 --memory 350 --shmem 256 --pidlimit -1 --interface eth0 > server055-docker-compose.yml
./generateComputeNodeEntries.pl --start 121 --end 121 --cpus 28 --memory 400 --shmem 256 --pidlimit -1 --interface eth2 > server056-docker-compose.yml
./generateComputeNodeEntries.pl --start 122 --end 122 --cpus 52 --memory 1000 --shmem 1000 --pidlimit -1 --interface eth2 > server071-docker-compose.yml
./generateComputeNodeEntries.pl --start 123 --end 123 --cpus 28 --memory 384 --shmem 384 --pidlimit -1 --interface eth0 > server072-docker-compose.yml
./generateComputeNodeEntries.pl --start 124 --end 124 --cpus 40 --memory 1300 --shmem 256 --pidlimit -1 --interface eth4 > server057-docker-compose.yml
./generateComputeNodeEntries.pl --start 125 --end 125 --cpus 28 --memory 350 --shmem 350 --pidlimit -1 --interface eth2 > server058-docker-compose.yml
