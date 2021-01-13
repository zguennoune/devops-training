#!/bin/bash

# Usage of the script
usage() {
    echo "Usage: ./runBuild.sh <SPEC FILE> <PLATFORM> <DEPLOYMENT>"
    echo "<PLATFORM> should be Ubuntu if you are using Ubuntu or any other disribution using rpm and if you want to deploy it"
    exit 1
}

# Testing that there's only one argument
if [ "$#" -ne 3 ]; then
  usage;
fi

# Get parameter from command
SPEC="$1"
PLATFORM="$2"
DEPLOY="$3"
# Building RPM and deploying the result of that build
cd /src
rpmbuild -ba --build-in-place --define "_topdir $(pwd)/rpm" $SPEC

if [ $DEPLOY == "true" ]; then
  echo "The deployment is in progress"
  if [ $PLATFORM != "Ubuntu" ]; then
    echo "Deployment in progress on $PLATFORM"
    rpm -i rpm/RPMS/noarch/*.rpm
  else
    echo "Deployment in progress on $PLATFORM"
    alien -i rpm/RPMS/noarch/*.rpm
  fi
fi