node {
    cleanWs()
    def mvnHome
    def server = Artifactory.server 'art'


    stage('Preparation') { // for display purposes
        // Get some code from a GitHub repository
        git 'https://github.com/zeineldin/Java-testapp.git'
        // Get the Maven tool.
        // ** NOTE: This 'M3' Maven tool must be configured
        // **       in the global configuration.
        mvnHome = tool 'devops'
    }

    stage('Build') {
        // Run the maven build
        withEnv(["MVN_HOME=$mvnHome"]) {
            if (isUnix()) {
                sh '"$MVN_HOME/bin/mvn" clean install'
            } else {
                bat(/"%MVN_HOME%\bin\mvn" -Dmaven.test.failure.ignore clean package/)
            }
        }
    }
    
   //----> 
   //   stage('Build Docker image') {
             //steps {    // Run Maven on a Unix agent.
    //            sh "docker build -t mzain/testapp:v1 . "
            //}
            
   //     }
   //---->
    stage('sleep') {
    sh 'sleep 20' 
    }
    
           stage ('Code analyse') {
            sh 'echo “Run some lints”'
            }
    
    
    

         stage('push to DockerHub') {
            //steps { 
            withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'password', usernameVariable: 'username')]) {
    // some block
            sh "docker login -u=$username -p=${password}"
            sh 'docker push mzain/testapp:v1'
            //}
         }
             
         }
   

       
     stage('stage1'){
             
            sh  '''    
            echo "Commit $(git rev-parse HEAD) | cut -c-6 "
            '''                  
        
    }
         
       
    
    
    
    stage('upload to artifatory') {
       def uploadSpec = """{
    "files": [{
                "pattern": "target/*.war",
                "target": "libs-snapshot-local"
            }
        ]
    }"""

  server.upload(uploadSpec)
  }
  }
