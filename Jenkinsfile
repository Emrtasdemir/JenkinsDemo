pipeline {
    agent any
    stages {
        stage('Build Maven') {
            steps {
                checkout scmGit(
                    branches: [[name: '*/master']],
                    userRemoteConfigs: [[url: 'https://github.com/Emrtasdemir/JenkinsDemo']]
                )

            }
        }
        stage('Build docker image'){
            steps{
                script{
                    docker.build("emirt:${env.BUILD_NUMBER}")
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                    docker.image("emirt:${env.BUILD_NUMBER}").run("-d -p 8080:8080 --name demo-container")
                }
            }
          }
 }
}