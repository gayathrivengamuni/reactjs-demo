pipeline {
    agent any // run on any available agent
    stages {
        stage('Install') { // install dependencies
            steps {
                sh 'npm install' // run npm install command
            }
        }
        stage('Test') { // run tests
            steps {
                sh 'npm test' // run npm test command
            }
        }
        stage('Build') { // build the app
            steps {
                sh 'npm run build' // run npm run build command
            }
        }
    }
}
