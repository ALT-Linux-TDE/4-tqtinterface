#!/bin/bash
QT_VERSION=@QT_VERSION@

if [[ "$1" == "" ]]; then
	echo "Usage: tqt-replace <input_file>"
else
	sed -i 's/Q_SLOTS>/slots>/g' "$1"
	sed -i 's/Q_SIGNALS>/signals>/g' "$1"
	exit 0
fi
