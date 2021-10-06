pipeline {
    agent any 
    stages {
        stage('build') {
            
            steps {
                echo 'Building stage'
                sh 'echo "I can access $BUILD_NUMBER in shell command as well."'
                
            }
        }
        stage('test') {
            
            steps {
                echo 'testing stage '
                
            }
        }
        
        stage('deploy') {
            steps {
                echo 'Deployment Stage'
            }
        }
    }
}
