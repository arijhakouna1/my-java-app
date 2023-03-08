FROM anapsix/alpine-java
COPY /target/my-app-1.0-SNAPSHOT.jar /var/jenkins_home/workspace/my-script-new-try/my-app-1.0-SNAPSHOT.jar
CMD ["java","-jar","/var/jenkins_home/workspace/my-script-new-try/my-app-1.0-SNAPSHOT.jar"]
EXPOSE 4523
