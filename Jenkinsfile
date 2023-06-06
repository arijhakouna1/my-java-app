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
           withCredentials ([usernamePassword(credentialsId: 'nexus_pfe_key', passwordVariable: 'arij', usernameVariable: 'admin')]) {
                  sh 'curl -k -u admin:arij --upload-file /var/jenkins_home/workspace/my_project/target/my-app-1.0-SNAPSHOT.jar -x POST http://192.168.1.141:8081/repository/depot_soutenance/'
               echo " I'm pushing to nexus "
              } }  }

}
}
