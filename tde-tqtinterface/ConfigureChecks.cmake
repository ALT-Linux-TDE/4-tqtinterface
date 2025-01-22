#################################################
#
#  (C) 2010-2011 Serghei Amelian
#  serghei (DOT) amelian (AT) gmail.com
#
#  Improvements and feedback are welcome
#
#  This file is released under GPL >= 2
#
#################################################

##### setup architecture flags ##################

tde_setup_architecture_flags( )

include(TestBigEndian)
test_big_endian(WORDS_BIGENDIAN)

tde_setup_largefiles( )


macro( qt_message )
  message( STATUS "${ARGN}" )
endmacro( )

set( QT_VERSION "3" )

# qt prefix directory
if( NOT DEFINED QT_PREFIX_DIR )
  if( NOT $ENV{TQTDIR} STREQUAL "" )
    set( QT_PREFIX_DIR "$ENV{TQTDIR}" )
    qt_message( "  QT_PREFIX_DIR is set to TQTDIR" )
  else( )
    set( QT_PREFIX_DIR "/usr" )
  endif( )
endif( )
qt_message( "  QT_PREFIX_DIR : ${QT_PREFIX_DIR}" )


# qt headers
if( NOT DEFINED TQT_INCLUDE_DIR )
  if( QT_PREFIX_DIR STREQUAL "/usr" )
    if( EXISTS "${QT_PREFIX_DIR}/include/tqt${QT_VERSION}" )
      set( TQT_INCLUDE_DIR "${QT_PREFIX_DIR}/include/tqt${QT_VERSION}" )
    else( )
      set( TQT_INCLUDE_DIR "${QT_PREFIX_DIR}/include/qt${QT_VERSION}" )
    endif( )
  else( )
    set( TQT_INCLUDE_DIR "${QT_PREFIX_DIR}/include" )
  endif( )
endif( )
qt_message( "  TQT_INCLUDE_DIR: ${TQT_INCLUDE_DIR}" )


# qt library path
if( NOT DEFINED TQT_LIBRARY_DIR )
  set( TQT_LIBRARY_DIR "${QT_PREFIX_DIR}/lib${LIB_SUFFIX}" )
endif( )
qt_message( "  TQT_LIBRARY_DIR: ${TQT_LIBRARY_DIR}" )


# qt library name
if( NOT DEFINED TQT_LIBRARIES )
  set( TQT_LIBRARIES qt-mt )
endif( )


# qt tools
if( NOT DEFINED QT_BINARY_DIR )
  set( QT_BINARY_DIR "${QT_PREFIX_DIR}/bin" )
endif( )
qt_message( "  QT_BINARY_DIR : ${QT_BINARY_DIR}" )


# find moc
if( DEFINED MOC_EXECUTABLE )
  if( IS_DIRECTORY "${MOC_EXECUTABLE}" OR NOT EXISTS "${MOC_EXECUTABLE}" )
    tde_message_fatal( "moc was NOT found.\n MOC_EXECUTABLE may not be set correctly." )
  endif( )
else( )
  find_program( MOC_EXECUTABLE NAMES tqmoc moc-qt3 moc HINTS "${QT_BINARY_DIR}" )
  if( NOT MOC_EXECUTABLE )
    tde_message_fatal( "moc was NOT found.\n Please check if your Qt${QT_VERSION} is correctly installed." )
  endif( )
endif( )

# attempt to run moc, to check which qt version is using
execute_process( COMMAND ${MOC_EXECUTABLE} -v ERROR_VARIABLE __output
  RESULT_VARIABLE __result ERROR_STRIP_TRAILING_WHITESPACE )

if( __result EQUAL 1 )
  string( REGEX MATCH "^.*Qt (.+)\\)$" __dummy  "${__output}" )
  set( __version  "${CMAKE_MATCH_1}" )
  if( NOT __version )
    tde_message_fatal( "Invalid response from moc:\n ${__output}" )
  endif( )
else( )
  tde_message_fatal( "Unable to run moc!\n Qt${VERSION} are correctly installed?\n LD_LIBRARY_PATH are correctly set?" )
endif( )

qt_message( "  MOC_EXECUTABLE: ${MOC_EXECUTABLE} (using Qt ${CMAKE_MATCH_1})" )

if( QT_VERSION STREQUAL "3" AND NOT "${CMAKE_MATCH_1}" VERSION_LESS "4" )
  tde_message_fatal( "Strange, you want TQt3, but your moc using Qt>=4." )
endif( )


# find uic (only for Qt3)
if( DEFINED UIC_EXECUTABLE )
	if( IS_DIRECTORY "${UIC_EXECUTABLE}" OR NOT EXISTS "${UIC_EXECUTABLE}" )
		tde_message_fatal( "uic was NOT found.\n MOC_EXECUTABLE may not be set correctly" )
	endif( )
