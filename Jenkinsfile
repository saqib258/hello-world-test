pipeline {
    agent any

    tools {
        maven 'maven-3' 
    }

   stage('Maven Build') {
            steps {
                // Change 'compile' to 'package' to generate the JAR
                sh 'mvn clean package -DskipTests' 
            }
        }
stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQubeServer') {
                    sh 'mvn sonar:sonar \
                        -Dsonar.projectKey=test-app \
                        -Dsonar.projectName="Thesis-Test-App" \
                        -Dsonar.token="sqa_2a7831f98d0f91c3990b230c4fb1e5403cff308d"'
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
