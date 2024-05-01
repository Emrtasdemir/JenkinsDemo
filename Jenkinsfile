pipeline {
    agent any
    tools {
        maven 'maven'
    }
    stages {
        stage('Build Maven') {
            steps {
                checkout scmGit(
                    branches: [[name: '*/main']],
                    userRemoteConfigs: [[url: 'https://github.com/Emrtasdemir/JenkinsDemo']]
                )
                bat 'mvn clean install'
            }
        }

        stage('Build docker image'){
            steps{
                script{
                    docker.build("Emrtasdemir:${env.BUILD_NUMBER}")
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                    docker.image("Emrtasdemir:${env.BUILD_NUMBER}").run("-d -p 8081:8081 --name demo-container")
                }
            }
        }
    }

}