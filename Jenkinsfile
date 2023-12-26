pipeline {
    agent any
    environment {
        DOCKER_IMAGE_NAME = "mzain/nightwolf"
    }

    stages {
      stage('Clone repository') {  
        steps {
        checkout scm
    }
      }


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
                    //    customImage.push("latest")
                    
                    }
                }
            }
   }
   
      stage('Update GIT') {
       steps {     
       script {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                        //def encodedPassword = URLEncoder.encode("$GIT_PASSWORD",'UTF-8')
                        sh "git config user.email eng.mohamed.zeineldin@gmail.com"
                        sh "git config user.name zeineldin"
                        //sh "git switch master"
                        sh "rm -rf Argo-CD"
                        sh "git clone https://github.com/zeineldin/Argo-CD.git"
                       // sh "cd Argo-CD"
                        sh "cat Argo-CD/app/deployment.yaml"
                        sh "sh artifact_version_update Argo-CD/app/deployment.yaml"
                        sh "cat Argo-CD/app/deployment.yaml"
                        sh "git add ."
                        sh "git commit -m 'Done by Jenkins Job changemanifest: ${env.BUILD_NUMBER}'"
                        sh "git push -f https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/${GIT_USERNAME}/Argo-CD.git HEAD:zein"
      }
      }
    }
  }
 }
}  
}
