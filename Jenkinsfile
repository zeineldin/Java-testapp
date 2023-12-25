pipeline {
    agent any
    environment {
        DOCKER_IMAGE_NAME = "mzain/test"
    }

node {
    def app

    stage('Clone repository') {
      
        checkout scm
    }

  //  stage('Build image') {
  //     app = docker.build("mzain/test")
  //  }

 //   stage('Test image') {
   //     app.inside {
   //         sh 'echo "Tests passed"'
  //      }
  //  }

   // stage('Push image') {        
   //  docker.withRegistry('https://registry.hub.docker.com', 'docker') {
   //         app.push("${env.BUILD_NUMBER}")
   //     }
  //  }

    stage('Test and Build Docker Image') {
            
            steps {
                script {
                    env.GIT_COMMIT_REV = sh (script: 'git log -n 1 --pretty=format:"%h"', returnStdout: true)
                    customImage = docker.build("${DOCKER_IMAGE_NAME}:${GIT_COMMIT_REV}")
                    }
                    }
                    }
                                               
                                               
   stage('Push Docker Image') {
        
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker') {
                        customImage.push("${GIT_COMMIT_REV}")
                        customImage.push("latest")
                    }
                }
            }
   }

                


    
     stage('Update GIT') {
            script {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                        //def encodedPassword = URLEncoder.encode("$GIT_PASSWORD",'UTF-8')
                        sh "git config user.email eng.mohamed.zeineldin@gmail.com"
                        sh "git config user.name zeineldin"
                        //sh "git switch master"
                        sh "cat k8s/deployment.yaml"
                        sh "sh artifact_version_update k8s/deployment.yaml "
                        sh "cat k8s/deployment.yaml"
                        sh "git add ."
                        sh "git commit -m 'Done by Jenkins Job changemanifest: ${env.BUILD_NUMBER}'"
                        sh "git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/${GIT_USERNAME}/Java-testapp.git HEAD:zein"
      }
    }
  }
}



}
