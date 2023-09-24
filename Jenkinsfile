pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                checkout scm
            }
        }
        stage('Build') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'master') {
                        // Build the Docker image
                        sh 'docker build -t my-apache-server:master .'
                    } else if (env.BRANCH_NAME == 'develop') {
                        // Run the Docker container for 'develop' branch
                        sh 'docker build -t my-apache-server:develop .'
                    }
                }
            }
        }
        stage('Publish') {
            steps {
               script {
                    if (env.BRANCH_NAME == 'master') {
                        // Build the Docker image
                        sh 'docker run -d -p 82:80 my-apache-server:master'
                    } else if (env.BRANCH_NAME == 'develop') {
                        // Run the Docker container for 'develop' branch
                        sh 'docker build -t my-apache-server:develop .'
                    }
                }
            }
        }
    }
}
