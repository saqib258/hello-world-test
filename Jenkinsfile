pipeline {
    agent any
    
    tools {
        maven 'maven-3' // Ensure this matches your Jenkins Global Tool Configuration name
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/saqib258/hello-world-test.git'
            }
        }

        stage('Maven Build') {
            steps {
                sh 'mvn clean compile'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                // This assumes you have a SonarQube server running
                echo "Running Static Application Security Testing (SAST)..."
                // sh 'mvn sonar:sonar' 
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t hello-world-app:latest .'
            }
        }

        stage('Trivy Image Scan') {
            steps {
                echo "Scanning Docker Image for vulnerabilities..."
                sh 'trivy image --severity HIGH,CRITICAL hello-world-app:latest'
            }
        }
    }
}
