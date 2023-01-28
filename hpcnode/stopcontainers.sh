#!/bin/bash
cmd="docker-compose  -f $HOSTNAME-docker-compose.yml down"
echo $cmd
$cmd
