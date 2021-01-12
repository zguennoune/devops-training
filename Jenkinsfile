pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                def rpmBuilderImage = docker.build("centreonrpmbuilder", "./Dockerfile")
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}