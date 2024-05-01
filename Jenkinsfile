pipeline {
    agent any
    tools {
        maven 'maven'
    }
    stages {
        stage('Build Maven') {
            steps {
                checkout scmGit(
                    branches: [[name: '*/master']],
                    userRemoteConfigs: [[url: 'https://github.com/Emrtasdemir/JenkinsDemo']]
                )
                bat 'mvn clean install'
            }
        }
        stage('Stop and Remove Existing Container') {
                             steps {
                                 script {
                                   //container'ı durdur ve sil
                                            bat 'docker stop demo-container '
                                            bat 'docker rm demo-container'
                                        }
                                   }
                        }
        stage('Build docker image'){
            steps{
                script{
                    docker.build("emir:${env.BUILD_NUMBER}")
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                    docker.image("emir:${env.BUILD_NUMBER}").run("-d -p 8081:8081 --name demo-container")
                }
            }
        }
    }

}