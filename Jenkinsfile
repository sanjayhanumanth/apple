pipeline {
    agent any

    environment {
        IMAGE_NAME = "apple-app"
        CONTAINER_NAME = "apple-container"
    }

    stages {

        stage('Checkout Code') {
            steps {
                echo 'Code already checked out by SCM'
            }
        }

        stage('Build Docker Image (with Tests)') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh '''
                docker stop $CONTAINER_NAME || true
                docker rm $CONTAINER_NAME || true
                '''
            }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                docker run -d -p 3000:3000 --name $CONTAINER_NAME $IMAGE_NAME
                '''
            }
        }

        stage('Verify') {
            steps {
                sh 'docker ps'
            }
        }
    }

    post {
        success {
            echo '✅ Deployment Successful!'
        }
        failure {
            echo '❌ Build Failed (Test Failed or Build Error)'
        }
    }
}