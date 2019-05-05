#!/bin/bash

# Modify chrome-remote-desktop to work on an Ubuntu Desktop 18.04 install.
# Note: These modifications won't work on a non-virtual desktop.

set -eu

CRD_HOME=/opt/google/chrome-remote-desktop
# CRD_HOME=.
CRD_FILE=$CRD_HOME/chrome-remote-desktop
CRD_FILE_ORIG=${CRD_FILE}.orig
CRD_FILE_WORKS=${CRD_FILE}.works

CHANGES=

replace_text() {
	old_text="$1"
	new_text="$2"

	CHANGES=${CHANGES}$(grep "$old_text" $CRD_FILE)
	sed -i "s/$old_text/$new_text/g" $CRD_FILE
}

# Backup original
if [ ! -f $CRD_FILE_ORIG ]; then
    cp $CRD_FILE $CRD_FILE_ORIG
fi

# Modify CRD
replace_text "1600x1200" "1920x1080"

# Save a copy that works, in case a future update breaks this script
if [ ! -f $CRD_FILE_WORKS ]; then
    cp $CRD_FILE $CRD_FILE_WORKS
fi

if [ "$CHANGES" != "" ]; then
	echo "Restarting CRD"
	$CRD_FILE --stop
	$CRD_FILE --start
fi
