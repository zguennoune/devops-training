###############################################################################
# Spec file for Centreon repo listing
################################################################################
# Configured to be built by user student or other non-root user
################################################################################
#

Summary: List Centreon Organisation Repositories
Name: listcentreon
Version: 1.0.0
Release: 1%{?dist}
License: GPLv3+
Packager: Zakaria Guennoune
Requires: bash
Requires: curl
Requires: jq
BuildArch:  noarch

%description
That packaged allow you to list the Centreon organisation repositories

%prep

%build

%install
mkdir -p %{buildroot}/%{_bindir}
install -m 0755 %{name} %{buildroot}/%{_bindir}/%{name}

%files
%{_bindir}/%{name}

%changelog
* Tue Jan 12 2021 Zakaria Guennoune <zakariya.guen@gmail.com>
  - The original package includes a single script that list Centreon Organisation repositories
