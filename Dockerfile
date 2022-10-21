FROM openjdk:18-jdk-slim
COPY target/actuator-demo-0.0.1-SNAPSHOT.jar /opt/actuator-demo-0.0.1-SNAPSHOT.jar
EXPOSE 8443
ENTRYPOINT ["/bin/sh", "-c", "java -jar /opt/actuator-demo-0.0.1-SNAPSHOT.jar"]
