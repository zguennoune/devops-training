pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Starting to build docker image'
                    script {
                        sh 'docker rm centreonbuilder -f'
                        sh 'docker rmi centreonbuilder'
                        sh 'docker build . -t  centreonbuilder'
                        }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                sh 'docker run -v jenkins-build:/data --name helper busybox true'
                sh 'docker cp . helper:/data'
                sh 'docker rm helper'
                sh "docker run -v jenkins-build:/src centreonbuilder listcentreon.spec Ubuntu true"
            }
        }
    }
}