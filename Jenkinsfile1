pipeline {
    agent any
     tools {
         maven 'm3'
         jdk 'jdk-1'
     }
     environment {
        DOCKERHUB_CREDENTIALS = credentials('docker_token')
        DOCKER_IMAGE = "gangarampadolkar93/my_app_3.0"
        DOCKER_TAG   = "latest"
     }
    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage('git checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github _token', url: 'https://github.com/gangarampadolkar93/Java_app_3.0.git']])
            }
        }
        stage('maven build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('arvchieve the artifacts') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }
        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker_token',
                                                 usernameVariable: 'DOCKER_USER',
                                                 passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE:$DOCKER_TAG .'
            }
        }

        stage('Docker Push') {
            steps {
                sh 'docker push $DOCKER_IMAGE:$DOCKER_TAG'
            }
        }

    }
}
