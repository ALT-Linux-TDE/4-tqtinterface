#################################################
#
#  (C) 2010-2011 Serghei Amelian
#  serghei (DOT) amelian (AT) gmail.com
#  (C) 2011-2012 Timothy Pearson
#  kb9vqf (AT) pearsoncomputing (DOT) net
#
#  Improvements and feedback are welcome
#
#  This file is released under GPL >= 2
#
#################################################

set( IFACE "interface_tqt3" )

include_directories(
  ${CMAKE_CURRENT_BINARY_DIR}
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${CMAKE_CURRENT_SOURCE_DIR}/private
  ${TQT_INCLUDE_DIR}
  ${CMAKE_CURRENT_SOURCE_DIR}/${IFACE}
  ${CMAKE_CURRENT_SOURCE_DIR}/${IFACE}/private
  ${CMAKE_BINARY_DIR}
)

link_directories(
  ${TQT_LIBRARY_DIR}
)

if ( INPUTMETHOD_ENABLED )
    set( INPUTMETHOD_HEADERS ${IFACE}/tqinputcontext.h ${IFACE}/tqinputcontextfactory.h ${IFACE}/tqinputcontextplugin.h )
endif()

##### headers ###################################

configure_file( tqt.h.cmake tqt.h @ONLY )

install( FILES
    ${CMAKE_CURRENT_BINARY_DIR}/tqt.h ${IFACE}/tqtglobaldefines.h ${IFACE}/tqaccel.h ${IFACE}/tqaccessible.h
    ${IFACE}/tqaction.h ${IFACE}/tqapplication.h ${IFACE}/tqasyncio.h ${IFACE}/tqbuttongroup.h ${IFACE}/tqbutton.h ${IFACE}/tqcanvas.h
    ${IFACE}/tqcdestyle.h ${IFACE}/tqcheckbox.h ${IFACE}/tqclipboard.h ${IFACE}/tqcolordialog.h ${IFACE}/tqcombobox.h
    ${IFACE}/tqcommonstyle.h ${IFACE}/tqdatabrowser.h ${IFACE}/tqdatatable.h ${IFACE}/tqdataview.h ${IFACE}/tqdatetimeedit.h
    ${IFACE}/tqdesktopwidget.h ${IFACE}/tqdial.h ${IFACE}/tqdialog.h ${IFACE}/tqdns.h ${IFACE}/tqdockarea.h ${IFACE}/tqdockwindow.h
    ${IFACE}/tqdragobject.h ${IFACE}/tqerrormessage.h ${IFACE}/tqeventloop.h ${IFACE}/tqfiledialog.h ${IFACE}/tqfontdialog.h
    ${IFACE}/tqframe.h ${IFACE}/tqftp.h ${IFACE}/tqgl.h ${IFACE}/tqgplugin.h ${IFACE}/tqgrid.h ${IFACE}/tqgridview.h ${IFACE}/tqgroupbox.h
    ${IFACE}/tqguardedptr.h ${IFACE}/tqhbox.h ${IFACE}/tqhbuttongroup.h ${IFACE}/tqheader.h ${IFACE}/tqhgroupbox.h
    ${IFACE}/tqhttp.h ${IFACE}/tqiconview.h ${IFACE}/tqimageformatplugin.h ${IFACE}/tqinputdialog.h ${IFACE}/tqlabel.h
    ${IFACE}/tqlayout.h ${IFACE}/tqlcdnumber.h ${IFACE}/tqlineedit.h ${IFACE}/tqlistbox.h ${IFACE}/tqlistview.h ${IFACE}/tqlocalfs.h
    ${IFACE}/tqmainwindow.h ${IFACE}/tqmenubar.h ${IFACE}/tqmessagebox.h ${IFACE}/tqmotifplusstyle.h ${IFACE}/tqmotifstyle.h
    ${IFACE}/tqmultilineedit.h ${IFACE}/tqnetworkprotocol.h ${IFACE}/tqnp.h ${IFACE}/tqobjectcleanuphandler.h
    ${IFACE}/tqobject.h ${IFACE}/tqplatinumstyle.h ${IFACE}/tqpopupmenu.h ${IFACE}/tqprintdialog.h ${IFACE}/tqprocess.h
    ${IFACE}/tqprogressbar.h ${IFACE}/tqprogressdialog.h ${IFACE}/tqpushbutton.h ${IFACE}/tqradiobutton.h
    ${IFACE}/tqrangecontrol.h ${IFACE}/tqscrollbar.h ${IFACE}/tqscrollview.h ${IFACE}/tqsemimodal.h ${IFACE}/tqserversocket.h
    ${IFACE}/tqsessionmanager.h ${IFACE}/tqsgistyle.h ${IFACE}/tqsignal.h ${IFACE}/tqsignalmapper.h ${IFACE}/tqsizegrip.h
    ${IFACE}/tqslider.h ${IFACE}/tqsocket.h ${IFACE}/tqsocketnotifier.h ${IFACE}/tqsound.h ${IFACE}/tqspinbox.h ${IFACE}/tqsplashscreen.h
    ${IFACE}/tqsplitter.h ${IFACE}/tqsqldatabase.h ${IFACE}/tqsqldriver.h ${IFACE}/tqsqldriverplugin.h ${IFACE}/tqsqlform.h
    ${IFACE}/tqsqlquery.h ${IFACE}/tqstatusbar.h ${IFACE}/tqstyle.h ${IFACE}/tqstyleplugin.h ${IFACE}/tqstylesheet.h ${IFACE}/tqtabbar.h
    ${IFACE}/tqtabdialog.h ${IFACE}/tqtable.h ${IFACE}/tqtabwidget.h ${IFACE}/tqtextbrowser.h ${IFACE}/tqtextcodecplugin.h
    ${IFACE}/tqtextedit.h ${IFACE}/tqtextview.h ${IFACE}/tqtimer.h ${IFACE}/tqtoolbar.h ${IFACE}/tqtoolbox.h ${IFACE}/tqtoolbutton.h
    ${IFACE}/tqtooltip.h ${IFACE}/tqtranslator.h ${IFACE}/tqurloperator.h ${IFACE}/tqvalidator.h ${IFACE}/tqvbox.h
    ${IFACE}/tqvbuttongroup.h ${IFACE}/tqvgroupbox.h ${IFACE}/tqwidget.h ${IFACE}/tqwidgetplugin.h ${IFACE}/tqwidgetstack.h
    ${IFACE}/tqwindowsstyle.h ${IFACE}/tqwizard.h ${IFACE}/tqworkspace.h ${IFACE}/tqapp.h ${IFACE}/tqarray.h ${IFACE}/tqassistantclient.h
    ${IFACE}/tqbitarry.h ${IFACE}/tqbttngrp.h ${IFACE}/tqchkbox.h ${IFACE}/tqclipbrd.h ${IFACE}/tqcollect.h ${IFACE}/tqcollection.h ${IFACE}/tqcombo.h
    ${IFACE}/tqconfig.h ${IFACE}/tqconnect.h ${IFACE}/tqdatetm.h ${IFACE}/tqdrawutl.h ${IFACE}/tqdstream.h ${IFACE}/tqfeatures.h
    ${IFACE}/tqfiledef.h ${IFACE}/tqfiledlg.h ${IFACE}/tqfileinf.h ${IFACE}/tqfontinf.h ${IFACE}/tqfontmet.h ${IFACE}/tqgbkcodec.h
    ${IFACE}/tqgeneric.h ${IFACE}/tqgif.h ${IFACE}/tqglobal.h ${IFACE}/tqgrpbox.h ${IFACE}/tqintcach.h ${IFACE}/tqiodev.h ${IFACE}/tqjpegio.h
    ${IFACE}/tqkeycode.h ${IFACE}/tqlined.h ${IFACE}/tqmenudta.h ${IFACE}/tqmetaobj.h ${IFACE}/tqmlined.h ${IFACE}/tqmngio.h
    ${IFACE}/tqmodules.h ${IFACE}/tqmsgbox.h ${IFACE}/tqmultilinedit.h ${IFACE}/tqnetwork.h ${IFACE}/tqobjcoll.h ${IFACE}/tqobjdefs.h ${IFACE}/tqobjectdefs.h
    ${IFACE}/tqpdevmet.h ${IFACE}/tqpmcache.h ${IFACE}/tqpntarry.h ${IFACE}/tqpopmenu.h
    ${IFACE}/tqprndlg.h ${IFACE}/tqprogbar.h ${IFACE}/tqprogdlg.h ${IFACE}/tqpushbt.h ${IFACE}/tqqueue.h ${IFACE}/tqradiobt.h ${IFACE}/tqrangect.h
    ${IFACE}/tqscrbar.h ${IFACE}/tqsession.h ${IFACE}/tqsocknot.h ${IFACE}/tqtabdlg.h ${IFACE}/tqtstream.h
    ${IFACE}/tqwidcoll.h ${IFACE}/tqwindefs.h ${IFACE}/tqwindowdefs.h ${IFACE}/tqwinexport.h
    ${IFACE}/tqabstractlayout.h ${IFACE}/tqasciicache.h ${IFACE}/tqasciidict.h ${IFACE}/tqasyncimageio.h ${IFACE}/tqbig5codec.h
    ${IFACE}/tqbitarray.h ${IFACE}/tqbitmap.h ${IFACE}/tqbrush.h ${IFACE}/tqbuffer.h ${IFACE}/tqcache.h ${IFACE}/tqcleanuphandler.h
    ${IFACE}/tqcolor.h ${IFACE}/tqcompactstyle.h ${IFACE}/tqconnection.h ${IFACE}/tqcstring.h ${IFACE}/tqcursor.h ${IFACE}/tqdatastream.h
    ${IFACE}/tqdatetime.h ${IFACE}/tqdeepcopy.h ${IFACE}/tqdict.h ${IFACE}/tqdir.h ${IFACE}/tqdom.h ${IFACE}/tqdrawutil.h ${IFACE}/tqdropsite.h
    ${IFACE}/tqeditorfactory.h ${IFACE}/tqeucjpcodec.h ${IFACE}/tqeuckrcodec.h ${IFACE}/tqevent.h ${IFACE}/tqfile.h ${IFACE}/tqfileinfo.h
    ${IFACE}/tqfocusdata.h ${IFACE}/tqfontdatabase.h ${IFACE}/tqfont.h ${IFACE}/tqfontinfo.h ${IFACE}/tqfontmetrics.h
    ${IFACE}/tqgarray.h ${IFACE}/tqgb18030codec.h ${IFACE}/tqgcache.h ${IFACE}/tqgdict.h ${IFACE}/tqglcolormap.h ${IFACE}/tqglist.h
    ${IFACE}/tqgvector.h ${IFACE}/tqhostaddress.h ${IFACE}/tqiconset.h ${IFACE}/tqimage.h ${IFACE}/tqintcache.h ${IFACE}/tqintdict.h
    ${IFACE}/tqinterlacestyle.h ${IFACE}/tqiodevice.h ${IFACE}/tqjiscodec.h ${IFACE}/tqjpunicode.h ${IFACE}/tqkeysequence.h
    ${IFACE}/tqlibrary.h ${IFACE}/tqlocale.h ${IFACE}/tqmap.h ${IFACE}/tqmemarray.h ${IFACE}/tqmenudata.h ${IFACE}/tqmetaobject.h
    ${IFACE}/tqmime.h ${IFACE}/tqmovie.h ${IFACE}/tqmutex.h ${IFACE}/tqnamespace.h ${IFACE}/tqobjectdict.h ${IFACE}/tqobjectlist.h
    ${IFACE}/tqpaintdevice.h ${IFACE}/tqpaintdevicemetrics.h ${IFACE}/tqpainter.h ${IFACE}/tqpair.h ${IFACE}/tqpalette.h ${IFACE}/tqpen.h
    ${IFACE}/tqpicture.h ${IFACE}/tqpixmapcache.h ${IFACE}/tqpixmap.h ${IFACE}/tqpngio.h ${IFACE}/tqpointarray.h ${IFACE}/tqpoint.h
    ${IFACE}/tqpolygonscanner.h ${IFACE}/tqprinter.h ${IFACE}/tqptrcollection.h ${IFACE}/tqptrdict.h ${IFACE}/tqptrlist.h
    ${IFACE}/tqptrqueue.h ${IFACE}/tqptrstack.h ${IFACE}/tqptrvector.h ${IFACE}/tqrect.h ${IFACE}/tqregexp.h ${IFACE}/tqregion.h
    ${IFACE}/tqrtlcodec.h ${IFACE}/tqsemaphore.h ${IFACE}/tqsettings.h ${IFACE}/tqshared.h ${IFACE}/tqsignalslotimp.h
    ${IFACE}/tqsimplerichtext.h ${IFACE}/tqsize.h ${IFACE}/tqsizepolicy.h ${IFACE}/tqsjiscodec.h ${IFACE}/tqsocketdevice.h
    ${IFACE}/tqsortedlist.h ${IFACE}/tqsqlcursor.h ${IFACE}/tqsqleditorfactory.h ${IFACE}/tqsqlerror.h ${IFACE}/tqsqlfield.h
    ${IFACE}/tqsql.h ${IFACE}/tqsqlindex.h ${IFACE}/tqsqlpropertymap.h ${IFACE}/tqsqlrecord.h ${IFACE}/tqsqlresult.h
    ${IFACE}/tqsqlselectcursor.h ${IFACE}/tqstring.h ${IFACE}/tqstringlist.h ${IFACE}/tqstrlist.h ${IFACE}/tqstrvec.h
    ${IFACE}/tqstylefactory.h ${IFACE}/tqsyntaxhighlighter.h ${IFACE}/tqtextcodecfactory.h ${IFACE}/tqtextcodec.h
    ${IFACE}/tqtextstream.h ${IFACE}/tqthread.h ${IFACE}/tqthreadstorage.h ${IFACE}/tqtl.h ${IFACE}/tqtsciicodec.h ${IFACE}/tqurl.h
    ${IFACE}/tqurlinfo.h ${IFACE}/tqutfcodec.h ${IFACE}/tquuid.h ${IFACE}/tqvaluelist.h ${IFACE}/tqvaluestack.h ${IFACE}/tqvaluevector.h
    ${IFACE}/tqvariant.h ${IFACE}/tqvfbhdr.h ${IFACE}/tqwaitcondition.h ${IFACE}/tqwhatsthis.h ${IFACE}/tqwidgetfactory.h
    ${IFACE}/tqwidgetintdict.h ${IFACE}/tqwidgetlist.h ${IFACE}/tqwmatrix.h ${IFACE}/tqxml.h ${IFACE}/private/tqucomextra_p.h
    ${IFACE}/private/tqlayoutengine_p.h ${IFACE}/private/tqinternal_p.h ${IFACE}/private/tqeffects_p.h
    ${IFACE}/private/tqrichtext_p.h ${IFACE}/private/tqpluginmanager_p.h ${IFACE}/private/tqcom_p.h
    ${IFACE}/private/tqucom_p.h ${IFACE}/private/tqwidgetinterface_p.h ${IFACE}/private/tqtextengine_p.h
    ${INPUTMETHOD_HEADERS}
  DESTINATION ${INCLUDE_INSTALL_DIR} )

