 pipeline {
    agent {
        docker {
            image 'my-apache-server'
            args '-p 82:80'
        }
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the Git repository
                checkout scm
            }
        }

        stage('Build') {
            when {
                // Only build if the commit is made to the master or develop branch
                expression { currentBuild.changeSets.any { it.branch == 'origin/master' || it.branch == 'origin/develop' } }
            }
            steps {
                // Build your code here
                sh 'docker build -t my-apache-server .'
            }
        }

        stage('Publish to Port 82') {
            when {
                // Only publish if the commit is made to the master branch
                expression { currentBuild.changeSets.any { it.branch == 'origin/master' } }
            }
            steps {
                // Publish to port 82 (you may need additional commands here)
                sh 'docker run -d -p 82:80 my-apache-server'
            }
        }
    }
}
