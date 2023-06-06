pipeline{
    agent any
    tools { maven 'maven' }
  stages{
    
      stage("build"){
         steps{
             sh 'mvn clean install validate compile'
             echo " I'm building the app "
         }}
     stage("Test"){
          steps{
              sh 'mvn verify test'
              echo " I'm testing the app "
          }}
      stage("Test quality"){
         steps{
             withSonarQubeEnv('sonarqube') {
                sh 'mvn sonar:sonar -Dsonar.login="admin" -Dsonar.password="admin123"'
                echo " I'm testing the quality of the app "
         }   } }
      stage("nexus-deloy"){
          steps{
           /*   script {
                    pom = readMavenPom file: "pom.xml";
                    filesByGlob = findFiles(glob: "target\\/*.${pom.packaging}");
                    artifactPath = filesByGlob[0].path;
         nexusArtifactUploader (
          nexusVersion: "nexus3", protocol: "http", nexusUrl: "localhost:8081", groupId: pom.groupId , version: pom.version,
          repository: "my-script-new-app", credentialsId: "nexus_pfe_key",
          artifacts:[
            [artifactId: pom.artifactId, type: pom.packaging, file: artifactPat]]);
        }*/
              withCredentials ([usernamePassword(credentialsId: 'nexus_pfe_key', passwordVariable: 'admin', usernameVariable: 'arij')]) {
                  sh ' tar -cjf my_app.tgz $PWD/target/*.jar '
                  sh 'Fichier = "my_app.tgz"'
                  sh ' Path_nexus = "http://192.168.1.141:8081/repository/depot_soutenance/"'
                  sh 'curl -k -u admin:admin --upload-file "$Fichier" "$Path_nexus"'    
              } }  }

}
}
