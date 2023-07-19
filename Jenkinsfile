pipeline {
    agent any
    tools{
        maven 'maven_3_9_3'
    }
    stages{
        stage("whicch version"){
            steps{
                echo "$PATH"
                sh "mvn --version"
                sh "java --version"
            }
        }
        stage("maven install"){
            steps{
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/akshit2707/automation-project']])
                sh 'mvn clean install'
            }
        }
        stage("Build docker image"){
            steps{
                script{
                    sh 'docker --version'
                    sh 'docker build -t akshit2707/devops-automation .'
                }
            }
        }
        stage("Push image to hub"){
            steps{
                script{
                   withCredentials([string(credentialsId: 'secretId', variable: 'dockerhubpwd')]) {
                       sh 'docker login -u akshit2707 -p ${dockerhubpwd}'

                        }
                        sh 'docker push akshit2707/devops-automation'
                }
            }
        }
    }
}