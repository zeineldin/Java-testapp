FROM maven:3.5.2-jdk-8-alpine AS MAVEN
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn package
 
FROM tomcat:9.0-jre8-alpine
COPY --from=MAVEN /tmp/target/devops-devopsarea-1.0 $CATALINA_HOME/webapps/devops-devopsarea-1.0
##HEALTHCHECK --interval=1m --timeout=3s CMD wget --quiet --tries=1 --spider http://localhost:8080/wizard/ || exit 1
