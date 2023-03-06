pipeline{
  
    agent any
    
  
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
    
  
    stage("nexus-deloy"){
    
      steps{
        
        nexusArtifactUploader (
          nexusVersion : 'nexus 3',
          protocol : 'http',
          nexusUrl : 'localhost:8081',
          groupId : 'com.mycompany.app' ,
          version : '1.0-SNAPSHOT',
          repository : 'raoua' ,
          credentialsId : 'nexus-connection' ,
          artifacts : [
            artifactId : 'my-app' ,
            type : 'jar' ,
            file : 'my-app/target/my-app.jar']);
      
      
      }
    }
  
  }  
  




}
