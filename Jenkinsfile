pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('sravanaboyanagayathri')
    }

    stages {
        stage('Build and Push Dev Image') {
            when {
                changeset "*/dev"
            }
            steps {
                script {
                    echo 'Building and pushing dev Docker image...'
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_HUB_CREDENTIALS) {
                        def imageName = "dev-repo/your-image-name:latest"
                        docker.build(imageName, '.')
                        docker.image(imageName).push()
                    }
                }
            }
        }

        stage('Build and Push Prod Image') {
            when {
                changeset "*/master"
            }
            steps {
                script {
                    echo 'Building and pushing prod Docker image...'
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_HUB_CREDENTIALS) {
                        def imageName = "prod-repo/your-image-name:latest"
                        docker.build(imageName, '.')
                        docker.image(imageName).push()
                    }
                }
            }
        }
    }
}
