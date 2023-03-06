pipeline{
  
    agent any
  
  stages{
    
    stage("check out code"){
    
      steps{
        with
      
      
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
