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
stage('SonarQube Analysis') {
            steps {
                // 'SonarQubeServer' must match the name in Manage Jenkins > System
                withSonarQubeEnv('SonarQubeServer') {
                    sh 'mvn sonar:sonar \
                        -Dsonar.projectKey=test-app \
                        -Dsonar.projectName="Thesis-Test-App"'
                }
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t hello-world-app:latest .'
            }
        }


/*      
stage('Trivy Image Scan') {
    steps {
        sh 'trivy image --severity HIGH,CRITICAL hello-world-app:latest'
    }
}
*/
    }
}
