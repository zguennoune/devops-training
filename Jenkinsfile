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