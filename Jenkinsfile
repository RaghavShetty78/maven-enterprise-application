pipeline {
    
    agent any
    
    stages {
        stage('Repo') {
            steps {
                git 'https://github.com/MithunTechnologiesDevOps/maven-enterprise-application.git'
            }
        }
        stage('maven-build') {
            steps { 
                sh "mvn clean install"
            }
        }
        stage('maven-deploy') {
            steps {
                sh "mvn deploy -DaltDeploymentRepository=demo::default::http://13.233.154.198:8081/repository/demo/"
            }
        } 
    }
}
