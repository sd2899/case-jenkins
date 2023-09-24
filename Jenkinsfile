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
                        b= env.BRANCH_NAME
                        echo $b
                        id = sh 'docker build . -t masterapache'
                        sh 'docker run -it -d --name c1 -p 82:80 $id'
                    }
                    else if (env.BRANCH_NAME == 'develop') {
                        b= env.BRANCH_NAME
                        echo $b
                        sh 'docker build . -t developapache'
                        exit
                    }
                }
            }
        }
    }
}
