#!/bin/bash
DOCKERPATH="/varidata/research/clustermgmt/vaihpc/VAIDocker/hpcnode";
grep hostname $DOCKERPATH/$1*.yml 2>/dev/null | head -n 1 | awk '{print $2}'
