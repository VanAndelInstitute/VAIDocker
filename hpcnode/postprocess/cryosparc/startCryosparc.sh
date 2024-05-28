#!/bin/bash

cryosparcNode=$(ls |grep $HOSTNAME)
if [ "$HOSTNAME" == "" ]; then
	echo HUH
	#bash /varidata/research/clustermgmt/hpcnode/postprocess/cryosparc/startCryosparc.sh $HOSTNAME
else
	echo NAH
fi
