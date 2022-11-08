## Installation of Jenkins on EC2 Instance



Run the command to update all the packages.

sudo yum update

ii. Check if java is installed or not using the command

java -version

If java is not installed, install using the following command
 yum install java
 yum revmove java

amazon-linux-extras install epel 
amazon-linux-extras install java-openjdk11  


iii. Now, to download the latest Jenkins package

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo


**iv. **To enable the installation of the package, import the key file from Jenkins-CI:

	sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

v. Install Jenkins on the EC2 instance

sudo yum install jenkins

vi. To start the Jenkins service

sudo service jenkins start

vii. Access the Jenkins server using the public DNS of the EC2 instance or public IP of the instance on port 8080.

http://{ec2-public-dns}:8080


viii. Login using the username admin and to get the initial admin password execute the following command:
sudo su -
cd /var/lib/jenkins/secrets/ 
cat initialAdminPassword

ix. To stop Jenkins service

sudo service jenkins stop


## Update jenkins port

 sudo vi /usr/lib/systemd/system/jenkins.service
 
 Environment="JENKINS_PORT=8090"
 




# Spring Boot Actuator: Health, Auditing, Metrics Gathering and Monitoring 

## Tutorials 

1. [Spring Boot Actuator: Health check, Auditing, Metrics gathering and Monitoring](https://www.callicoder.com/spring-boot-actuator/)
2. [Spring Boot Actuator metrics monitoring with Prometheus and Grafana](https://www.callicoder.com/spring-boot-actuator-metrics-monitoring-dashboard-prometheus-grafana/)

## Steps to Setup

**1. Clone the application**

```bash
git clone https://github.com/callicoder/spring-boot-actuator-demo.git
```

**2. Build and run the app using maven**

```bash
mvn package
java -jar target/actuator-demo-0.0.1-SNAPSHOT.jar
```

Alternatively, you can run the app directly without packaging like this -

```bash
mvn spring-boot:run
```

The app will start running at <http://localhost:8080>.

## Explore Actuator Endpoints

All the actuator endpoints will be available at <http://localhost:8080/actuator>.

Some of the actuator endpoints are protected with Spring Security's HTTP Basic Authentication. You can use the username `actuator` and password `actuator` for http basic authentication.
