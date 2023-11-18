pipeline {
    agent any

    

    stages {
        stage('Build') {
            steps {
                script {
                    sh 'chmod +x deploy.sh'  
                    sh './deploy.sh'
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

