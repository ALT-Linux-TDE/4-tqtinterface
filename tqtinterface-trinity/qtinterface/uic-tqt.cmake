#!/bin/bash

if [[ $1 == "" ]]; then
	echo "Usage: uic-tqt <uic arguments>"
else
	for var in "$@"
	do
		if [[ ${var##*.} == "ui" ]]; then
			uifile=$var
		fi
	done

	if [[ "$uifile" != "" ]]; then
		cp -Rp $uifile $uifile.bkp
		tqt-replace $uifile
	fi
	@UIC_EXECUTABLE@ "$@"
	if [[ "$uifile" != "" ]]; then
		cp -Rp $uifile.bkp $uifile
		rm -f $uifile.bkp
	fi
fi
