pipeline {
    agent any

    tools {
        maven 'maven-3' 
    }

    stages {
        stage('Maven Build') {
            steps {
                sh 'mvn clean compile'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t hello-world-app:latest .'
            }
        }

        stage('Trivy Image Scan') {
            steps {
                sh 'trivy image --severity HIGH,CRITICAL hello-world-app:latest'
            }
        }
    }
}
