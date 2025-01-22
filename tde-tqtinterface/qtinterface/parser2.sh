#!/bin/bash
#
# Run me like this:
# ls tq* | grep .h | xargs ./parser2.sh
#
# Before use, check for correct operation with this
# ls tq* | grep .h | xargs ./parser2.sh | grep EXPORT

echo "#!/bin/bash"

echo " "

for var in "$@"
do
	cat $var | grep "class " | sed 's/class //g' | sed 's/QM_EXPORT_XML //g' | sed 's/TQ_EXPORT //g' | sed 's/QM_EXPORT_TABLE //g' | sed 's/QM_EXPORT_SQL //g' | sed 's/QM_EXPORT_NETWORK //g' | sed 's/QM_EXPORT_CANVAS //g' | sed 's/QM_EXPORT_DOM //g' | sed 's/QM_EXPORT_HTTP //g' | sed 's/QM_EXPORT_ICONVIEW //g' | sed 's/QM_EXPORT_OPENGL //g' | sed 's/Q_EXPORT_CODECS_JP //g' | sed 's/Q_EXPORT_CODECS_CN //g' | sed 's/Q_PNGEXPORT //g' | sed 's/Q_EXPORT_STYLE_COMPACT //g' | sed 's/Q_EXPORT_CODECS_KR //g' | awk '{print $1}' | sed 's/\/\/.//g' | sed 's/\/\///g' | sed 's/://g' | sed 's/;//g' | xargs ./parser3.sh
done

echo " "

echo "find ./ -type f -iname \"*.h*\" -exec sed -i 's/TTQ/TQ/g' {} \;"
echo "find ./ -type f -iname \"*.h*\" -exec sed -i 's/TTQ/TQ/g' {} \;"
echo "find ./ -type f -iname \"*.h*\" -exec sed -i 's/TTQ/TQ/g' {} \;"
echo "find ./ -type f -iname \"*.h*\" -exec sed -i 's/TTQ/TQ/g' {} \;"
echo "find ./ -type f -iname \"*.c*\" -exec sed -i 's/TTQ/TQ/g' {} \;"
echo "find ./ -type f -iname \"*.c*\" -exec sed -i 's/TTQ/TQ/g' {} \;"
echo "find ./ -type f -iname \"*.c*\" -exec sed -i 's/TTQ/TQ/g' {} \;"
echo "find ./ -type f -iname \"*.c*\" -exec sed -i 's/TTQ/TQ/g' {} \;"
