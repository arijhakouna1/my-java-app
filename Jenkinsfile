pipeline{
  
    agent any
  
    triggers {
        cron('*/1 * * * *')
    }
  
    tools {
       maven 'apache-maven-3.9.0'
    }
  
  stages{
    
    stage("check out code"){
    
      steps{
        checkout scmGit(branches: [
                        [name: '*/master']],
                        extensions: [], 
                        userRemoteConfigs: [[credentialsId: 'jenkins-git', 
                        url: 'git@github.com:arijhakouna1/my-java-app.git']])
      
      }
    
    }
    
    stage("build"){
      
      steps{
      
        sh 'mvn clean install validate'
        echo " I'm building the app "
      
      }
   
    }
    
    stage("Test"){
      
      steps{
      
        sh 'mvn verify test'
        echo " I'm testing the app "
      
      }
   
    }
    
    stage("Test quality"){
      
      steps{
        withSonarQubeEnv('sonarqube') {
           sh 'mvn sonar:sonar'
           echo " I'm testing the quality of the app "
         }  
       
      
      }
   
    }
    
  
    stage("nexus-deloy"){
    
      steps{
        script {
                    pom = readMavenPom file: "pom.xml";
                    filesByGlob = findFiles(glob: "target/*.${pom.packaging}");
                    artifactPath = filesByGlob[0].path;
        
        nexusArtifactUploader (
          nexusVersion: "nexus3",
          protocol: "http",
          nexusUrl: "192.168.1.178:8081",
          groupId: pom.groupId ,
          version: pom.version,
          repository: "maven-releases",
          credentialsId: "nexus-connection",
          artifacts:[
            artifactId: pom.artifactId,
            type: pom.packaging,
            file: artifactPath],
          [artifactId: pom.artifactId,
           classifier: '',
           file: "pom.xml",
           type: "pom"]]);
      
        }
      }
    }
  
  }  
  




}
