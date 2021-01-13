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
                sh 'pwd'
                sh 'printenv'
                sh "docker run --volume ${env.WORKSPACE}:/src --workdis=/src centreonbuilder listcentreon.spec Ubuntu true"
            }
        }
    }
}