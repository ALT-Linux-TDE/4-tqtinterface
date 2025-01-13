# BEGIN SourceDeps(oneline):
BuildRequires(pre): rpm-macros-suse-compat
# END SourceDeps(oneline)
%define suse_version 1550
# see https://bugzilla.altlinux.org/show_bug.cgi?id=10382
%define _localstatedir %{_var}
#
# spec file for package tqtinterface (version R14)
#
# Copyright (c) 2014 Trinity Desktop Environment
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.
#
# Please submit bugfixes or comments via http://www.trinitydesktop.org/
#

# BUILD WARNING:
#  Remove qt-devel and qt3-devel and any kde*-devel on your system !
#  Having KDE libraries may cause FTBFS here !

# TDE variables
%define tde_epoch 2
%if "%{?tde_version}" == ""
%define tde_version 14.1.3
%endif
%define tde_pkg tqtinterface

%if 0%{?mdkversion} || 0%{?mgaversion} || 0%{?pclinuxos}
%define libtqt4 %{_lib}tqt4
%else
%define libtqt4 libtqt4
%endif

Name:		tqtinterface-trinity
Version:	14.1.3
Release:	alt1
Summary:	The Trinity Qt Interface Libraries
Group:		Graphical desktop/Other
URL:		http://www.trinitydesktop.org/

License:	GPL-2.0+

#Vendor:		Trinity Project
#Packager:	Francois Andriot <francois.andriot@free.fr>

Source0:	%{name}-%{tde_version}%{?preversion:~%{preversion}}.tar.gz

BuildRequires:	libtqt3-mt-devel >= 3.5.0
BuildRequires:	tqt3-dev-tools >= 3.5.0
BuildRequires:	cmake-trinity >= 14.1.3

BuildRequires:	gcc-c++

# UUID support
%{?uuid_devel:BuildRequires: %{uuid_devel}}

# PTHREAD support
BuildRequires:	libpth-devel

# MESA support
BuildRequires: libglvnd-devel
BuildRequires: libGLU-devel

# X11 libraries
BuildRequires:	libX11-devel
Source44: import.info

%description
The Trinity Qt Interface is a library that abstracts Qt from Trinity.
This allows the Trinity code to rapidly port from one version of Qt to another.
This is primarily accomplished by defining old functions in terms of new functions,
although some code has been added for useful functions that are no longer part of Qt.


##########

%package -n libtqt4
Group:		Graphical desktop/Other
Summary:	The Trinity Qt Interface Libraries
Provides:	libtqt4 = %{?epoch:%{epoch}:}%{version}-%{release}

Requires:	libtqt3-mt >= 3.5.0

Obsoletes:	trinity-tqtinterface < %{?epoch:%{epoch}:}%{version}-%{release}
Provides:	trinity-tqtinterface = %{?epoch:%{epoch}:}%{version}-%{release}

%description -n %{libtqt4}
The Trinity Qt Interface is a library that abstracts Qt from Trinity.
This allows the Trinity code to rapidly port from one version of Qt to another.
This is primarily accomplished by defining old functions in terms of new functions,
although some code has been added for useful functions that are no longer part of Qt.

%files -n %{libtqt4}
%{_libdir}/libtqt.so.4
%{_libdir}/libtqt.so.4.2.0

%package -n %{libtqt4}-devel
Group:		Development/C
Summary:	The Trinity Qt Interface Libraries (Development Files)
Provides:	libtqt4-devel = %{?epoch:%{epoch}:}%{version}-%{release}

Requires:	%{libtqt4} = %{?epoch:%{epoch}:}%{version}-%{release}
Requires:	tqt3-dev-tools >= 3.5.0
Requires:	trinity-tde-cmake >= %{version}-%{release}

Obsoletes:	trinity-tqtinterface-devel < %{?epoch:%{epoch}:}%{version}-%{release}
Provides:	trinity-tqtinterface-devel = %{?epoch:%{epoch}:}%{version}-%{release}

%description -n %{libtqt4}-devel
The Trinity Qt Interface is a library that abstracts Qt from Trinity.
This allows the Trinity code to rapidly port from one version of Qt to another.
This is primarily accomplished by defining old functions in terms of new functions,
although some code has been added for useful functions that are no longer part of Qt.

%files -n %{libtqt4}-devel
%{_bindir}/convert_qt_tqt1
%{_bindir}/convert_qt_tqt2
%{_bindir}/convert_qt_tqt3
%{_bindir}/dcopidl-tqt
%{_bindir}/dcopidl2cpp-tqt
%{_bindir}/dcopidlng-tqt
%{_bindir}/mcopidl-tqt
%{_bindir}/moc-tqt
%{_bindir}/tmoc
%{_bindir}/tqt-replace
%{_bindir}/uic-tqt
%{_includedir}/tqt/
%{_libdir}/libtqt.so
%{_libdir}/pkgconfig/tqt.pc
%{_libdir}/pkgconfig/tqtqui.pc

##########

%prep
%setup -q -n %{name}-%{tde_version}%{?preversion:~%{preversion}}


%build
unset QTDIR QTINC QTLIB

if ! rpm -E %%cmake|grep -e 'cd build\|cd ${CMAKE_BUILD_DIR:-build}'; then
  mkdir -p build
  cd build
fi

%{suse_cmake} \
  -DCMAKE_BUILD_TYPE="RelWithDebInfo" \
  -DCMAKE_C_FLAGS="${RPM_OPT_FLAGS}" \
  -DCMAKE_CXX_FLAGS="${RPM_OPT_FLAGS}" \
  -DCMAKE_SKIP_RPATH=ON \
  -DCMAKE_VERBOSE_MAKEFILE=ON \
  -DWITH_GCC_VISIBILITY=OFF \
  \
  -DQTDIR="%{_datadir}/tqt3" \
  -DQT_INCLUDE_DIR="%{_includedir}/tqt3" \
  -DQT_LIBRARY_DIR="%{_libdir}" \
  \
  -DCMAKE_INSTALL_PREFIX="%{_prefix}" \
  -DPKGCONFIG_INSTALL_DIR="%{_libdir}/pkgconfig" \
  -DINCLUDE_INSTALL_DIR=%{_includedir}/tqt \
  -DLIB_INSTALL_DIR=%{_libdir} \
  -DBIN_INSTALL_DIR=%{_bindir} \
  \
  -DCMAKE_LIBRARY_PATH="%{_libdir}" \
  -DCMAKE_INCLUDE_PATH="%{_includedir}" \
  \
  -DWITH_QT3="ON" \
  -DBUILD_ALL="ON" \
  -DUSE_QT3="ON" \
  ..

make %{?_smp_mflags} || make


%install
rm -rf "%{?buildroot}"
make install DESTDIR="%{?buildroot}" -C build


%changelog
* Mon Jan 13 2025 Petr Akhlamov <ahlamovpm@basealt.ru> 2:4.2.0-alt1_14.1.2_1
- converted for ALT Linux by srpmconvert tools

