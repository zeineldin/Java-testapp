node {
    def app

    stage('Clone repository') {
      

        checkout scm
    }

    stage ('check commit tag1 ') {
        
         sh 'git rev-parse HEAD | cut -c -7'

         // Display the variable using scmVars
      echo "scmVars.GIT_COMMIT"
      echo "${scmVars.GIT_COMMIT}"


        
        
    }    


    stage('Build image') {
  
       app = docker.build("mzain/test")
    }

    stage('Test image') {

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        
        docker.withRegistry('https://registry.hub.docker.com', 'docker') {
            
            app.push("${env.GIT_COMMIT}")
        }
    }
    
//    stage('Trigger ManifestUpdate') {
//                echo "triggering updatemanifestjob"
//                build job: 'updatemanifest', parameters: [string(name: 'DOCKERTAG', value: env.BUILD_NUMBER)]
//       }
}
