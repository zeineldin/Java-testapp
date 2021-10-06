pipeline {
    agent any 
    stages {
        stage('input') {
         input {
                message "Should we continue?"
                ok "Yes, we should."
                submitter "alice,bob"
                parameters {
                    string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
             
                }
            }
         steps {
                echo "Hello, ${PERSON}, nice to meet you."
            }
        stage('build') {
            
            steps {
                echo 'Building stage'
                sh 'echo "I can access $BUILD_NUMBER in shell command as well."'
                sh 'echo "The branch name is $BRANCH_NAME in shell command as well."'
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
