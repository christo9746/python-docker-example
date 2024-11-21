pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'python-docker-example'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the repository
                git 'https://github.com/christo9746/python-docker-example.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                // Build the Docker image from the Dockerfile in the repository
                script {
                    docker.build("${DOCKER_IMAGE}")
                }
            }
        }
        
        stage('Run Tests') {
            steps {
                // Run the tests inside the Docker container
                script {
                    docker.image("${DOCKER_IMAGE}").inside {
                        sh 'python -m unittest discover'
                    }
                }
            }
        }
        
        stage('Deploy') {
            steps {
                // Here you can add steps for deployment if needed, for example:
                echo 'Deploying the Docker container...'
            }
        }
    }
}
