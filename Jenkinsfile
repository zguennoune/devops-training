pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Starting to build docker image'
                    script {
                        sh 'docker build . -t  centreonbuilder'
                        }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                sh 'docker run hello-world'
                sh "docker run -v ${WORKSPACE}:/src centreonbuilder listcentreon.spec Ubuntu true"
            }
        }
    }
}