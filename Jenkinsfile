pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                checkout scm
            }
        }

        stage('Build and Run Docker Container') {
            steps {
                script {
                    def dockerImageName = 'my-apache-server'
                    def dockerRunCommand

                    if (env.BRANCH_NAME == 'master') {
                        // Build the Docker image for the 'master' branch
                        sh "docker build -t $dockerImageName ."
                        dockerRunCommand = "docker run -d -p 82:80 $dockerImageName"
                    } else if (env.BRANCH_NAME == 'develop') {
                        // Build the Docker image for the 'develop' branch
                        sh "docker build -t $dockerImageName:develop ."
                    } else {
                        error("Unsupported branch: ${env.BRANCH_NAME}")
                    }

                    // Run the Docker container
                    sh dockerRunCommand
                }
            }
        }
    }
}

