#!/bin/bash
cmd="docker-compose  -f $HOSTNAME-docker-compose.yml up -d"
echo $cmd
$cmd
