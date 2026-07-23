Name: epson-inkjet-printer-escpr
Version: 1.8.8
Release: 1%{?dist}
Summary: Epson Inkjet Printer Driver (ESC/P-R) for Linux
License: GPL-2.0-or-later

Source0: epson-inkjet-printer-escpr-1.8.8-1.tar.gz

BuildRequires: gcc
BuildRequires: make
BuildRequires: cups-devel

Requires: cups-filesystem

%description
This package provides a filter program for the Common UNIX Printing
System (CUPS) that produces high quality output on Seiko Epson Color
Ink Jet Printers. It supports EPSON ESC/P-R printers and can be used
for all EPSON ESC/P-R printers.

%prep
%autosetup

%build
export CFLAGS="%{build_cflags} -Wno-error=implicit-function-declaration -Wno-error=implicit-int -Wno-error=int-conversion -Wno-error=incompatible-pointer-types -Wno-error=format-security"

./configure \
    --prefix=%{_prefix} \
    --libdir=%{_libdir} \
    --with-cupsfilterdir=%{_cups_serverbin}/filter \
    --with-cupsppddir=%{_datadir}/ppd

%make_build

%install
%make_install
rm -f %{buildroot}%{_libdir}/libescpr.la
rm -f %{buildroot}%{_libdir}/libescpr.a
rm -f %{buildroot}%{_libdir}/libescpr.so

%files
%license COPYING
%doc AUTHORS NEWS README README.ja README.fr
%{_cups_serverbin}/filter/epson-escpr
%{_cups_serverbin}/filter/epson-escpr-wrapper
%{_libdir}/libescpr.so.1*
%{_datadir}/ppd/epson-inkjet-printer-escpr/
