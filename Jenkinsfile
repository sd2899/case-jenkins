 pipeline {
    agent any
  
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the Git repository
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Build your code here
                sh 'sudo docker build -t my-apache-server .'
            }
        }

        stage('Publish to Port 82') {
            when {
                // Only publish if the commit is made to the master branch
                expression { currentBuild.changeSets.any { it.branch == 'origin/master' } }
            }
            steps {
                // Publish to port 82 (you may need additional commands here)
                sh 'sudo docker run -d -p 82:80 my-apache-server'
            }
        }
    }
}
