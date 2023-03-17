#!/usr/bin/env perl

#Zack Ramjan 2/28/2023
# given args, create a docker-compose file for a given server that hosts a number of compute nodes

use Getopt::Long;

my $usage = "usage: generateComputeNodeEnties.pl --start [first node] --end [last node] --cpus [cpus per node] --interface [mlx interface name]\n";
my $start;  
my $end;
my $cpus;
my $memory;
my $interface="eth2";


GetOptions ("start=i" => \$start,    # numeric
            "end=i"   => \$end,      
            "cpus=i"   => \$cpus,      
            "memory=i"   => \$memory,      
            "interface=s"   => \$interface)      # string
|| die $usage; 
die $usage unless $start && $end && $cpus && $memory && $interface;

$cpus = $cpus || int((128.0 / (1+$end-$start)));
my $memorySwap = $memory + 1;
print <<EOF
version: '3.1'

networks:
  computenet:
    driver: ipvlan
    driver_opts:
      parent: $interface
    ipam:
      config:
        - subnet: 10.152.222.0/23
          gateway: 10.152.222.1
          ip_range: 10.152.223.0/24

services:
  portainer-agent:
    container_name: portainer-agent
    image: portainer/agent
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /var/lib/docker/volumes:/var/lib/docker/volumes
    ports:
      - 9001:9001
    restart: always

EOF
;

for my $i ($start..$end)
{
 my $host = "compute" .  sprintf("%03d", $i);
 print <<EOF
  $host:
    extends:
      file: compute-common-docker-compose.yml
      service: compute
    container_name: $host
    hostname: $host
    networks:
      computenet:
        ipv4_address: 10.152.223.$i
    deploy:
      resources:
        limits:
          cpus: $cpus
          memory: $memory\G

EOF
;

}

