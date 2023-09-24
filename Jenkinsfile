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
                        sh 'docker run -itd -p 82:80 masterapache'
                    } else if (env.BRANCH_NAME == 'develop') {
                        sh 'docker build . -t developapache'
                    }
                }
            }
        }
    }
}
