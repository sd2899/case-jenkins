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
                  
                        sh 'docker rm -f $(docker ps -a -q)'
                        sh 'docker build . -t masterapache'
                        sh 'docker run -itd --name AS5 -p 82:80 masterapache'

                }
             
            }
        }
    }
}
