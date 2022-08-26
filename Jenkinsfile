pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS=credentials('Docker-Creds')
    }
    stages {
        stage('Repo') {
            steps {
                git 'https://github.com/RaghavShetty78/maven-enterprise-application.git'
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
		stage('Login') {
			   steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			    }
		}
        stage('docker-build') {
            steps {
                sh "sudo docker build -t=""raghavshetty/maven-app:$BUILD_NUMBER ."
                sh "sudo docker build -t=""raghavshetty/maven-app:latest ."
            }
        }
		stage('Push') {
			  steps {
				  sh "sudo docker push raghavshetty/maven-app:$BUILD_NUMBER"
                  sh "sudo docker push raghavshetty/maven-app:latest"
			  }
		  }
    post {
		always {
			sh 'docker logout'
		}
	}

    }
}
