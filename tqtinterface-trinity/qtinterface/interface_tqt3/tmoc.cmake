#!/bin/bash

#
# Very simple moc wrapper, for using with cmake
#

if [ -z "$1" ]; then
	echo "Usage: tmoc <input_file> -o <out_file>"
else
	input_file="$1"
	out_file="$3"
	cat "${input_file}" | \
	@MOC_EXECUTABLE@ | \
	sed "/#include <ntqmetaobject.h>/ i\\
#undef TQT_NO_COMPAT\\
#include \"${input_file}\"\\
" \
	> "${out_file}"
fi
