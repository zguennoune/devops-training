#!/bin/bash

# Usage of the script
usage() {
    echo "Usage: ./runBuild.sh <SPEC FILE>"
    exit 1
}

# Testing that there's only one argument
if [ "$#" -ne 1 ]; then
  usage;
fi

# Get parameter from command
SPEC="$1"
# Building RPM and deploying the result of that build
rpmbuild -ba --build-in-place --define "_topdir $(pwd)/rpm" $SPEC