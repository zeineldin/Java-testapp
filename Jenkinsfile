pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "devops"
    }

    stages {
        stage('Check out the code') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/zeineldin/Java-testapp.git'
            }
        }
        stage('Build with maven') {
             steps {    // Run Maven on a Unix agent.
                sh "mvn clean package"
            }
                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }
            
        stage('Build Docker image') {
             steps {    // Run Maven on a Unix agent.
                sh "docker build -t mzain/testapp:v1 . "
            }
            
        }
  // }
         stage('push to DockerHub') {
            steps { 
            withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'password', usernameVariable: 'username')]) {
    // some block
            sh "docker login -u=$username -p=${password}"
            sh 'docker push mzain/testapp:v1'
            }
         }
             
         }
  
  }
}
         
