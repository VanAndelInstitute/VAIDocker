#!/bin/bash
cd /varidata/research/clustermgmt/vaihpc/VAIDocker/hpcnode
cmd="docker-compose  -f $HOSTNAME-docker-compose.yml down"
echo $cmd
$cmd

cd /varidata/research/clustermgmt/vaihpc/VAIDocker/hpcnode
cmd="docker-compose  -f $HOSTNAME-docker-compose.yml up -d"
echo $cmd
$cmd

docker ps
