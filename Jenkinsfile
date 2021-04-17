node ('master') {

   def mavenHome = tool name: "maven3.6.3"
   
 //properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), pipelineTriggers([pollSCM('* * * * *')])])
 
 stage('git')
 {
  git credentialsId: '932a8b1a-c0e0-4115-b5bf-18f6222a96bb', url: 'https://github.com/barathKawin/maven-web-application.git'
 }
 
stage('build')
 {
  sh "${mavenHome}/bin/mvn clean package"
 }
 
 stage('sonar')
 {
 sh "${mavenHome}/bin/mvn sonar:sonar"
 }
 
 stage('Nexus')
 {
 sh "${mavenHome}/bin/mvn deploy"
 }

 stage('tomcat')
 {
 sshagent(['330432ff-d727-4ffe-9db7-65782a3166e9']) {
    //sh 'sudo chmod o+wx /opt/apache-tomcat-9.0.45/webapps/'
    sh "scp -o StrictHostKeyChecking=no target/maven-web-application-1.1.1.war ec2-user@13.234.186.239:/opt/apache-tomcat-9.0.45/webapps/"
    }
  }
  
 stage('Gmail')
 {
 emailext body: 'PFA status', subject: 'Status', to: 'barathkawin85@gmail.com'
 }

}