##### tqt tools #################################

configure_file( ${IFACE}/tmoc.cmake tmoc @ONLY )
configure_file( uic-tqt.cmake uic-tqt @ONLY )
configure_file( tqt-replace-tqt3.cmake tqt-replace @ONLY )

install( PROGRAMS
    moc-tqt ${CMAKE_CURRENT_BINARY_DIR}/uic-tqt 
    mcopidl-tqt dcopidl-tqt dcopidlng-tqt
    dcopidl2cpp-tqt convert_qt_tqt1 convert_qt_tqt2
    convert_qt_tqt3 ${CMAKE_CURRENT_BINARY_DIR}/tmoc
    ${CMAKE_CURRENT_BINARY_DIR}/tqt-replace
  DESTINATION ${BIN_INSTALL_DIR} )


##### tqt pkgconfig #############################

string( REGEX REPLACE "^${CMAKE_INSTALL_PREFIX}" "\${prefix}" PC_EXEC_PREFIX ${EXEC_INSTALL_PREFIX} )
string( REGEX REPLACE "^${CMAKE_INSTALL_PREFIX}" "\${prefix}" PC_INCLUDE_DIR ${INCLUDE_INSTALL_DIR} )
string( REGEX REPLACE "^${CMAKE_INSTALL_PREFIX}" "\${prefix}" PC_LIB_DIR ${LIB_INSTALL_DIR} )

unset( PC_TQT_LIBRARIES )
foreach( _lib ${TQT_LIBRARIES} )
  set( PC_TQT_LIBRARIES "${PC_TQT_LIBRARIES} -l${_lib}" )
endforeach( )

configure_file( tqt.pc.cmake tqt.pc @ONLY )
configure_file( tqtqui.pc.cmake tqtqui.pc @ONLY )

install( FILES ${CMAKE_CURRENT_BINARY_DIR}/tqt.pc DESTINATION ${PKGCONFIG_INSTALL_DIR} )
install( FILES ${CMAKE_CURRENT_BINARY_DIR}/tqtqui.pc DESTINATION ${PKGCONFIG_INSTALL_DIR} )


##### tqt (shared) ##############################


tde_add_library( tqt SHARED
  SOURCES ${IFACE}/tqapplication.cpp
  VERSION 4.2.0
  LINK ${TQT_LIBRARIES}
  DESTINATION ${LIB_INSTALL_DIR}
)
