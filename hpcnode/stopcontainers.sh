#!/bin/bash
cd /varidata/research/admin/VAIDocker/hpcnode
cmd="docker-compose  -f $HOSTNAME-docker-compose.yml down"
echo $cmd
$cmd
