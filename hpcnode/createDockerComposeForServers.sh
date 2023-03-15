#!/bin/bash
./generateComputeNodeEntries.pl --start 1 --end 32 --cpus 8 --memory 32 --interface eth2 > server001-docker-compose.yml
./generateComputeNodeEntries.pl --start 33 --end 42 --cpus 16 --memory 100 --interface eth3 > server002-docker-compose.yml
./generateComputeNodeEntries.pl --start 45 --end 48 --cpus 40 --memory 256 --interface eth2 > server003-docker-compose.yml
./generateComputeNodeEntries.pl --start 49 --end 52 --cpus 40 --memory 256 --interface eth2 > server004-docker-compose.yml
./generateComputeNodeEntries.pl --start 53 --end 56 --cpus 40 --memory 256 --interface eth2 > server005-docker-compose.yml
./generateComputeNodeEntries.pl --start 57 --end 60 --cpus 40 --memory 256 --interface eth3 > server006-docker-compose.yml
./generateComputeNodeEntries.pl --start 61 --end 64 --cpus 40 --memory 256 --interface eth3 > server007-docker-compose.yml
./generateComputeNodeEntries.pl --start 65 --end 68 --cpus 40 --memory 256 --interface eth3 > server008-docker-compose.yml
./generateComputeNodeEntries.pl --start 69 --end 70 --cpus 64 --memory 512 --interface eth3 > server009-docker-compose.yml
./generateComputeNodeEntries.pl --start 71 --end 72 --cpus 64 --memory 512 --interface eth2 > server010-docker-compose.yml
./generateComputeNodeEntries.pl --start 73 --end 74 --cpus 64 --memory 512 --interface eth2 > server011-docker-compose.yml
./generateComputeNodeEntries.pl --start 75 --end 76 --cpus 64 --memory 512 --interface eth2 > server012-docker-compose.yml
./generateComputeNodeEntries.pl --start 77 --end 78 --cpus 64 --memory 512 --interface eth2 > server013-docker-compose.yml
./generateComputeNodeEntries.pl --start 79 --end 79 --cpus 128 --memory 1000 --interface eth3 > server014-docker-compose.yml
./generateComputeNodeEntries.pl --start 80 --end 80 --cpus 128 --memory 1000 --interface eth3 > server015-docker-compose.yml
./generateComputeNodeEntries.pl --start 81 --end 81 --cpus 128 --memory 1000 --interface eth2 > server016-docker-compose.yml
./generateComputeNodeEntries.pl --start 82 --end 82 --cpus 128 --memory 2000 --interface eth2 > server017-docker-compose.yml
./generateComputeNodeEntries.pl --start 83 --end 83 --cpus 128 --memory 2000 --interface eth2 > server018-docker-compose.yml
./generateComputeNodeEntries.pl --start 84 --end 84 --cpus 28 --memory 256 --interface eth2 > server023-docker-compose.yml
./generateComputeNodeEntries.pl --start 85 --end 85 --cpus 28 --memory 256 --interface eth2 > server024-docker-compose.yml