else( )
	find_program( UIC_EXECUTABLE NAMES tquic uic-qt3 uic HINTS "${QT_BINARY_DIR}" )
	if( NOT UIC_EXECUTABLE )
		tde_message_fatal( "uic was NOT found.\n Please check if your Qt${QT_VERSION} is correctly installed." )
	endif( )
endif( )
qt_message( "  UIC_EXECUTABLE: ${UIC_EXECUTABLE}" )


tde_save( CMAKE_REQUIRED_INCLUDES CMAKE_REQUIRED_LIBRARIES )
set( CMAKE_REQUIRED_INCLUDES ${TQT_INCLUDE_DIR} )
set( CMAKE_REQUIRED_LIBRARIES -L${TQT_LIBRARY_DIR} ${TQT_LIBRARIES} )

# check if TQt3 is usable
check_cxx_source_compiles("
	#include <qapplication.h>
	int main(int argc, char **argv) { QApplication app(argc, argv); return 0; } "
	HAVE_USABLE_QT${QT_VERSION} )
	if( NOT HAVE_USABLE_QT${QT_VERSION} )
		# Unset the Qt detection variable
		unset( HAVE_USABLE_QT${QT_VERSION} CACHE )
		# Reset libraries
		set( TQT_LIBRARIES tqt-mt )
		set( CMAKE_REQUIRED_LIBRARIES -L${TQT_LIBRARY_DIR} ${TQT_LIBRARIES} )
		qt_message( "Looking for native TQt3..." )
		check_cxx_source_compiles("
			#include <ntqapplication.h>
			int main(int argc, char **argv) { TQApplication app(argc, argv); return 0; } "
			HAVE_USABLE_QT${QT_VERSION} )
	endif( )
if( NOT HAVE_USABLE_QT${QT_VERSION} )
  tde_message_fatal( "Unable to build a simple Qt${QT_VERSION} test." )
endif( )

# check if Qt3 is patched for compatibility with TQt
check_cxx_source_compiles("
	#include <qobjectlist.h>
	#include <qobject.h>
	int main(int, char**) { QObject::objectTreesListObject(); return 0; } "
	HAVE_PATCHED_QT3 )
	if( NOT HAVE_PATCHED_QT3 )
		# Unset the Qt detection variable
		unset( HAVE_PATCHED_QT3 CACHE )
		# Reset libraries
		set( TQT_LIBRARIES tqt-mt )
		set( CMAKE_REQUIRED_LIBRARIES -L${TQT_LIBRARY_DIR} ${TQT_LIBRARIES} )
		qt_message( "Looking for patched native TQt3..." )
		check_cxx_source_compiles("
			#include <ntqobjectlist.h>
			#include <ntqobject.h>
			int main(int, char**) { TQObject::objectTreesListObject(); return 0; } "
			HAVE_PATCHED_QT3 )
	endif( )
if( NOT HAVE_PATCHED_QT3 )
	tde_message_fatal( "Your Qt3 is not patched for compatibility with tqtinterface." )
endif( )

tde_restore( CMAKE_REQUIRED_INCLUDES CMAKE_REQUIRED_LIBRARIES )


##### check for OpenGL

execute_process(
	COMMAND ${PKG_CONFIG_EXECUTABLE} ${TQT_LIBRARIES} --variable=qt_config
	OUTPUT_VARIABLE TQT_CONF_VARS
	OUTPUT_STRIP_TRAILING_WHITESPACE
)

message(STATUS "List of qt_config variables: ${TQT_CONF_VARS}")

string( REGEX MATCH " opengl " OPENGL_ENABLED " ${TQT_CONF_VARS} " )

if( OPENGL_ENABLED )

check_include_file( "OpenGL/glu.h" HAVE_GLU_OPENGL )
check_include_file( "GL/glu.h"     HAVE_GLU_GL     )

tde_save( CMAKE_REQUIRED_INCLUDES CMAKE_REQUIRED_LIBRARIES )
set( CMAKE_REQUIRED_INCLUDES ${TQT_INCLUDE_DIR} )
set( CMAKE_REQUIRED_LIBRARIES -L${TQT_LIBRARY_DIR} ${TQT_LIBRARIES} )

check_cxx_source_compiles("
#include <cstdlib>
#include <ntqgl.h>
int main( int, char** )
{
	(void) new TQGLWidget( (TQWidget*)0, \"qgl\" ) ;
	return EXIT_SUCCESS ;
}"
TQGLWIDGET )

tde_restore( CMAKE_REQUIRED_INCLUDES CMAKE_REQUIRED_LIBRARIES )

if( ( HAVE_GLU_OPENGL OR HAVE_GLU_GL ) AND TQGLWIDGET )
    set( HAVE_OPENGL 1 )
 else()
    tde_message_fatal( "OpenGL has been requested, but neither the OpenGL headers or tqt3 with OpenGL support have been found on your system" )
endif()
endif( OPENGL_ENABLED )

##### check for Inputmethod
string( REGEX MATCH " inputmethod " INPUTMETHOD_ENABLED " ${TQT_CONF_VARS} " )
