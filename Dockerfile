pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'python-docker-example'
        DOCKER_TAG = 'latest'
    }
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from GitHub
                git url: 'https://github.com/christo9746/python-docker-example.git', branch: 'main'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t $DOCKER_IMAGE:$DOCKER_TAG .'
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    // Run the container from the built image
                    sh 'docker run -d -p 5000:5000 $DOCKER_IMAGE:$DOCKER_TAG'
                }
            }
        }
    }
}
