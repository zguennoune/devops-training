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

- Checkout the project :
```shell
git clone https://github.com/zguennoune/devops-training.git
``` 

- Enter the project directory :

```shell
cd devops-training
```

- Build the docker image :

```shell
docker build . -t centreonbuilder:0.1
```

## Launching the RPM Builder with Docker

Launch the docker container from the builded image :

```shell
docker run --volume=<PWD>:/src --workdir=/src centreonbuilder:0.1 <SPEC FILE>
``` 

The builded rpm will be stored on your working directory in the rpm folder.

# Sample project

The Dockerfile is composed of all the libraries and the entrypoint
needed to run with parameters. The parameters are used by the entrypoint shell script
that ensure to build the rpm with the spec file given as argument.

You'll find here a listcentreon.spec file as sample used to build the rpm
with the builder like bellow :

```shell
docker run --volume=<PWD>:/src --workdir=/src centreonbuilder:0.1 liscentreon.spec
```

This spec file aimed at listcentreon shell script that list the Centreon
organisation repositories. 

# CI integration

That sample project is able to run in a Jenkins thanks to that jenkinsfile that 
- build the rpmBuilder docker image
- launch a container with a docker volume attached in order to copy the
workdir in this volume
- kill the container attached and attach the rpmbuilder container
- execute the rpmbuilder with the sample project

```
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Starting to build docker image'
                    script {
                        sh 'docker build . -t  centreonbuilder:${BUILD_NUMBER}'
                        }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                sh 'docker run -v jenkins-build:/data --name helper busybox true'
                sh 'docker cp . helper:/data'
                sh 'docker rm helper'
                sh 'docker rm builderrpm'
                sh "docker run --name builderrpm -v jenkins-build:/src centreonbuilder:${BUILD_NUMBER} listcentreon.spec"
                sh "docker cp builderrpm:/src/rpm/RPMS/noarch/listcentreon-1.0.0-1.el8.noarch.rpm ."
            }
        }
    }
    post {
        always {
           archiveArtifacts artifacts: '*', fingerprint: true
        }
    }
}
```

The dockerfile used to build and run Jenkins is also available in that
repository. It does not contains the job described here but it was the 
environment used to launch that job. 

# Thank you

Live demonstration soon... 