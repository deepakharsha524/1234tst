FROM openjdk:18-jdk-slim
copy /var/lib/jenkins/workspace/Spring_pipeline@2/sprint_actuator/target/actuator-demo-0.0.1-SNAPSHOT.jar /opt/actuator-demo-0.0.1-SNAPSHOT.jar
EXPOSE 8443
ENTRYPOINT ["/bin/sh", "-c", "java -jar /opt/actuator-demo-0.0.1-SNAPSHOT.jar"]
