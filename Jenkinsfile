pipeline {
    agent any  // Sử dụng agent bất kỳ (có thể là docker hoặc node)
    
    environment {
        DOCKER_IMAGE = "duyhv1411/fastapi-cicd:latest"
        DOCKER_CREDENTIALS = credentials('docker-hub-credentials') // Tạo credentials trong Jenkins (xem dưới)
    }

    stages {
        stage('Checkout') {
            steps {
                // Lấy mã nguồn từ GitHub
                git 'https://github.com/hoduy1411/fastapi-cicd.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // Đăng nhập vào Docker Hub
                    withDockerRegistry([credentialsId: 'docker-hub-credentials', url: 'https://index.docker.io/v1/']) {
                        // Push Docker image lên Docker Hub
                        docker.image(DOCKER_IMAGE).push()
                    }
                }
            }
        }
    }
}