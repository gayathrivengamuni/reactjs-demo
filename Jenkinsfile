pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = 'sravanaboyanagaythri/dev-repo'
    }

    stages {
        stage('Build') {
            steps {
                script {
                    sh 'chmod +x build.sh'  
                    sh 'bash build.sh'
                }
            }
        }

        stage('Deploy to Dev') {
            when {
                branch 'dev'
            }
            steps {
                script {
                    sh 'bash deploy.sh'
                }
            }
        }

        stage('Deploy to Prod') {
            when {
                branch 'master'
            }
            steps {
                script {
                    // Tag the image for prod repository
                    sh "docker tag $reactjs-demo $reactjs-demo:prod"
                    
                    // Login to Docker Hub (prod repo)
                    sh "echo \"$DOCKER_PASSWORD\" | docker login -u \"$sravanaboyanagayathri\" --password-stdin"
                    
                    // Push the image to prod repository
                    sh "docker push $reactjs-demo:prod"
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}

