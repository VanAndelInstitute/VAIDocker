#!/bin/bash
if [ -e /varidata/research/clustermgmt/hpcnode/nodemounts/$HOSTNAME ]; then
	bash /varidata/research/clustermgmt/hpcnode/nodemounts/$HOSTNAME
fi
