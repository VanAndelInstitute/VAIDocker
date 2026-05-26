#!/bin/bash
atLeastOneContainerUp=$(docker ps | tail -n +2 | tr -d '\n')
if [[ $atLeastOneContainerUp != "" ]]; then
	echo "There is at least one container running already. Use restartContainers instead."
else
	echo "No containers currently running. Attempting start."
	cd /varidata/research/clustermgmt/vaihpc/VAIDocker/hpcnode
	cmd="docker compose  -f $HOSTNAME-docker-compose.yml up -d"
	echo $cmd
	$cmd
fi
