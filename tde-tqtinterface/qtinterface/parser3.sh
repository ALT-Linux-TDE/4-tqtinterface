#!/bin/bash
#
# DO NOT RUN ME
# See parser2

for var in "$@"
do
#	echo -n "find ./ -type f -iname \"*.c*\" -exec sed -i 's/\([^T]\)"
	echo -n "find ./ -type f -iname \"*.c*\" -exec sed -i 's/"
	echo -n ${var##T}
#	echo -n "/\1"
	echo -n "/"
	echo -n $var
	echo "/g' {} \;"

#	echo -n "find ./ -type f -iname \"*.h*\" -exec sed -i 's/\([^T]\)"
	echo -n "find ./ -type f -iname \"*.h*\" -exec sed -i 's/"
	echo -n ${var##T}
#	echo -n "/\1"
	echo -n "/"
	echo -n $var
	echo "/g' {} \;"
done

