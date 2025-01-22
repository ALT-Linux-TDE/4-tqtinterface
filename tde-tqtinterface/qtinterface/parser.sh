#!/bin/bash
#
# Run me like this:
# ls tq* | grep '\.h' | sed 's/\.h/\\\.h/g' | xargs ./parser.sh

for var in "$@"
do
	echo -n "find ./ -type f -iname \"*.c*\" -exec sed -i 's/\([^t]\)"
	echo -n ${var##t} | sed 's/\.h/\\\.h/g'
	echo -n "/\1"
	echo -n $var | sed 's/\.h/\\\.h/g'
	echo "/g' {} \;"

	echo -n "find ./ -type f -iname \"*.h*\" -exec sed -i 's/\([^t]\)"
	echo -n ${var##t} | sed 's/\.h/\\\.h/g'
	echo -n "/\1"
	echo -n $var | sed 's/\.h/\\\.h/g'
	echo "/g' {} \;"
done
