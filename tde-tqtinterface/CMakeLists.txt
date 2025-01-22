###########################################
#                                         #
#  (C) 2010-2011 Serghei Amelian          #
#  serghei (DOT) amelian (AT) gmail.com   #
#                                         #
#  Improvements and feedback are welcome  #
#                                         #
#  This file is released under GPL >= 2   #
#                                         #
###########################################


##### set project version ########################

include( TDEVersion )
cmake_minimum_required( VERSION ${TDE_CMAKE_MINIMUM_VERSION} )
tde_set_project_version( )


#### general package setup

project( tqt )

set( TQT_MAJOR_VERSION 14 )
set( TQT_MINOR_VERSION 1 )
set( TQT_MICRO_VERSION 0 )
set( TQT_VERSION "${TQT_MAJOR_VERSION}.${TQT_MINOR_VERSION}.${TQT_MICRO_VERSION}" )


#### include essential cmake modules

include( FindPkgConfig          )
include( CheckFunctionExists    )
include( CheckSymbolExists      )
include( CheckIncludeFile       )
include( CheckLibraryExists     )
include( CheckCSourceCompiles   )
include( CheckCXXSourceCompiles )

include( GNUInstallDirs OPTIONAL )


##### include our cmake modules

include( TDEMacros )


##### install paths setup

tde_setup_install_path( EXEC_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}" )
tde_setup_install_path( BIN_INSTALL_DIR     "${EXEC_INSTALL_PREFIX}/bin" )

if( CMAKE_INSTALL_LIBDIR )
   tde_setup_install_path( LIB_INSTALL_DIR  "${EXEC_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}" )
 else()
   tde_setup_install_path( LIB_INSTALL_DIR  "${EXEC_INSTALL_PREFIX}/lib${LIB_SUFFIX}" )
endif()

tde_setup_install_path( INCLUDE_INSTALL_DIR   "${CMAKE_INSTALL_PREFIX}/include/tqt" )
tde_setup_install_path( PKGCONFIG_INSTALL_DIR "${LIB_INSTALL_DIR}/pkgconfig" )


##### optional stuff

option( WITH_ALL_OPTIONS "Enable all optional support" OFF )


##### configure checks

include( ConfigureChecks.cmake )


###### global compiler settings

add_definitions( -DHAVE_CONFIG_H )

set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${TQT_CXX_FLAGS}" )
set( CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,--no-undefined" )
set( CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} -Wl,--no-undefined" )


# tqt.pc and tqtqui.pc definitions

set( QT_DEFINITIONS "-DTQT_NO_ASCII_CAST -DTQT_NO_STL -DTQT_NO_COMPAT -DTQT_NO_TRANSLATION -DTQT_THREAD_SUPPORT -D_REENTRANT" )


##### directories

add_subdirectory( qtinterface )


##### write configure files

configure_file( config.h.cmake config.h @ONLY )
