pipeline {
    agent any

    stages {
        stage('Maven Build') {
            steps {
                // 'package' creates the .jar file in the target/ folder
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQubeServer') {
                    // Using double quotes for the sh command and single quotes for values
                    sh "mvn sonar:sonar \
                        -Dsonar.projectKey='test-app' \
                        -Dsonar.projectName='Thesis-Test-App' \
                        -Dsonar.token='sqa_2a7831f98d0f91c3990b230c4fb1e5403cff308d'"
                }
            }
        }

        stage('Docker Build') {
            steps {
                // Builds the Docker image from your Dockerfile
                sh 'docker build -t hello-world-app:latest .'
            }
        }

      stage('Trivy Image Scan') {
            steps {
                // --exit-code 0: The pipeline continues even if vulnerabilities are found.
                // --severity HIGH,CRITICAL: Focuses only on the most important risks.
     stage('Trivy Image Scan') {
    steps {
        sh 'trivy image --scanners vuln --severity HIGH,CRITICAL --format table hello-world-app:latest'
    }
}
       
        
    }
}
