#!/bin/bash

# Usage of the script
usage() {
    echo "Usage: ./runBuild.sh <SPEC FILE> <PLATFORM>"
    echo "<PLATFORM> should be Ubuntu if you are using Ubuntu or any other disribution using rpm"
    exit 1
}

# Testing that there's only one argument
if [ "$#" -ne 2 ]; then
  usage;
fi

# Get parameter from command
SPEC="$1"
PLATFORM="$2"
# Building RPM and deploying the result of that build
rpmbuild -ba --build-in-place --define "_topdir $(pwd)/rpm" $SPEC
if [ $PLATFORM != "Ubuntu" ]; then
  rpm -i rpm/RPMS/noarch/*.rpm
else
  alien -i rpm/RPMS/noarch/*.rpm
fi