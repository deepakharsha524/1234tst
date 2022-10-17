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
    }

stages{
    stage("clean setup"){
        steps {
            deleteDir()
        }
    }
        
    stage("git pull"){
        steps {
            sh 'git clone https://github.com/deepakharsha524/sprint_actuator'
        }
    }
     stage("maven test"){
         steps {
            dir("sprint_actuator"){
                 sh 'mvn test'
            }
         }
         
    }
         stage("maven install "){
         steps {
            dir("sprint_actuator"){
                 sh 'mvn clean install'
            }
         }
         
    }

    
}

}
