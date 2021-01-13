# List Centreon Organisation repositories with rpm package


# Purpose

The goal of this project is to offer an rpm builder based on docker and shell script.
This project is a demonstrator and should not be used like production ready
project. It needs to be more generic in order to build multiple types of rpm
in multiple distros.

# Requirements

Tested on CentOS 8 / Ubuntu 20.04.1 with Docker 20.10 installed

# Usage

## Building the RPM builder Docker image

Checkout the project :

Enter the project directory :

Build the docker image :

## Launching the RPM Builder with Docker

Launch the docker container from the builded image

# Sample project

The Dockerfile is composed of all the libraries and the entrypoint
needed to run with parameters. The parameters are used by the entrypoint shell script
that ensure to build the rpm with the spec file given as argument.

You'll find here a liscentreon.spec file as sample used to build the rpm
with the builder like bellow :

command

This spec file aimed at listcentreon shell script that list the Centreon
oragnisation repositories. The script is packaged with this command :

command

# CI integration

That sample project is able to run in a Jenkins thanks to thaat jenkinsfile :

décrire le pipeline