pipeline {
    agent any 
    tools {
        maven 'Maven 3.3.9'
        jdk 'jdk8'
    }
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
                sh 'mvn -Dmaven.test.failure.ignore=true install' 

            }
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
            //====
            script {
            // Define Variable
                def USER_INPUT = input(
                    message: 'User input required - Some Yes or No question?',
                    parameters: [
                            [$class: 'ChoiceParameterDefinition',
                             choices: ['Dev','Stg','Prod'].join('\n'),
                             name: 'input',
                             description: 'Menu - select box option']
                    ])

                echo "The answer is: ${USER_INPUT}"

                if( "${USER_INPUT}" == "Dev"){
                //do something
                  echo 'the answer is Dev'
                }
                if( "${USER_INPUT}" == "Stg"){
                //do something
                  echo 'the answer is Stg'
                }
                if( "${USER_INPUT}" == "Prod"){
                //do something
                  echo 'the answer is Prod'
                }
                
                //} else {
                //do something else
                //  echo 'the answer is not yes'
                //}
            }
        }
        }
            //===
            
         //   steps {
         //       echo 'testing stage '
                
         //   }
       // }
        
        stage('deploy') {
            steps {
                echo 'Deployment Stage'
            }
        }
    }
}
