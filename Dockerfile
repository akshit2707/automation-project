FROM openjdk:19
EXPOSE 8080
ADD target/devops-automation.jar devops-automation.jar
ENTRYPOINT ["java","-jar","/devops-automation.jar"]
