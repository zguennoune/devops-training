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
                sh 'ls -l'
                sh 'docker run --volume=$PWD:/src --workdir=/src centreonbuilder listcentreon.spec Ubuntu true'
            }
        }
    }
}