FROM tomcat:8-jdk8
COPY target/maven-web-application*.war /usr/local/tomcat/webapps/maven-web-application.war
