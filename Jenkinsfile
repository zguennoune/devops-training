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
                sh "docker run -v jenkins-build:/src centreonbuilder:${BUILD_NUMBER} listcentreon.spec"
            }
        }
    post {
        always {
           archiveArtifacts artifacts: '/src/rpm/*', fingerprint: true
        }
    }
}