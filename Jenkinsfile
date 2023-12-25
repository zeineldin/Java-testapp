pipeline {
    agent any

    environment {
        // Define your Docker Hub credentials as Jenkins credentials
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials-id')
        // Use the GIT_COMMIT as the tag for the Docker image
        COMMIT_TAG = env.GIT_COMMIT
        // Define the Docker image name
        DOCKER_IMAGE_NAME = 'mzain/test'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image with the GIT_COMMIT as the tag
                    docker.build("${DOCKER_IMAGE_NAME}:${COMMIT_TAG}")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    docker.withRegistry('https://registry.hub.docker.com', docker) {
                        docker.image("${DOCKER_IMAGE_NAME}:${COMMIT_TAG}").push()
                    }
                }
            }
        }
    }
}
