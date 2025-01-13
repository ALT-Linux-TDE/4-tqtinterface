prefix=@CMAKE_INSTALL_PREFIX@
exec_prefix=@PC_EXEC_PREFIX@
libdir=@PC_LIB_DIR@
includedir=@PC_INCLUDE_DIR@

Name: TQtQUI
Description: Interface and abstraction library for Qt and Trinity (QUI library)
Version: @TQT_VERSION@
Libs: -L${libdir} -ltqt -ltqui -L@TQT_LIBRARY_DIR@ @PC_TQT_LIBRARIES@
Cflags: @QT_DEFINITIONS@ -I@TQT_INCLUDE_DIR@ -I${includedir} -include tqt.h

