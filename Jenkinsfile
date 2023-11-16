pipeline {
    agent any

    stages {
        stage('Print Environment Variables') {
            steps {
                script {
                    echo "BRANCH_NAME: ${env.BRANCH_NAME}"
                    echo "DOCKER_HUB_USERNAME: ${env.DOCKER_HUB_USERNAME}"
                }
            }
        }

        stage('Switching to Branch') {
            steps {
                script {
                    def branch = env.BRANCH_NAME ?: 'master'
                    echo "Switching to branch: ${branch}"

                    git branch: branch,
                        url: 'https://github.com/gayathrivengamuni/reactjs-demo.git'
                }
            }
        }

        stage('Building & Pushing to DockerHub') {
            steps {
                script {
                    def repoName = env.DOCKER_HUB_USERNAME ? "${env.DOCKER_HUB_USERNAME}/${env.BRANCH_NAME}" : 'sravanaboyanagayathri/master'

                    sh 'chmod 777 build.sh'
                    sh './build.sh'

                    withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
                        sh "docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD"
                        sh "docker tag react-capstone-t $repoName"
                        sh "docker push $repoName"
                    }
                }
            }
        }

        stage('Deploying to Application Server') {
            agent {
                label 'slave'
            }
            steps {
                script {
                    // Conditional deployment based on the branch
                    if (env.BRANCH_NAME == 'master') {
                        sh 'chmod 777 deploy.sh'
                        sh './deploy.sh'
                    } else {
                        echo "Skipping deployment for branch ${env.BRANCH_NAME}"
                    }
                }
            }
        }
    }

    post {
        failure {
            mail to: 'your-email@example.com', subject: 'Pipeline Failed', body: "Pipeline failed on ${env.BRANCH_NAME} branch. Check Jenkins for details."
        }
    }
}
