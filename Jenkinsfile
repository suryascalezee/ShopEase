pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
        IMAGE_NAME_FRONTEND = 'suryascalezee/shopease-frontend'
        IMAGE_NAME_BACKEND = 'suryascalezee/shopease-backend'
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Images') {
            steps {
                script {
                    sh 'docker build -t $IMAGE_NAME_FRONTEND ./frontend'
                    sh 'docker build -t $IMAGE_NAME_BACKEND ./backend'
                }
            }
        }

        stage('Push Docker Images') {
            steps {
                withDockerRegistry(credentialsId: 'dockerhub-credentials', url: '') {
                    sh 'docker push $IMAGE_NAME_FRONTEND'
                    sh 'docker push $IMAGE_NAME_BACKEND'
                }
            }
        }

        stage('Deploy via ArgoCD') {
            steps {
                echo 'Triggering deployment via ArgoCD...'
                // Uncomment and configure this line once ArgoCD CLI is set up
                // sh 'argocd app sync shopease'
            }
        }
    }
}
