 pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                checkout scm
            }
        }
  
        stage('Build and Publish') {
            agent { 
                dockerfile true 
            }
            steps {
                script {
                    if (env.BRANCH_NAME == 'master') {
                        sh 'docker build . -t masterapache'
                        sh 'docker run -itd --name AS5 -p 81:80 ubuntu'
                    } else if (env.BRANCH_NAME == 'develop') {
                        sh 'docker build . -t developapache'
                    }
                }
            }
        }
    }
}
