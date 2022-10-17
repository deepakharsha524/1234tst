pipeline {
    /* insert Declarative Pipeline here */
    
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
            sh 'git clone https://github.com/jenkins-docs/simple-java-maven-app.git'
        }
    }
     stage("maven test"){
         steps {
            dir("simple-java-maven-app"){
                 sh 'mvn test'
            }
         }
         
    }
         stage("maven install "){
         steps {
            dir("simple-java-maven-app"){
                 sh 'mvn clean install'
            }
         }
         
    }

    
}

}
