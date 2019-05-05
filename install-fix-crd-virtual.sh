#!/bin/bash

set -eu

CRD_BASE_NAME=fix-crd-virtual
CRD_FIX_HOME=/opt/fix-crd

if [ ${DISPLAY:1} -le 4 ]; then
	echo "This looks like a non-virtual desktop. Are you installing the right version?"
	exit 1
fi

mkdir -p $CRD_FIX_HOME
cp fix-crd.sh $CRD_FIX_HOME/fix-crd.sh
cp ${CRD_BASE_NAME}.service /etc/systemd/system/fix-crd.service

systemctl daemon-reload
systemctl enable fix-crd.service
