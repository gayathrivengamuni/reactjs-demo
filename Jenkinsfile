pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'sh build.sh'
            }
        }
        stage('Deploy to Dev') {
            when {
                branch 'dev'
            }
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dev-docker-hub-credentials') {
                        sh 'docker tag your-image-name:latest dev-repo/your-image-name:latest'
                        sh 'docker push dev-repo/your-image-name:latest'
                    }
                }
            }
        }
        stage('Deploy to Prod') {
            when {
                branch 'master'
            }
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'prod-docker-hub-credentials') {
                        sh 'docker tag your-image-name:latest prod-repo/your-image-name:latest'
                        sh 'docker push prod-repo/your-image-name:latest'
                        steps {
                script {
                    // Deploy to application server
                    
                    sh 'chmod 777 deploy.sh'
                    sh './deploy.sh'
                }
            }
                    }
                }
            }
        }
    }
}
