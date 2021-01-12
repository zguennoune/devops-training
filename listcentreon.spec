###############################################################################
# Spec file for xxx
################################################################################
# Configured to be built by user student or other non-root user
################################################################################
#

Summary: Hello world
Name: listcentreon
Version: 1.0.0
Release: 1%{?dist}
License: GPLv3+
Packager: Zakaria Guennoune 
BuildArch:  noarch

%description
Hello World !

%prep

%build

%install
mkdir -p %{buildroot}/%{_bindir}
install -m 0755 %{name} %{buildroot}/%{_bindir}/%{name}

%files
%{_bindir}/%{name}

%changelog
