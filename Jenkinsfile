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
                withSonarQubeEnv('SonarQubeServer') {
                    // Adding the login token directly ensures the scan is authorized
                    sh 'mvn sonar:sonar \
                        -Dsonar.projectKey=test-app \
                        -Dsonar.projectName="Thesis-Test-App" \
                        -Dsonar.login= sqa_2a7831f98d0f91c3990b230c4fb1e5403cff308d' 
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
