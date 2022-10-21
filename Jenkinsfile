


pipeline {
    /* insert Declarative Pipeline here */
    agent any
/*agent {
    node {
        label 'slave'
    }
}*/
  tools {
        maven 'maven354' 
        git 'git'


    }

stages{
    stage("clean setup"){
        steps {
            deleteDir()
        }
    }
        
    stage("git pull"){
        steps {
            sh 'git clone https://github.com/deepakharsha524/sprint_actuator.git'
        }
    }

         stage("maven install "){
         steps {
            dir("sprint_actuator"){
                 sh 'mvn package'
            }
         }
         
    }
    stage("Build Docker image "){
         steps {
            dir("sprint_actuator"){
                 sh 'mvn package'
            }
         }
      
    }
	  stage("AWS setup "){
         steps {
             
             withCredentials([[
                $class: 'AmazonWebServicesCredentialsBinding',
                credentialsId: 'aws_cred',
                accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
            ]]) {
                dir("sprint_actuator"){
                sh '''
                ls -lrth target/
                docker login -u AWS https://160988286701.dkr.ecr.us-east-1.amazonaws.com -p $(aws ecr get-login-password --region us-east-1)
                docker build -t customapache .
                docker tag customapache:latest 160988286701.dkr.ecr.us-east-1.amazonaws.com/customapache:$BUILD_NUMBER
                docker push 160988286701.dkr.ecr.us-east-1.amazonaws.com/customapache:$BUILD_NUMBER
                '''
                }
                
            }
                       
         }
         
    }

    
}

}
