# DevOpsArea Sample Java App -example
Build war with maven and DevOpsArea framework

Steps:

1. Clone the repository to your local machine
2. The Dockerfile will do.

   A. Create maven container 
      copy pom.xml to /tmp 
      copy folder "src" to /tmp/src 
      Go to /tmp folder then run "mvn package"
      The previos command will generate devopsarea-01.war
   B. Create tomcat container
      Will move the file devopsarea-01.war from maven container to /webapp in tomcat contaner
      Do health check to make sure that the artifact is deployed

3. Run 'docker build -t devopsarea .'  -->  will create a Docker image called devopsarea
4. Run 'docker run -d -p 8080:8080 --name devopsarea-sample-java-app devopsarea' # will create a container called devopsarea-sample-java-app and will forward the container internal port 8080 to locathost 8080 in the hosted machine 
 
5. Open [http://localhost:8080/devopsarea-1.0/](http://localhost:8080/devopsarea-1.0/) in your browser
