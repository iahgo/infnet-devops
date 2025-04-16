pipeline {
    agent any

    environment {
        // Utilize a imagem iahgo/infnet:latest conforme definido
        DOCKER_IMAGE = "iahgo/infnet:latest"
        // Substitua 'dockerhub-username' e 'dockerhub-password' pelas credenciais configuradas
        DOCKER_HUB_USER = credentials('dockerhub-username')  // Informe seu nome de usuário Docker Hub, se não estiver definido, crie essa credencial no Jenkins
        DOCKER_HUB_PASS = credentials('dockerhub-password')  // Informe sua senha ou token do Docker Hub
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }
        stage('Push Docker Image') {
            steps {
                sh """
                   echo ${DOCKER_HUB_PASS} | docker login -u ${DOCKER_HUB_USER} --password-stdin
                   docker push ${DOCKER_IMAGE}
                """
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh "kubectl apply -f kubernetes/ --validate=false"
            }
        }
    }
}
