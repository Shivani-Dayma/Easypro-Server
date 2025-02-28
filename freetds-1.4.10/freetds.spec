%define	name	freetds
%define	version	1.4.10

# compute some additional dependency from vendor name
# 

# SUSE
%define tds_dep_suse glibc-locale

%undefine tds_builddep
%{expand:%%{expand:%%{?tds_builddep_%{?_vendor}:%%%%define tds_builddep %%{?tds_builddep_%{?_vendor}}}}}
%undefine tds_dep
%{expand:%%{expand:%%{?tds_dep_%{?_vendor}:%%%%define tds_dep %%{?tds_dep_%{?_vendor}}}}}
 
Name: %{name} 
Version: %{version} 
Release: 1 
Vendor: www.freetds.org 
License: LGPL 
Group: System Environment/Libraries 
Source: http://ibiblio.org/pub/Linux/ALPHA/freetds/stable/%{name}-%{version}.tar.bz2
BuildRoot: %{_tmppath}/%{name}-buildroot
BuildRequires: unixODBC-devel >= 2.0.0 gnutls-devel %{?tds_builddep}
Requires: gnutls %{?tds_dep}
Summary: FreeTDS is a free re-implementation of the TDS (Tabular DataStream) protocol that is used by Sybase and Microsoft for their database products. 
 
%description 
FreeTDS is a project to document and implement the TDS (Tabular DataStream) 
protocol. TDS is used by Sybase and Microsoft for client to database server 
communications. FreeTDS includes call level interfaces for DB-Lib, CT-Lib, 
and ODBC.  
 
%package devel 
Group: Development/Libraries 
Summary: Include files needed for development with FreeTDS 
Requires: freetds = %{version}

%package unixodbc
Group: System Environment/Libraries
Summary: FreeTDS ODBC Driver for unixODBC
Requires: unixODBC >= 2.0.0
%{?tds_dep:Requires: %tds_dep}

%package doc
Group: Documentation
Summary: User documentation for FreeTDS
 
%description devel
The freetds-devel package contains the files necessary for development with 
the FreeTDS libraries. 

%description unixodbc
The freetds-unixodbc package contains ODBC driver build for unixODBC.

%description doc
The freetds-doc package contains the useguide and reference of FreeTDS 
and can be installed even if FreeTDS main package is not installed

%prep
%setup 
 
%build
%configure --with-tdsver=auto --with-unixodbc --with-gnutls
make RPM_OPT_FLAGS="$RPM_OPT_FLAGS"
 
%install 
rm -rf "$RPM_BUILD_ROOT"
make DESTDIR="$RPM_BUILD_ROOT" install
rm -rf "$RPM_BUILD_ROOT/%{_datadir}/doc/freetds"
find "$RPM_BUILD_ROOT" -name "*.la" -delete

%post 
/sbin/ldconfig 2> /dev/null

%postun
/sbin/ldconfig 2> /dev/null

%post unixodbc
echo "[FreeTDS]
Description = FreeTDS unixODBC Driver
Driver = %{_libdir}/libtdsodbc.so.0
Setup = %{_libdir}/libtdsodbc.so.0" | odbcinst -i -d -r > /dev/null 2>&1 || true
echo "[SQL Server]
Description = FreeTDS unixODBC Driver
Driver = %{_libdir}/libtdsodbc.so.0
Setup = %{_libdir}/libtdsodbc.so.0" | odbcinst -i -d -r > /dev/null 2>&1 || true

%preun unixodbc
odbcinst -u -d -n 'FreeTDS' > /dev/null 2>&1 || true
odbcinst -u -d -n 'SQL Server' > /dev/null 2>&1 || true

%clean 
rm -rf $RPM_BUILD_ROOT 
 
%files 
%defattr(-,root,root) 
%doc AUTHORS.md COPYING*.txt INSTALL.md NEWS.md README.md TODO.md
%{_bindir}/*
%{_mandir}/man?/*
%{_libdir}/libct.so.*
%{_libdir}/libsybdb.so.*
%config %{_sysconfdir}/*
 
%files devel 
%defattr (-,root,root) 
%{_libdir}/*.a
%{_libdir}/*.so
%{_includedir}/*

%files unixodbc
%defattr(-,root,root)
%{_libdir}/libtdsodbc.so*

%files doc
%defattr (-,root,root)
%doc doc/userguide doc/images doc/reference
 
%changelog
* Fri Nov 13 2015 Frediano Ziglio <freddy77@gmail.com>
- set default protocol version to "auto" (automatic)
- enable gnutls in RPM packages

* Wed Mar 28 2007 Frediano Ziglio <freddy77@gmail.com>
- removed libtdssrv

* Thu Sep 09 2004 Frediano Ziglio <freddy77@angelfire.com>
- remove dependency from freetds-unixodbc
- fix field name (Copyright instead of License)
- updated URL

* Sun Mar 30 2003 Frediano Ziglio <freddy77@angelfire.com>
- add reference to doc package

* Wed Feb  5 2003 Ian Grant <Ian.Grant@cl.cam.ac.uk>
- 0.61 tweaked. Added libtdssrv libraries and tools in /usr/bin + man pages

* Mon Dec 30 2002 David Hollis <dhollis@davehollis.com>
- 0.60 tweaked.  Move .a & .la files to -devel package

* Thu Dec 20 2001 Brian Bruns <camber@ais.org> 
- Modifications for 0.53 ver and removing interfaces file

* Fri Jun 28 2001 Brian Bruns <camber@ais.org>
- Modifications for 0.52 ver and ODBC drivers 

* Wed Feb 14 2001 David Hollis <dhollis@emagisoft.com> 
- First stab at RPM for 0.51 ver 
